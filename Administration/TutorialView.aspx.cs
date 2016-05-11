using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration.ServiceReferenceNews;

namespace Administration
{
    public partial class TutorialView : System.Web.UI.Page
    {
        public List<ServiceReferenceNews.Tutorial> TutorialContent { get; private set; }

        public bool isAdmin { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null 
                || Request.QueryString["id"] == null 
                || string.IsNullOrEmpty(Request.QueryString["id"]) 
                || string.IsNullOrWhiteSpace(Request.QueryString["id"]) 
            ){
                Response.Redirect("~/");
            }
            else
            {
                isAdmin = Session["User"]!=null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
                TutorialContent = new Administration.ServiceReferenceNews.NewsServiceClient().GetTutorialById(Request.QueryString["id"]);
                /*NewsFinal.Text = TutorialContent.text;
                NewsID.Text = Request.QueryString["id"];
                Author.Text = "Author : "+ new Administration.ServiceReference1.Service1Client().GetPersonById(TutorialContent.userId).UserName;
                Modified.Text = "Last modification : " + TutorialContent.date_modified.ToString();
                Published.Text = "Published : " + TutorialContent.date_published.ToString();*/
            }
            
        }

        public List<ServiceReferenceNews.Tutorial> GetTutorials()
        {
            using (var _db = new NewsServiceClient())
            {
                List<ServiceReferenceNews.Tutorial> query = _db.GetTutorialById(Request.QueryString["id"]);
                return query;
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

        protected void DataPagerProducts_PreRender(object sender, EventArgs e)
        {
            using (var _db = new NewsServiceClient())
            {
                this.LVTutorials.DataSource = _db.GetTutorialById(Request.QueryString["id"]);
                this.LVTutorials.DataBind();
            }
        }

        

    }
    
}