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

        /*public List<Consumer.ServiceReferenceNews.News> GetNews()
        {

            using (var _db = new Consumer.ServiceReferenceNews.NewsServiceClient())
            {
                List<Consumer.ServiceReferenceNews.News> query = _db.GetNews();
                return query;
            }

        }*/

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
    }
}