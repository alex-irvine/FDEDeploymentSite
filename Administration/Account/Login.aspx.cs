using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Administration.Models;
using Administration.ServiceReference1;
using System.Windows.Forms;
using System.Web.Security;


namespace Administration.Account
{
    public partial class Login : Page
    {
        
 
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User"] != null)
            {
                FormsAuthentication.RedirectFromLoginPage(((Person)Session["User"]).Username, true); // If user is already connected, he's redirected
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
                        Password = Password.Text
                    }); // see doc

                    if (response.Errored)
                    {
                        ErreurMessage.Text = "Username or password incorrect";
                    }

                    if (response.Authenticated)
                    {
                        if (response.Person.IsAdmin && response.Person.IsApproved)   
                        {
                            Session["User"] = response.Person;
                            Person pson = (Person)Session["User"];
                            FormsAuthentication.RedirectFromLoginPage(response.Person.Username, RememberMe.Checked);
                        }
                        else
                        {
                            FailureText.Text = "You don't have permission to access this page";
                            ErrorMessage.Visible = true;
                        }

                    }

                }
            }
            
        }
    }
}