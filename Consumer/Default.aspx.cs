using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Consumer.ServiceReference1;
using System.Windows.Forms;

namespace Consumer
{
    public partial class _Default : Page
    {
        public bool isApproved { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            isApproved = Session["User"] != null ? ((Consumer.ServiceReference1.Person)Session["User"]).IsApproved : false;
            ifYt.Src = GeturlVideo().Replace("watch?v=", "embed/");
            if(Session["UnapprovedDownloadAttempted"] != null)
            {
                Session["UnapprovedDownloadAttempted"] = null;
                lblErrorMsg.Text = "You must be approved before you can download ADE";
            }
        }



        protected string GeturlVideo()
        {
            using (var client = new Service1Client())
            {
                GetUrlYoutubeResponse response = client.GetUrlYoutube();
                if (response.Errored)
                {
                }
                string srcvideo = response.urlyoutube;
                return srcvideo;
           }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Response.Redirect("fileDl.ashx");
        }
    }
}