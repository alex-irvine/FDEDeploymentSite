using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using Administration.ServiceReference1;
using System.Windows.Forms;

namespace Administration
{
    public partial class Contact : Page
    {
        public bool isAdmin { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            if (!isAdmin)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void DataPagerContact_PreRender(object sender, EventArgs e)
        {
            List<Administration.ServiceReference1.Contact> contacts = new List<Administration.ServiceReference1.Contact>();
            using (Service1Client client = new Service1Client())
            {
                GetContactsResponse response = client.GetContacts();
                if (!response.Errored)
                {
                    contacts = response.Contacts.ToList<Administration.ServiceReference1.Contact>();
                }
            }
            // Fill the listview with data
            contactlist.DataSource = contacts;
            contactlist.DataBind();
        }

        protected void DeleteContact_Click(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {
                DeleteContactResponse response = client.DeleteContact(new DeleteContactRequest()
                {
                    _id = ((LinkButton)sender).CommandArgument,
                });
                if (response.Errored)
                {
                    Response.Redirect("~/Contact");

                }
                else
                {
                    Response.Redirect("~/Contact");
                }
            }
        }
    }
}