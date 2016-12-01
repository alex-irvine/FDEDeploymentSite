using CADES.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace CADES
{
    public partial class News : System.Web.UI.Page
    {
        public bool isApproved { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            isApproved = Session["User"] != null ? ((CADES.ServiceReference1.Person)Session["User"]).IsApproved : false;
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            if (!isApproved)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }
    }
}