using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Administration;

namespace Administration
{
    public partial class Software : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"]==null)
            {
                Account.Login.ReturnUrl = "~/Software";
                Response.Redirect("~/Account/Login");
            }
        }
    }
}