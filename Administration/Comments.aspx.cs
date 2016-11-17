using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using Administration.ServiceReference1;
using System.Windows.Forms;

namespace Administration
{
    public partial class Comments : System.Web.UI.Page
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

        protected void DataPagerPublished_PreRender(object sender, EventArgs e)
        {
            List<Comment> comments = new List<Comment>();
            using (Service1Client client = new Service1Client())
            {
                GetPublishedCommentsResponse response = client.GetPublishedComments();
                if (!response.Errored)
                {
                    comments = response.Comments.ToList<Comment>();
                }
            }
            // Fill the listview with data
            Published_Comments.DataSource = comments;
            Published_Comments.DataBind();
        }

        protected void DataPagerUnpublished_PreRender(object sender, EventArgs e)
        {
            List<Comment> comments = new List<Comment>();
            using (Service1Client client = new Service1Client())
            {
                GetUnpublishedCommentsResponse response = client.GetUnpublishedComments();
                if (!response.Errored)
                {
                    comments = response.Comments.ToList<Comment>();
                }
            }
            // Fill the listview with data
            Unpublished_Comments.DataSource = comments;
            Unpublished_Comments.DataBind();
        }

        protected void Publish_Click(object sender, EventArgs e) // Approve a comment
        {
            MessageBox.Show(((LinkButton)sender).CommandArgument);
            using (Service1Client client = new Service1Client())
            {
                PublishCommentResponse response = client.PublishComment(new PublishCommentRequest()
                {
                    _id = ((LinkButton)sender).CommandArgument,
                    IsPublished = true
                });
                if (!response.Errored)
                {
                    Response.Redirect("~/Comments");
                }
            }
        }

        protected void Unpublish_Click(object sender, EventArgs e) // Unpublish an approved comment
        {
            MessageBox.Show(((LinkButton)sender).CommandArgument);
            using (Service1Client client = new Service1Client())
            {
                PublishCommentResponse response = client.PublishComment(new PublishCommentRequest()
                {
                    _id = ((LinkButton)sender).CommandArgument,
                    IsPublished = false
                });
                if (!response.Errored)
                {
                    Response.Redirect("~/Comments");
                }
            }
        }

        //TODO: Delete a comment
        protected void DeleteComment_Click(object sender, EventArgs e)
        {
            using (Service1Client client = new Service1Client())
            {
                DeleteCommentResponse response = client.DeleteComment(new DeleteCommentRequest()
                {
                    _id = ((LinkButton)sender).CommandArgument,
                });
                if (response.Errored)
                {
                    Response.Redirect("~/Comment");

                }
                else
                {
                    Response.Redirect("~/Comment");
                }
            }
        }
    }
}