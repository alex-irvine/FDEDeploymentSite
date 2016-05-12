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
            //if (Request.IsAuthenticated)
            //{
            //    Response.Redirect("~/"); // already logged in : redirected to the home page
            //}

            //RegisterHyperLink.NavigateUrl = "Register";
            

            if (Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectFromLoginPage(HttpContext.Current.User.Identity.ToString(),true);
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            //if (IsValid)
            //{
                
                //using (ServiceReference1.Service1Client client = new Consumer.ServiceReference1.Service1Client())
                //{
                //    AuthenticateUserResponse response = client.AuthenticateUser(new AuthenticateUserRequest() 
                //    {
                //        Username = Email.Text,
                //        Password = Password.Text // Hash password
                //    });

                //    if (response.Errored)
                //    {
                //        MessageBox.Show(response.Message);
                //    }

                //    if(response.Authenticated)
                //    {
                //        Session["User"] = response.Person;
                //        Person pson = (Person)Session["User"];
                //        FormsAuthentication.RedirectFromLoginPage(pson.UserName, RememberMe.Checked);

                //        //if (redUrl == Request.Url.ToString())
                //        //{
                //        //    Response.Redirect("~/");
                //        //}
                //        //else
                //        //{
                //        //    Response.Redirect(redUrl);
                //        //}
                        
                        
                //    }
                //    else
                //    {
                //        // wrong user name or pword
                //    }

                //}
                FormsAuthentication.RedirectFromLoginPage(Email.Text, true);
            //}
        }
    }
}