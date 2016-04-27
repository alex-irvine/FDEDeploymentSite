using Microsoft.Owin;
using Owin;
using System.Web.Security;

[assembly: OwinStartupAttribute(typeof(Consumer.Startup))]
namespace Consumer
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
