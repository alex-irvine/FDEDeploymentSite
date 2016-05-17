using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration.ServiceReference1;
using System.Windows.Forms;

namespace Administration
{
    public partial class NewsEditor : System.Web.UI.Page
    {
        public Administration.ServiceReferenceNews.News NewsContent { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            bool isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
            //if (!isAdmin)
            //{
            //    Response.Redirect("~/");
            //}
            //else
            //{
            //    NewsContent = new Administration.ServiceReferenceNews.NewsServiceClient().GetNewsById(Request.QueryString["id"]);
            //    NewsTitle.Text = NewsContent.title;
            //    NewsText.Text = NewsContent.text;
            //    NewsFinal.Text = NewsContent.text;
            //    Author.Text = "Author : " + new Administration.ServiceReference1.Service1Client().GetPersonById(NewsContent.userId).UserName;
            //    NewsID.Text = Request.QueryString["id"];
            //}

            if(!isAdmin)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                using (Service1Client client = new Service1Client())
                {
                    //MessageBox.Show(Session["NewsId"].ToString());
                    GetNewsItemByIdResponse response = client.GetNewsItemById(new GetNewsItemByIdRequest()
                    {
                        _id = (ObjectId)Session["NewsId"]
                    });
                    if (!response.Errored)
                    {
                        NewsItem NewsContent = response.News;
                        NewsTitle.Text = NewsContent.Title;
                        NewsText.Text = NewsContent.Text;
                        NewsFinal.Text = NewsContent.Text;
                        Author.Text = "Author : " + NewsContent.Author;
                        NewsID.Text = Request.QueryString["id"];
                    }
                    else
                    {
                        MessageBox.Show("Fail to load news");
                    }
                }
            }
        }


        protected void Edit_News(object sender, EventArgs e)
        {
            // Send everything to Service
        }
    }
}