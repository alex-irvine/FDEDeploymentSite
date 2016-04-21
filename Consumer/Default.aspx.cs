using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Consumer.ServiceReference1;
using System.Web.Security;

namespace Consumer
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                // boot user to login page
                return;
            }

            // load page as normal

        }

        private void nevergonnabeused()
        {
            using(ServiceReference1.Service1Client client = new ServiceReference1.Service1Client())
            {
                AuthenticateUserResponse response = client.AuthenticateUser(new AuthenticateUserRequest() 
                {
                    Username = "",
                    Password = ""
                });

                if(response.Errored)
                {
                    // some error
                }

                if(response.Authenticated)
                {
                    //FormsAuthentication.SetAuthCookie("",true);
                    FormsAuthentication.RedirectFromLoginPage("",true);
                }

                if(Request.IsAuthenticated)
                {

                }
            }
        }
    }
}