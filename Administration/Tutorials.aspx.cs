using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Administration.ServiceReference1;
using System.Windows.Forms;

namespace Administration
{
   public partial class Tutorials : System.Web.UI.Page
    {
        public bool isAdmin { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            if (!isAdmin)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        

        protected void New_Tutorial(object sender, EventArgs e)
        {
            List<TutorialPage> pages = new List<TutorialPage>()
            {
                    new TutorialPage(){
                    PageNumber = 1,
                    Text = "Some text",
                    Video = ""}
            };
            TutorialItem item = new TutorialItem()
            {
                Title = "Title",
                Author = ((Person)Session["User"]).Username,
                Published = false,
                DatePublished = DateTime.Now,
                DateModified = DateTime.Now,
                Pages = pages.ToArray()
            };
            using (Service1Client client = new Service1Client())
            {
                InsertTutorialItemResponse response = client.InsertTutorialItem(new InsertTutorialItemRequest()
                {
                    TutorialItem = item
                });
                if (!response.Errored)
                {
                    string idlink = response._idtutorial;
                    Response.Redirect("~/TutorialEditor?id=" + idlink);
                }
            }
        }

        protected void LVTuto_PreRender(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {
                GetTutorialItemsResponse response = client.GetTutorialItems();
                if (!response.Errored)
                {
                    this.LVTuto.DataSource = response.TutorialItems.ToList<TutorialItem>();

                }
                else
                {
                    this.LVTuto.DataSource = new List<TutorialItem>();
                }

            }
            this.LVTuto.DataBind();
        }
        protected void DeleteClick(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {
                DeleteTutorialItemResponse response = client.DeleteTutorialItem(
                    new DeleteTutorialItemRequest()
                    {
                        _id = ((LinkButton)sender).CommandArgument,
                    });

                if (!response.Errored)
                {
                    Response.Redirect("~/Tutorials");
                }

            }
        }

        protected void PublishClick(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {
                PublishTutorialItemResponse response = client.PublishTutorialItem(
                    new PublishTutorialItemRequest()
                    {
                        _id = ((LinkButton)sender).CommandArgument,
                        IsPublished = true
                    });

                if (!response.Errored)
                {
                    // the Tutorial item is published flag has been updated
                    Response.Redirect("~/Tutorials");
                }
            }

        }

        protected void UnPublishClick(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {
                PublishTutorialItemResponse response = client.PublishTutorialItem(
                    new PublishTutorialItemRequest()
                    {
                        _id = ((LinkButton)sender).CommandArgument,
                        IsPublished = false
                    });

                if (!response.Errored)
                {
                    // the Tutorial item is published flag has been updated
                    Response.Redirect("~/Tutorials");
                }
            }

        }
    }
}