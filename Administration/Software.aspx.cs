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


namespace Administration
{
    public partial class Software : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["User"]==null)
            //{
            //    Account.Login.ReturnUrl = "~/Software";
            //    Response.Redirect("~/Account/Login");
            //}
        }

        protected void Upload_Click(object sender, EventArgs e)
        {
            // get dropbox key from current file record
            if (FileInput.HasFile)
            {
                using (Service1Client client = new Service1Client())
                {
                    GetFileRecordResponse dbxKey = client.GetFileRecord();

                    if (dbxKey.Errored)
                    {
                        // handle no key error
                        return;
                    }
                    
                    // upload file before updating record (legacy dl requests handled)
                    using (var dbx = new DropboxClient("G4qoGWDyk1YAAAAAAACTXbIRhucbsIjnww3RP4Mszu2Q6QxcP_TFdO4HYcuIz9Xn"/*SysConfig.DBKey*/))
                    {
                        string folder = Path.GetDirectoryName(Server.MapPath(FileInput.FileName)); // path to containing folder of file to be uploaded
                        string fileName = FileInput.FileName; // name of file to be uploaded

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
                            for (int i = 0; i < numChunks; i++)
                            {
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
                        if (rdResp.DeleteOldFile)
                        {
                            // untested
                            dbx.DeleteArg("/" + rdResp.OldFileName);
                        }
                    }
                }
            }
        }
    }
}