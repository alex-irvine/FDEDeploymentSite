using Consumer.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Consumer
{
    public partial class Comments : System.Web.UI.Page
    {
        public bool isApproved { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            isApproved = Session["User"] != null ? ((Consumer.ServiceReference1.Person)Session["User"]).IsApproved : false;
            if (Session["User"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            if (!isApproved)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void btnAddComment_Click(object sender, EventArgs e)
        {
            string comm = comment.Value;
            using (Service1Client client = new Service1Client())
            {
                InsertCommentResponse response = client.InsertComment(new InsertCommentRequest()
                {
                    Comment = new Comment()
                    {
                        Text = comm,
                        Author = ((Person)Session["User"]).Username
                    }
                });
                if (!response.Errored)
                {
                    Response.Redirect("~/Comments");
                }
            }
        }

        public List<ServiceReference1.Comment> GetComments()
        {
            List<ServiceReference1.Comment> res = new List<ServiceReference1.Comment> ();
            using (var client = new Service1Client())
            {
                GetPublishedCommentsResponse response = client.GetPublishedComments();
                if (!response.Errored)
                {
                    Comment[] comms = response.Comments;
                    foreach (Comment c in comms)
                    {
                        res.Add(c);
                    }
                }
            }

            return res;
        }
    }
}