using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using CADES.Models;
using CADES.ServiceReference1;
using System.Windows.Forms;
using System.Web.Security;
using System.Collections.Generic;


namespace CADES.Account
{
    public partial class Login : Page
    {
        static public string ReturnUrl = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                FormsAuthentication.RedirectFromLoginPage(HttpContext.Current.User.Identity.ToString(), true);
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            using (ServiceReference1.Service1Client client = new CADES.ServiceReference1.Service1Client())
            {
                AuthenticateUserResponse response = client.AuthenticateUser(new AuthenticateUserRequest()
                {
                    Username = Email.Text,
                    Password = Password.Text
                });

                if (response.Errored)
                {
                    FailureText.Text = "Username or password incorrect";
                }
                else
                {
                    if (response.Authenticated)
                    {
                        Session["User"] = response.Person;
                        Person pson = (Person)Session["User"];
                        FormsAuthentication.RedirectFromLoginPage(pson.Username, RememberMe.Checked);
                    }
                    else
                    {
                        FailureText.Text = "can't authenticate";
                    }
                }

            }
        }
    }
}