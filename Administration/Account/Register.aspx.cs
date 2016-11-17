using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Administration.Models;
using System.Text.RegularExpressions;
using Administration.ServiceReference1;
using System.Windows.Forms;

namespace Administration.Account
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (HttpContext.Current.User.Identity.Name!=null)
            //{
            //    Response.Redirect("~/");
            //}
            
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            if (checkMail(Email.Text))
            {
                
                GetPersonRequest rqt = new GetPersonRequest()
                {
                    Username = Email.Text
                };
                using (Service1Client client = new Service1Client())
                {
                    GetPersonResponse rsp = client.GetPerson(rqt);
                    //Check mail is not already used
                    if(rsp.Errored){
                        //Check password and Hash
                        if (check_password(Password.Text) && Password.Text==ConfirmPassword.Text)
                        {
                            // Add to database
                            Person user = new Person()
                            {
                                Username = Email.Text,
                                Company = Company.Text,
                                IsAdmin = false,
                                Password = Password.Text
                            };

                            RegisterUserResponse response = client.RegisterUser(new RegisterUserRequest()
                            {
                                User = user
                            });
                            if (!response.Errored)
                            {
                                MessageBox.Show("Your account has been created");
                            }
                            else
                            {
                                MessageBox.Show("Fail to create your account");
                            }
                        }
                        else
                        {
                            ErrorMessage.Text = "Wrong Password";
                        }
                        
                    }
                    else
                    {
                        ErrorMessage.Text = "This email adress is already used";
                    }
                    
                    
                }
            }
            else
            {
                ErrorMessage.Text = "Wrong email address format";
            }
            
        }

        private bool check_password(string password)
        {
            string cNumber = @"([0-9]*[a-zA-Z\.\-]*)*[0-9]+([0-9]*[a-zA-Z\.\-]*)*";
            string cLetter = @"([0-9]*[a-zA-Z\.\-]*)*[a-zA-Z\.\-]+([0-9]*[a-zA-Z\.\-]*)*";
            return Regex.IsMatch(password, cNumber) && Regex.IsMatch(password, cLetter) && password.Length >= 6;
        }

        private bool checkMail(string mail) {
            string rgmail = @"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$";
            return Regex.IsMatch(mail, rgmail, RegexOptions.IgnoreCase, TimeSpan.FromMilliseconds(250));
        }

        protected void Email_TextChanged(object sender, EventArgs e)
        {
            Email.BackColor = System.Drawing.Color.Green;
        }
    }
}