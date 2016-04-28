﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Consumer
{
    public partial class Tutorials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // !Request.IsAuthenticated
            if (Session["User"] == null)
            {
                Account.Login.ReturnUrl = "~/Tutorials";
                FormsAuthentication.RedirectToLoginPage();
            }
        }
    }
}