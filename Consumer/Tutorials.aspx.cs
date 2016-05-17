using Consumer.ServiceReferenceNews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Consumer
{
    public partial class Tutorials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        public List<ServiceReferenceNews.Tutorial> GetTutorials()
        {
            string script = "tutorials = [ \n";
            using (var _db = new NewsServiceClient())
            {
                List<ServiceReferenceNews.Tutorial> query = _db.GetTutorials();
                foreach(Tutorial tuto in query) {
                    script += "{ \n";
                    script += "'id' : " + tuto.Id + ",\n";
                    script += "'page' : " + tuto.page + ",\n";
                    script += "'title' : '" + tuto.title + "',\n";
                    script += "'text' : '" + tuto.text + "',\n";
                    script += "'video' : '" + tuto.video + "',\n";
                    script += "'published' : '" + tuto.published + "',\n";
                    script += "'date_published' : '" + tuto.date_published + "',\n";
                    script += "'date_modified' : '" + tuto.date_modified + "'\n";
                    script += "}, \n";
                }
                script += "];";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "tutorials", script, true);
                return query;
            }

        }
    }

}