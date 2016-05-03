using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


namespace Administration
{
    public partial class News : System.Web.UI.Page
    {
        public Administration.ServiceReferenceNews.News NewsContent { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null || string.IsNullOrEmpty(Request.QueryString["id"]) || string.IsNullOrWhiteSpace(Request.QueryString["id"]) )
            {
                Response.Redirect("~/");
            }
            else
            {
                NewsContent = new Administration.ServiceReferenceNews.NewsServiceClient().GetNewsById(Request.QueryString["id"]);
                
                
            }
            
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }
    }
}