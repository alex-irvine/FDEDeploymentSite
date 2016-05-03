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
        protected void Page_Load(object sender, EventArgs e)
        {

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
            MessageBox.Show("Editing");
        }

        
    }
}