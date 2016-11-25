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
//using System.IO.Directory;
using System.Security.AccessControl;
using System.Security.Principal;
//using System.IO.Stream;

namespace Administration
{
    public partial class Software : System.Web.UI.Page
    {

        public int pValue;

        public bool isAdmin { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            if (!isAdmin)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }


        async Task<int> Upload()
        {
            using (Service1Client client = new Service1Client())
            {
                GetFileRecordResponse dbxKey = client.GetFileRecord();

                if (dbxKey.Errored)
                {
                    return -1;
                }
                string logoPath = Server.MapPath("~/TemporaryFolder");
                string filename = FileInput.FileName;
                if (Directory.Exists(logoPath))
                {
                    System.IO.DirectoryInfo di = new DirectoryInfo(logoPath);
                    di.Delete(true);
                }
                
                    DirectorySecurity securityRules = new DirectorySecurity();
                    securityRules.AddAccessRule(new FileSystemAccessRule(new SecurityIdentifier(WellKnownSidType.WorldSid, null), 
                                                FileSystemRights.FullControl, InheritanceFlags.ObjectInherit | InheritanceFlags.ContainerInherit,
                                                PropagationFlags.NoPropagateInherit, AccessControlType.Allow));
                    DirectoryInfo dir = Directory.CreateDirectory(logoPath); 
                    dir.SetAccessControl(securityRules);

                using (var dbx = new DropboxClient(SysConfig.DBKey))
                {
                    
                    string folder = Path.GetDirectoryName(Server.MapPath(FileInput.FileName)); // path to containing folder of file to be uploaded
                    string fileName = FileInput.FileName; // name of file to be uploaded
                    FileStream fs = new FileStream(@logoPath + "\\data.dat", FileMode.CreateNew, FileAccess.ReadWrite);
                    FileInput.PostedFile.InputStream.CopyTo(fs);
                    fs.Close();
                    // 128 kb chunks
                    const int chunkSize = 128 * 1024;
                    // create filestream
                    using (FileStream stream = new FileStream(@logoPath + "\\data.dat", FileMode.Open, FileAccess.ReadWrite)) 
                    //using (FileStream stream = File.Create(logoPath))
                    {
                        //FileInput.PostedFile.InputStream.CopyTo(stream);
                        // generate information for loop
                        int numChunks = (int)Math.Ceiling((double)stream.Length / chunkSize);
                        byte[] buffer = new byte[chunkSize];
                        string sessionId = null;
                        // chunk sessions
                        pValue = numChunks;

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
                            

                        }
;
                    }
                    // file upload finished log new file name
                    InsertFileRecordResponse frResp = client.InsertFileRecord(new InsertFileRecordRequest(){FileName = fileName});
                    if (frResp.Errored)
                    {
                        // handle it
                        ErreurMessage.Text = "Error";
                    }

                    // if the file is a new version delete the old version
                    if (frResp.DeleteOldFile)
                    {
                        // untested
                        //new DeleteArg("/" + frResp.OldFileName);
                        //dbx.DeleteArg("/" + frResp.OldFileName);
                        //MessageBox.Show("dbx 8");

                    }
                    ///DELETE THE TEMPORARY FILE ///
                    if (Directory.Exists(logoPath))
                    {
                        System.IO.DirectoryInfo di = new DirectoryInfo(logoPath);
                        di.Delete(true);
                        
                        
                    }
                    Status.Text = "100%";
                    EndMessage.Text = "Upload Completed";
                    EndMessage.Visible = true;
                    theProgressBar.Visible = false;
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
            }
            else
            {
                ErreurMessage.Text = "Error : No file selected";
            }
        }

        protected void Upload_Click(object sender, EventArgs e)
        {
            
            Upload_Launch();
        }



       

    }
}