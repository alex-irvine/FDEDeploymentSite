using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Consumer.ServiceReference1;
using System.Windows.Forms;

namespace Consumer
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataPagerNews_PreRender(object sender, EventArgs e)
        {
            using (var _db = new Service1Client())
            {

                GetNewsItemsResponse response = _db.GetNewsItems();
                if (!response.Errored)
                {
                    NewsItem[] items = response.NewsItems;
                    Array.Sort(items, delegate(NewsItem n1, NewsItem n2)
                    {
                        return DateTime.Compare(n2.Date_modified, n1.Date_modified);
                    });
                    this.LVNews.DataSource = items.ToList<NewsItem>();
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