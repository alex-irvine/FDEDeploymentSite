using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Administration;
using Administration.ServiceReference1;
using Dropbox.Api;
using System.IO;
using Dropbox.Api.Files;
using System.Windows.Forms;
using System.Threading.Tasks;
using System.Text;
using System.Net;
using System.Web.Services;
using Services.Model;


namespace Administration
{
    public partial class Software : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            System.Diagnostics.Debug.WriteLine("Test");
            
        }

        async Task<int> Upload()
        {
            using (Service1Client client = new Service1Client())
            {
                GetFileRecordResponse dbxKey = client.GetFileRecord();

                if (dbxKey.Errored)
                {
                    // handle no key error
                    return -1;
                }
                string logoPath = Server.MapPath("~/");
                string filename = FileInput.FileName;

                FileInput.SaveAs(logoPath + filename);
                // upload file before updating record (legacy dl requests handled)
                using (var dbx = new DropboxClient(SysConfig.DBKey))
                {
                    string folder = Path.GetDirectoryName(Server.MapPath(FileInput.FileName)); // path to containing folder of file to be uploaded
                    string fileName = FileInput.FileName; // name of file to be uploaded
                    //TODO: convert file into FileStream directly from FileInput control
                    //FileStream fs = (FileStream)FileInput.FileContent; // try this way instead of moving file to server access file stream immediately
                    // 128 kb chunks
                    const int chunkSize = 128 * 1024;
                    // create filestream
                    using (FileStream stream = new FileStream(folder + "/" + fileName,
                        FileMode.Open, FileAccess.Read))
                    {
                        // generate information for loop
                        int numChunks = (int)Math.Ceiling((double)stream.Length / chunkSize);
                        byte[] buffer = new byte[chunkSize];
                        string sessionId = null;
                        // chunk sessions


                        System.Diagnostics.Debug.WriteLine(numChunks.ToString());
                        for (int i = 0; i < numChunks; i++)
                        {
                            Console.WriteLine(i.ToString() + " / " + numChunks.ToString());
                            
                            var byteRead = stream.Read(buffer, 0, chunkSize);
                            UploadSessionAppendArg arg = new UploadSessionAppendArg();
                            
                            using (MemoryStream memStream = new MemoryStream(buffer, 0, byteRead))
                            {
                                
                                if (i == 0)
                                {
                                    var result = await dbx.Files.UploadSessionStartAsync(false, memStream);
                                    sessionId = result.SessionId;
                                }
                                else
                                {
                                    var cursor = new UploadSessionCursor(sessionId, (ulong)(chunkSize * i));
                                    Status.Text = i.ToString() + " / " + numChunks.ToString();
                                    System.Diagnostics.Debug.WriteLine(i.ToString() + " / " + numChunks.ToString());
                                    if (i == numChunks - 1)
                                    {
                                        await dbx.Files.UploadSessionFinishAsync
                                            (cursor, new CommitInfo("/" + fileName), memStream);
                                    }
                                    else
                                    {
                                        await dbx.Files.UploadSessionAppendV2Async(cursor, false, memStream);
                                    }

                                }
                            }
                            
                            // provide feedback (progress bar) here
                        }
                        
                    }

                    // file upload finished log new file name
                    InsertFileRecordResponse frResp = client.InsertFileRecord(new InsertFileRecordRequest()
                    {
                        FileName = fileName
                    });

                    // handle errors
                    if (frResp.Errored)
                    {
                        // handle it
                        MessageBox.Show("Error");

                    }

                    // if the file is a new version delete the old version
                    if (frResp.DeleteOldFile)
                    {
                        // untested
                        //dbx.DeleteArg("/" + frResp.OldFileName);

                    }
                    return 0;
                }
            }
        }

        async void Upload_Launch()
        {
            // get dropbox key from current file record
            if (FileInput.HasFile)
            {
                int val = await Upload();
                Bar.Visible = true;
                MessageBox.Show(val.ToString());
            }
            else
            {
                MessageBox.Show("No file selected");
            }
        }

        protected void Upload_Click(object sender, EventArgs e)
        {           
            Upload_Launch();

        }

       

    }
}