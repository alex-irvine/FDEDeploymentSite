using Consumer.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Consumer
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string namestring = Request.Form["namebox"];
            string emailstring = Request.Form["emailbox"];
            string messagestring = Request.Form["messagebox"];
            using (Service1Client client = new Service1Client())
            {
                InsertContactResponse response = client.InsertContact(new InsertContactRequest()
                {
                    Contact = new Consumer.ServiceReference1.Contact()
                    {
                        Author = namestring,
                        Email = emailstring,
                        Text = messagestring,
                        Date = DateTime.Now
                    }
                });
                if (!response.Errored)
                {
                    Response.Redirect("~/Contact");
                }
            }
        }




        }



    }

