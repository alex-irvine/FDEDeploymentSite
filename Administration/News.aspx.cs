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
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
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
                            ErreurMessage.Text = "Error";
                            Response.Redirect("~/");
                        }
                    }
                }
            }
        }


        protected void PublishClick(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {

                PublishNewsItemResponse response = client.PublishNewsItem(new PublishNewsItemRequest()
                {
                    _id = NewsID.Text,
                    IsPublished = true
                });
                if (!response.Errored)
                {
                    Response.Redirect("~/");
                }
                else
                {
                    ErreurMessage.Text = "Error";
                }
            }
        }

        protected void UnPublishClick(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {

                PublishNewsItemResponse response = client.PublishNewsItem(new PublishNewsItemRequest()
                {
                    _id = NewsID.Text,
                    IsPublished = false
                });
                if (!response.Errored)
                {
                    Response.Redirect("~/");
                }
                else
                {
                    ErreurMessage.Text = "Error";
                }
            }
        }

        protected void DeleteClick(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {
                DeleteNewsItemResponse response = client.DeleteNewsItem(new DeleteNewsItemRequest()
                {
                    _id = NewsID.Text,
                });
                if (!response.Errored)
                {
                    Response.Redirect("~/");
                }
                else
                {
                    ErreurMessage.Text = "Error";
                }
            }
        }
    }
}