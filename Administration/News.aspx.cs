using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Administration.ServiceReference1;

namespace Administration
{
    public partial class News : System.Web.UI.Page
    {
        public Administration.ServiceReference1.NewsItem NewsContent { get; private set; }

        public bool isAdmin { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
            if (!isAdmin)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                if (!IsPostBack)
                {
                    using (Service1Client client = new Service1Client())
                    {
                        GetNewsItemByIdResponse response = client.GetNewsItemById(new GetNewsItemByIdRequest()
                        {
                            _id = Request.QueryString["id"]
                        });
                        if (!response.Errored)
                        {
                            NewsContent = response.News;
                            NewsFinal.Text = NewsContent.Text;
                            Author.Text = NewsContent.Author;
                            NewsID.Text = NewsContent._id;
                        }
                        else
                        {
                            MessageBox.Show("Fail to load news");
                        }
                    }
                }
            }
        }

        protected void Remove_News(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        protected void Publish_News(object sender, EventArgs e)
        {
            // Set publish to true

        }

        protected void PublishClick(object sender, EventArgs e)
        {

        }
    }
}