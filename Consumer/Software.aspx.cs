using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Consumer
{
    public partial class Downloads : System.Web.UI.Page
    {
        public bool isApproved { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            isApproved = Session["User"] != null ? ((Consumer.ServiceReference1.Person)Session["User"]).IsApproved : false;
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            if (!isApproved)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            if (checkbox1.Checked)
            {
            Response.Redirect("fileDl.ashx");
            }
            else
            {
                FailureText.Text = "Accept terms and conditions";
            }
        }

        // HttpContext.Current.User.Identity.Name;
    }
}