using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration.ServiceReference1;
using System.Windows.Forms;

namespace Administration
{
    public partial class _Default : Page
    {
        public bool isAdmin {get; private set;}

        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
            isAdmin = true;
        }

        public void /*List<Administration.ServiceReference1.NewsItem>*/ GetNews()
        {
            
            using(var _db = new Service1Client())
            {
                List<NewsItem> query = new List<NewsItem>();
                GetNewsItemsResponse response = _db.GetNewsItems();
                if (!response.Errored)
                {
                    query = response.NewsItems.ToList();
                }
                foreach (NewsItem ni in query)
                {
                    MessageBox.Show(ni.Title);
                }
                this.LVNews.DataSource = response.NewsItems.ToList<NewsItem>();
                this.LVNews.DataBind();
                //return query;
            }
            
        }

        protected void NewNews_Click(object sender, EventArgs e)
        {

            // create a empty news
            NewsItem nw = new NewsItem()
            {
                Author =  HttpContext.Current.User.Identity.Name.ToString(),
                Title = "Unnamed news",
                Text = "Empty",
                Published = false,
                Date_modified = DateTime.Now,
            };
            using (ServiceReference1.Service1Client client = new Service1Client())
            {
                InsertNewsItemResponse response = client.InsertNewsItem(new InsertNewsItemRequest()
                {
                    NewsItem = nw
                });
                if (!response.Errored)
                {
                    MessageBox.Show("News created");
                }
            }
            // Redirect to NewsEditor
        }

        protected void DataPagerNews_PreRender(object sender, EventArgs e)
        {
            using (var _db = new Service1Client())
            {
                
                GetNewsItemsResponse response = _db.GetNewsItems();
                if (!response.Errored)
                {
                    this.LVNews.DataSource = response.NewsItems.ToList<NewsItem>();
                    
                }
                else
                {
                    this.LVNews.DataSource = new List<NewsItem>();
                }
                this.LVNews.DataBind();
                //return query;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Session["NewsId"] = ((System.Web.UI.WebControls.Button)sender).Attributes["Value"];
        }

        
    }
}