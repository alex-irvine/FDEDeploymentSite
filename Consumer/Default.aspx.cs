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

        public List<Consumer.NewsItem> GetNews()
        {
            List<NewsItem> ret = new List<NewsItem>();

            ret.Add(new NewsItem()
            {
                Picture = "http://i.fonts2u.com/li/lipsum_4.png",
                Text = "Lorem ipsum dolor sit amet"
            });
            ret.Add(new NewsItem()
            {
                Picture = "http://i.fonts2u.com/li/lipsum_4.png",
                Text = "Lorem ipsum dolor sit amet"
            });
            ret.Add(new NewsItem()
            {
                Picture = "http://i.fonts2u.com/li/lipsum_4.png",
                Text = "Lorem ipsum dolor sit amet"
            });
            ret.Add(new NewsItem()
            {
                Picture = "http://i.fonts2u.com/li/lipsum_4.png",
                Text = "Lorem ipsum dolor sit amet"
            });

            return ret;
        }
    }
}