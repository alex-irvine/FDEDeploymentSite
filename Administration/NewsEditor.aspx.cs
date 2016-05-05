using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administration
{
    public partial class NewsEditor : System.Web.UI.Page
    {
        public Administration.ServiceReferenceNews.News NewsContent { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            bool isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
            if (!isAdmin)
            {
                Response.Redirect("~/");
            }
            else
            {
                NewsContent = new Administration.ServiceReferenceNews.NewsServiceClient().GetNewsById(Request.QueryString["id"]);
                NewsTitle.Text = NewsContent.title;
                NewsText.Text = NewsContent.text;
                NewsFinal.Text = NewsContent.text;
                NewsID.Text = Request.QueryString["id"];
            }
        }


        protected void Edit_News(object sender, EventArgs e)
        {
            
        }
    }
}