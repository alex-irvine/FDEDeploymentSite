using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration.ServiceReference1;
using System.Windows.Forms;

namespace Administration
{
    public partial class TutorialEditor : System.Web.UI.Page
    {
        public Administration.ServiceReference1.TutorialItem NewsContent { get; private set; }
        public List<TutorialPage> TutoPages { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            bool isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
            if (!isAdmin)
            {
                Response.Redirect("~/");
            }
            else
            {
                if (!IsPostBack)
                {
                    using (Service1Client client = new Service1Client())
                    {
                        GetTutorialItemByIdResponse response = client.GetTutorialItemById(new GetTutorialItemByIdRequest()
                        {
                            _id = Request.QueryString["id"]
                        });

                        if (!response.Errored)
                        {
                            NewsContent = response.TutorialItem;
                            TutorialTitle.Text = NewsContent.Title;
                            TutoPages = NewsContent.Pages.ToList<TutorialPage>();
                            TutorialID.Text = NewsContent._id;
                        }
                    }
                }
            }
        }


        protected void Edit_Tutorial(object sender, EventArgs e)
        {
            List<TutorialPage> pages = new List<TutorialPage>();
            // Send everything to Service
            int i = 0;
            foreach (var item in LVTuto.Items)
            {
                i += 1;

                pages.Add(new TutorialPage()
                {
                    Text = ((System.Web.UI.WebControls.TextBox)item.Controls[3]).Text,
                    Video = ((System.Web.UI.WebControls.TextBox)item.Controls[1]).Text,
                    PageNumber = i
                });


            }
            using (Service1Client client = new Service1Client())
            {

                UpdateTutorialItemResponse response = client.UpdateTutorialItem(
                    new UpdateTutorialItemRequest()
                    {
                        TutorialItem = new TutorialItem()
                        {
                            // the new Tutorial item object (with same _id)
                            _id = TutorialID.Text,
                            Title = TutorialTitle.Text,
                            Author = Author.Text,
                            DateModified = DateTime.Now,
                            Pages = pages.ToArray()
                        }
                    });

                if (!response.Errored)
                {
                    // the Tutorial item is now updated
                    Response.Redirect("~/TutorialView?id=" + Request.QueryString["id"]);
                }
            }
            
        }

        protected void NewPage(object sender, EventArgs e)
        {
            // create a new Page
        }

        protected void LVTuto_PreRender(object sender, EventArgs e)
        {
            this.LVTuto.DataSource = TutoPages;
            this.LVTuto.DataBind();
        }
    }
}