using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CADES.ServiceReference1;
using System.Windows.Forms;


namespace CADES
{
    public partial class _Default : Page
    {
        public bool isApproved { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            isApproved = Session["User"] != null ? ((CADES.ServiceReference1.Person)Session["User"]).IsApproved : false;
        }
    }
}