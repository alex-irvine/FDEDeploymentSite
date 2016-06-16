using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration.ServiceReference1;
using System.Windows.Forms;
using System.Web.Security;

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
                FormsAuthentication.RedirectToLoginPage();
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
                            TutoPages = NewsContent.Pages.OrderBy(x=> x.PageNumber).ToList<TutorialPage>();
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
            foreach (var item in LVTuto.Items)
            {
                pages.Add(new TutorialPage()
                {
                    Text = ((System.Web.UI.WebControls.TextBox)item.Controls[5]).Text,
                    Video = checkVideo(((System.Web.UI.WebControls.TextBox)item.Controls[3]).Text),
                    PageNumber = int.Parse(((System.Web.UI.WebControls.TextBox)item.Controls[1]).Text),
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
            
            List<TutorialPage> pages = new List<TutorialPage>();
            // Send everything to Service
            int i = 0;
            foreach (var item in LVTuto.Items)
            {
                
                i+=1;
                pages.Add(new TutorialPage()
                {
                    Text = ((System.Web.UI.WebControls.TextBox)item.Controls[5]).Text,
                    Video = checkVideo(((System.Web.UI.WebControls.TextBox)item.Controls[3]).Text),
                    PageNumber = int.Parse(((System.Web.UI.WebControls.TextBox)item.Controls[1]).Text),
                });

                
            }

            pages.Add(new TutorialPage()
            {
                Text = "Type your text here",
                Video = "",
                PageNumber = pages.Count+1
            });
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
                    Response.Redirect("~/TutorialEditor?id=" + Request.QueryString["id"]);
                }
            }
        }

        protected void LVTuto_PreRender(object sender, EventArgs e)
        {
            
            this.LVTuto.DataSource = TutoPages;
            this.LVTuto.DataBind();
        }

        protected void DeletePage(object sender, EventArgs e)
        {
            string todelete = ((System.Web.UI.WebControls.LinkButton)sender).CommandArgument;
            List<TutorialPage> pages = new List<TutorialPage>();
            // Send everything to Service
            int i = 0;
            foreach (var item in LVTuto.Items)
            {

                i += 1;
                pages.Add(new TutorialPage()
                {
                    Text = ((System.Web.UI.WebControls.TextBox)item.Controls[5]).Text,
                    Video = checkVideo(((System.Web.UI.WebControls.TextBox)item.Controls[3]).Text),
                    PageNumber = int.Parse(((System.Web.UI.WebControls.TextBox)item.Controls[1]).Text),
                });


            }
            pages.RemoveAll(item => item.PageNumber.ToString()==todelete);

            if (pages.Count > 0)
            {
                pages.FindAll(x => x.PageNumber > int.Parse(todelete)).ForEach(x => x.PageNumber = x.PageNumber-1);
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
                        Response.Redirect("~/TutorialEditor?id=" + Request.QueryString["id"]);
                    }
                }
            }
            else
            {
                using (Service1Client client = new Service1Client())
                {
                    DeleteTutorialItemResponse response = client.DeleteTutorialItem(
                        new DeleteTutorialItemRequest()
                        {
                            _id = TutorialID.Text
                        });

                    if (!response.Errored)
                    {
                        Response.Redirect("~/Tutorials");
                    }

                }
            }
        }

        protected void RankDown(object sender, EventArgs e)
        {
            int rank = int.Parse(((System.Web.UI.WebControls.LinkButton)sender).CommandArgument);
            List<TutorialPage> pages = new List<TutorialPage>();
            // Send everything to Service
            int i = 0;
            foreach (var item in LVTuto.Items)
            {

                i += 1;
                pages.Add(new TutorialPage()
                {
                    Text = ((System.Web.UI.WebControls.TextBox)item.Controls[5]).Text,
                    Video = checkVideo(((System.Web.UI.WebControls.TextBox)item.Controls[3]).Text),
                    PageNumber = int.Parse(((System.Web.UI.WebControls.TextBox)item.Controls[1]).Text),
                });


            }
            if (rank > 1)
            {
                pages.FindAll(x => x.PageNumber == rank).ForEach(x => x.PageNumber = -1);
                pages.FindAll(x => x.PageNumber == rank - 1).ForEach(x => x.PageNumber = rank);
                pages.FindAll(x => x.PageNumber == -1).ForEach(x => x.PageNumber = rank -1);

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
                        Response.Redirect("~/TutorialEditor?id=" + Request.QueryString["id"]);
                    }
                }
            }
        }

        protected void RankUp(object sender, EventArgs e)
        {
            int rank = int.Parse(((System.Web.UI.WebControls.LinkButton)sender).CommandArgument);
            List<TutorialPage> pages = new List<TutorialPage>();
            // Send everything to Service
            int i = 0;
            foreach (var item in LVTuto.Items)
            {

                i += 1;
                pages.Add(new TutorialPage()
                {
                    Text = ((System.Web.UI.WebControls.TextBox)item.Controls[5]).Text,
                    Video = checkVideo(((System.Web.UI.WebControls.TextBox)item.Controls[3]).Text),
                    PageNumber = int.Parse(((System.Web.UI.WebControls.TextBox)item.Controls[1]).Text),
                });
            }
            if (rank < pages.Count)
            {
                pages.FindAll(x => x.PageNumber == rank).ForEach(x => x.PageNumber = -1);
                pages.FindAll(x => x.PageNumber == rank+1).ForEach(x => x.PageNumber = rank);
                pages.FindAll(x => x.PageNumber == -1).ForEach(x => x.PageNumber = rank+1);

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
                        Response.Redirect("~/TutorialEditor?id=" + Request.QueryString["id"]);
                    }
                }
            }

        }

        protected string checkVideo(string url)
        {
            string video;
            if (url.Contains("?v="))
            {
                video = url.Substring(url.IndexOf("?v=")+3);
            }
            else
            {
                video = url;
            }
            if(!url.Contains("/embed/")){
                video = "http://www.youtube.com/embed/" + video;
            }
            return video;
        }
    }
}