using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Contoso.Web.Startup))]
namespace Contoso.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
