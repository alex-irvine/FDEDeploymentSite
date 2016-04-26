using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Consumer.Models;
using Consumer.ServiceReference1;
using System.Windows.Forms;
using System.Web.Security;


namespace Consumer.Account
{
    public partial class Login : Page
    {
        static public string ReturnUrl = "";
 
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            

            if (Request.IsAuthenticated)
            {
                Response.Redirect(ReturnUrl);
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                
                using (ServiceReference1.Service1Client client = new ServiceReference1.Service1Client())
                {
                    AuthenticateUserResponse response = client.AuthenticateUser(new AuthenticateUserRequest() 
                    {
                        Username = Email.Text,
                        Password = Password.Text // Hash password
                    });

                    if (response.Errored)
                    {
                        MessageBox.Show(response.Message);
                    }

                    if(response.Authenticated)
                    {
                        if (response.Person.IsAdmin)
                        {
                            Session["User"] = response.Person;
                            Person pson = (Person)Session["User"];

                            //FormsAuthentication.RedirectFromLoginPage(pson.UserName, RememberMe.Checked);
                            Response.Redirect(ReturnUrl);
                        }
                        else
                        {
                            FailureText.Text = "You don't have permission to access, please <a href=\"#\">go there </a>";
                            ErrorMessage.Visible = true;
                        }
                        
                    }

                    if(!Request.IsAuthenticated)
                    {
                        FormsAuthentication.RedirectFromLoginPage("/Account/Login", true);
                    }

                }
            }
        }
    }
}