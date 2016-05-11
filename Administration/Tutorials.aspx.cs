using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration.ServiceReferenceNews;
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
                Account.Login.ReturnUrl = "~/Tutorials";
                Response.Redirect("~/Account/Login");
            }
            else
            {
                isAdmin = Session["User"] != null ? ((Person)Session["User"]).IsAdmin : false;
            }
        }

        public List<ServiceReferenceNews.Tutorial> GetTutorials()
        {
            using (var _db = new NewsServiceClient())
            {
                List<ServiceReferenceNews.Tutorial> query = _db.GetTutorials();
                return query;
            }
            
        }

        protected void New_Tutorial(object sender, EventArgs e)
        {
            
        }

        protected void Search_Click(object sender, EventArgs e)
        {

        }
    }
}