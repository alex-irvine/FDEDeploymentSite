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
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            if(!isAdmin){
                FormsAuthentication.RedirectToLoginPage();
            }
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
                if (!response.Errored)
                {
                    string idlink = response.InsertedId;
                    Response.Redirect("~/NewsEditor?id=" + idlink);
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
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Session["NewsId"] = ((System.Web.UI.WebControls.Button)sender).Attributes["Value"];
        }

        protected void PublishNewClick(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {

                PublishNewsItemResponse response = client.PublishNewsItem(new PublishNewsItemRequest()
                {
                    _id = ((LinkButton)sender).CommandArgument,
                    IsPublished = true
                });
                if (!response.Errored)
                {
                    Response.Redirect("~/Default");
                }
                else
                {
                    MessageBox.Show("Fail");
                }
            }
        }

        protected void UnPublishNewClick(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {

                PublishNewsItemResponse response = client.PublishNewsItem(new PublishNewsItemRequest()
                {
                    _id = ((LinkButton)sender).CommandArgument,
                    IsPublished = false
                });
                if (!response.Errored)
                {
                    Response.Redirect("~/Default");
                }
                else
                {
                    MessageBox.Show("Fail");
                }
            }
        }

        protected void DeleteNewClick(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {
                DeleteNewsItemResponse response = client.DeleteNewsItem(new DeleteNewsItemRequest()
                {
                    _id = ((LinkButton)sender).CommandArgument
                });
                if (!response.Errored)
                {
                    Response.Redirect("~/Default");
                }
                else
                {
                    MessageBox.Show("Fail");
                }
            }
        }

        protected void Ytb_URL_Save_Click(object sender, EventArgs e)
        {
            string urlvar = UrlYtb.Text;
            using (Service1Client client = new Service1Client())
            {
                InsertUrlYoutubeResponse response = client.InsertUrlYoutube(new InsertUrlYoutubeRequest()
                {
                    //Youtube = new Youtube()
                    //{
                    urlyoutube = urlvar
                    //}
                });
                if (!response.Errored)
                {
                    //MessageBox.Show("erroned 1 : " + response.Message.ToString());
                }
            }
        }

        protected void Bouton_Show_Url_Click(object sender, EventArgs e)
        {
            using (var client = new Service1Client())
            {
                GetUrlYoutubeResponse response = client.GetUrlYoutube();
                if (response.Errored)
                {
                    MessageBox.Show("erroned 2 : " + response.Message.ToString());

                }
                TextBoxUrl.Text = response.urlyoutube;
            }

        }

    }
}