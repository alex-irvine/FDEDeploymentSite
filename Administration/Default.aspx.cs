using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration.ServiceReference1;
using System.Windows.Forms;
using Services.Model;
using System.Web.Security;


namespace Administration
{
    public partial class _Default : Page
    {
        public bool isAdmin { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
        }

        protected void NewNews_Click(object sender, EventArgs e)
        {

            // create an empty news
            NewsItem nw = new NewsItem()
            {
                Author = ((Person)Session["User"]).Username,
                Title = "Unnamed news",
                Text = "Empty",
                Published = false,
                Date_modified = DateTime.Now,
                Date_published = DateTime.Now,
            };
            using (ServiceReference1.Service1Client client = new Service1Client())
            {
                InsertNewsItemResponse response = client.InsertNewsItem(new InsertNewsItemRequest()
                {
                    NewsItem = nw
                });
                //if (!response.Errored)
                //{
                //    MessageBox.Show("News created");
                //}
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
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Session["NewsId"] = ((System.Web.UI.WebControls.Button)sender).Attributes["Value"];
        }

        protected void Ytb_URL_Save_Click(object sender, EventArgs e)
        {
            string urlvar = UrlYtb.Text;
            using (Service1Client client = new Service1Client())
            {
                InsertUrlYoutubeResponse response = client.InsertUrlYoutube(new InsertUrlYoutubeRequest()
                {
                    Youtube = new Youtube()
                    {
                        urlyoutube = urlvar
                    }
                });
                if (!response.Errored)
                {
                    //Response.Redirect("~/Youtube");
                    MessageBox.Show("erroned1");
                }
            }
        }
        //public string GetUrlYoutubeinDb()
        //{
        //    using (var client = new Service1Client())
        //    {
        //        GetUrlYoutubeResponse response = client.GetUrlYoutube();
        //        if (!response.Errored)
        //        {
        //            MessageBox.Show("erroned2");
        //        }
        //    }

        //    return response;
        //}
        //public List<ServiceReference1.Youtube> GetUrlYoutubeinDb()
        //{
        //    List<ServiceReference1.Youtube> res = new List<ServiceReference1.Youtube>();
        //    using (var client = new Service1Client())
        //    {
        //        GetUrlYoutubeResponse response = client.GetUrlYoutube();
        //        if (!response.Errored)
        //        {
        //            MessageBox.Show("erroned2");

        //        }
        //    }

        //    return res;
        //}
        protected void Bouton_Show_Url_Click(object sender, EventArgs e)
        {
            using (var client = new Service1Client())
            {
                GetUrlYoutubeResponse response = client.GetUrlYoutube();
                ///string urltext = response.Youtube.
                if (!response.Errored)
                {
                    MessageBox.Show("erroned2");

                }
                TextBoxUrl.Text = response.urlyoutube;
            }

        }
    }
}