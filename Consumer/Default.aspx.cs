using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Consumer
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<Consumer.ServiceReferenceNews.News> GetNews()
        {

            using (var _db = new Consumer.ServiceReferenceNews.NewsServiceClient())
            {
                List<Consumer.ServiceReferenceNews.News> query = _db.GetNews();
                return query;
            }

        }
    }
}