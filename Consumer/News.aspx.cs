using Consumer.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Consumer
{
    public partial class News : System.Web.UI.Page
    {
        public bool isApproved { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //isApproved = Session["User"] != null ? ((Consumer.ServiceReference1.Person)Session["User"]).IsApproved : false;
            //if (Session["User"] == null)
            //{
            //    FormsAuthentication.RedirectToLoginPage();
            //}
            //if (!isApproved)
            //{
            //    FormsAuthentication.RedirectToLoginPage();
            //}
        }

        protected void DataPagerNews_PreRender(object sender, EventArgs e)
        {
            using (var _db = new Service1Client())
            {

                GetNewsItemsResponse response = _db.GetNewsItems();
                if (!response.Errored)
                {
                    NewsItem[] items = response.NewsItems;
                    List<ServiceReference1.NewsItem> items2 = new List<ServiceReference1.NewsItem>();
                    Array.Sort(items, delegate(NewsItem n1, NewsItem n2)
                    {
                        return DateTime.Compare(n2.Date_modified, n1.Date_modified);
                    });
                    foreach(NewsItem i in items){
                        if (i.Published)
                        {
                            items2.Add(i);
                        }
                    }
                    this.LVNews.DataSource = items2.ToList<NewsItem>();
                }
                else
                {
                    this.LVNews.DataSource = new List<NewsItem>();
                }
                this.LVNews.DataBind();
            }
        }
    }
}