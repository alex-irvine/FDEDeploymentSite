using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration.ServiceReference1;
using System.Web.Security;

namespace Administration
{
    public partial class TutorialView : System.Web.UI.Page
    {
        public TutorialItem TutorialContent { get; private set; }
        public List<TutorialPage> TutoPages { get; private set; }

        public bool isAdmin { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            bool isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            if (!isAdmin)
            {
                FormsAuthentication.RedirectToLoginPage();
                
            }
            else
            {
                using (Service1Client client = new Service1Client())
                    {
                        GetTutorialItemByIdResponse response = client.GetTutorialItemById(new GetTutorialItemByIdRequest()
                        {
                            _id = Request.QueryString["id"]
                        });

                        if (!response.Errored)
                        {
                            TutorialContent = response.TutorialItem;
                            TutoPages = TutorialContent.Pages.ToList<TutorialPage>();
                            TutorialID.Text = TutorialContent._id;
                        }
                    }
             }
        }


        protected void DeleteClick(object sender, EventArgs e)
        {
            using(Service1Client client = new Service1Client())
            {
                DeleteTutorialItemResponse response = client.DeleteTutorialItem(
                    new DeleteTutorialItemRequest()
                    {
                        _id = TutorialID.Text
                    });
            
                if(!response.Errored)
                {
                    Response.Redirect("~/Tutorials");
                }
                
            }
        }

        protected void PublishClick(object sender, EventArgs e)
        {
            using(Service1Client client = new Service1Client())
            {
                PublishTutorialItemResponse response = client.PublishTutorialItem(
                    new PublishTutorialItemRequest()
                    {
                        _id = TutorialID.Text,
                        IsPublished = true
                    });
            
                if(!response.Errored)
                {
                    // the Tutorial item is published flag has been updated
                    Response.Redirect("~/Tutorials");
                }        
            }

        }

        protected void UnPublishClick(object sender, EventArgs e)
        {
            using(Service1Client client = new Service1Client())
            {
                PublishTutorialItemResponse response = client.PublishTutorialItem(
                    new PublishTutorialItemRequest()
                    {
                        _id = TutorialID.Text,
                        IsPublished = false
                    });
            
                if(!response.Errored)
                {
                    // the Tutorial item is published flag has been updated
                    Response.Redirect("~/Tutorials");
                }        
            }

        }

        protected void DataPagerProducts_PreRender(object sender, EventArgs e)
        {
            this.LVTuto.DataSource = TutoPages;
            this.LVTuto.DataBind();
        }

        

    }
    
}