using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration.ServiceReferenceNews;
using System.Windows.Forms;

namespace Administration
{
    public partial class _Default : Page
    {
        public bool isAdmin {get; private set;}

        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin = Session["User"] != null ? ((Administration.ServiceReference1.Person)Session["User"]).IsAdmin : false;
        }

        public List<Administration.ServiceReferenceNews.News> GetNews()
        {
            
            using(var _db = new Administration.ServiceReferenceNews.NewsServiceClient())
            {
                List<Administration.ServiceReferenceNews.News> query = _db.GetNews();
                return query;
            }
            
        }

        protected void NewNews_Click(object sender, EventArgs e)
        {

            // create a empty news
            Administration.ServiceReferenceNews.News nw = new Administration.ServiceReferenceNews.News()
            {
                userId = ((Administration.ServiceReference1.Person)Session["User"]).Id,
                text = "Unnamed news",
                title = "Empty",
                published = false,
                date_modified = DateTime.Now
            };
            // Redirect to NewsEditor
        }

        
    }
}