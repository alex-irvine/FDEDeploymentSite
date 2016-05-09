using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
            }
        }

        public List<Administration.ServiceReferenceNews.News> GetNews()
        {

            using (var _db = new Administration.ServiceReferenceNews.NewsServiceClient())
            {
                List<Administration.ServiceReferenceNews.News> query = _db.GetNews();
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