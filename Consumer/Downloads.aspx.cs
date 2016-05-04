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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Response.Redirect("fileDl.ashx");
        }
    }
}