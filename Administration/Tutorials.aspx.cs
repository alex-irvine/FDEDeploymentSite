using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Administration.ServiceReference1;

namespace Administration
{
   public partial class Tutorials : System.Web.UI.Page
    {
        public bool isAdmin { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                isAdmin = Session["User"] != null ? ((Person)Session["User"]).IsAdmin : false;
            }
        }

        

        protected void New_Tutorial(object sender, EventArgs e)
        {
            List<TutorialPage> pages = new List<TutorialPage>()
            {
                    new TutorialPage(){
                    PageNumber = 1,
                    Text = "Some text",
                    Video = "vid url"}
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
                    // the tutorial was inserted correctly
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
    }
}