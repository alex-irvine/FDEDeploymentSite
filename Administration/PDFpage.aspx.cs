using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Administration;
using Administration.ServiceReference1;
using System.IO;
using System.Windows.Forms;
using System.Threading.Tasks;
using System.Text;
using System.Net;
using System.Web.Services;
using Services.Model;
using System.Security.AccessControl;
using System.Security.Principal;

namespace Administration
{
    public partial class PDFpage : System.Web.UI.Page
    {
        string[] listPDF;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void PDF_Upload_Click(object sender, EventArgs e)
        {
                string pdfname = PdfInput.FileName;
                string logoPath = Server.MapPath("~/PDFFolder");
                string completePath = Server.MapPath("PDFFolder/" + pdfname);
                if (!Directory.Exists(logoPath))
                {
                    DirectorySecurity securityRules = new DirectorySecurity();
                    securityRules.AddAccessRule(new FileSystemAccessRule(new SecurityIdentifier(WellKnownSidType.WorldSid, null),
                                                FileSystemRights.FullControl, InheritanceFlags.ObjectInherit | InheritanceFlags.ContainerInherit,
                                                PropagationFlags.NoPropagateInherit, AccessControlType.Allow));
                    DirectoryInfo di = Directory.CreateDirectory(logoPath); //Création directory
                    di.SetAccessControl(securityRules);
                }
                PdfInput.SaveAs(completePath);
                Response.Write("File uploaded sucessfully.");
            
        }

        protected void GetListFile(object sender, EventArgs e)
        {
                string logopath = Server.MapPath("~/PDFFolder");
                listPDF = Directory.GetFiles(@logopath, "*.pdf",
                                         SearchOption.AllDirectories);
                listbox1.Items.Clear();
                foreach (string filename in listPDF)
                {
                    int found = filename.IndexOf("PDFFolder");
                    string onlyname = filename.Substring(found);
                    listbox1.Items.Add(onlyname);
                }
        }

        protected void PDF_Delete_Click(object sender, EventArgs e)
        {
            var fileName = this.listbox1.SelectedItem.Value;
            if(fileName != null || fileName != string.Empty)
             {
                if((System.IO.File.Exists(fileName))){
                    System.IO.File.Delete(fileName);
                }
             }
            
        }

        protected void GetUrl(object sender, EventArgs e)
        {
            var fileName = this.listbox1.SelectedItem.Value;
            string completePath = Server.MapPath("PDFFolder/" + fileName);
            txtbox1.Text = new Uri(completePath).AbsoluteUri;
        }



    }
}