using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Employee.Web.Startup))]
namespace Employee.Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
