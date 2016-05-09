using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administration
{
    public partial class TutorialEditor : System.Web.UI.Page
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
                TutorialTitle.Text = NewsContent.title;
                TutorialText.Text = NewsContent.text;
                NewsFinal.Text = NewsContent.text;
                Author.Text = "Author : " + new Administration.ServiceReference1.Service1Client().GetPersonById(NewsContent.userId).UserName;
                TutorialID.Text = Request.QueryString["id"];
            }
        }


        protected void Edit_Tutorial(object sender, EventArgs e)
        {
            // Send everything to Service
        }

        protected void NewPage(object sender, EventArgs e)
        {
            // create a new Page
        }
    }
}