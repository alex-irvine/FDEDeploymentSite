using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Consumer.Models;
using System.Text.RegularExpressions;
using Consumer.ServiceReference1;
using System.Windows.Forms;

namespace Consumer.Account
{
    public partial class Register : Page
    {
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
                    if (rsp.Errored)
                    {
                        //Check password and Hash
                        if (check_password(Password.Text) && Password.Text == ConfirmPassword.Text)
                        {
                            // Add to database
                            Person user = new Person()
                            {
                                Username = Email.Text,
                                Company = Company.Text,
                                FirstName= FirstName.Text,
                                LastName = LastName.Text,
                                IsAdmin = false,
                                Password = Password.Text
                            };

                            RegisterUserResponse response = client.RegisterUser(new RegisterUserRequest()
                            {
                                User = user
                            });
                            if (!response.Errored)
                            {
                                ErrorMessage.Text = "Your account has been created";
                                // clear all the fields

                                Email.Text = "";
                                Password.Text = "";
                                ConfirmPassword.Text = "";
                                Company.Text = "";
                                FirstName.Text = "";
                                LastName.Text = "";
                            }
                            else
                            {
                                ErrorMessage.Text = "Fail to create your account";
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
            string alphanumeric = "^[a-zA-Z0-9]*$";
            return Regex.IsMatch(password, alphanumeric) && password.Length>=6;
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