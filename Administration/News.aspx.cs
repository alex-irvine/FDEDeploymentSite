using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


namespace Administration
{
    public partial class News : System.Web.UI.Page
    {
        public Administration.ServiceReferenceNews.News NewsContent { get; private set; }

        public bool isAdmin { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null || string.IsNullOrEmpty(Request.QueryString["id"]) || string.IsNullOrWhiteSpace(Request.QueryString["id"]) )
            {
                Response.Redirect("~/");
            }
            else
            {
                isAdmin = Session["User"]!=null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
                NewsContent = new Administration.ServiceReferenceNews.NewsServiceClient().GetNewsById(Request.QueryString["id"]);
                NewsFinal.Text = NewsContent.text;
                NewsID.Text = Request.QueryString["id"];
                Author.Text = "Author : "+ new Administration.ServiceReference1.Service1Client().GetPersonById(NewsContent.userId).UserName;
                Modified.Text = "Last modification : " + NewsContent.date_modified.ToString();
                Published.Text = "Published : " + NewsContent.date_published.ToString();
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
    }
}