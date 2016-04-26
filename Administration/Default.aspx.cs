using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration.ServiceReferenceNews;

namespace Administration
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<News> GetNews()
        {
            var _db = new Administration.ServiceReferenceNews.NewsServiceClient();
            List<News> query = _db.GetNews().ToList();
            return query;
        }

        
    }
}