using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Security.Claims;
using System.Security.Policy;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using Contoso.Web.Models;
using WebMatrix.WebData;    

namespace Contoso.Web
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {

            // initializes the SimpleMembership system and creates the 4 membership tables if they do not already exist
            // Contoso is the connectionstring name. User is user table name. Id is user Identity. Email is used as UserName.

            WebSecurity.InitializeDatabaseConnection("Contoso", "User", "Id", "Email", autoCreateTables: true);

            // create two roles in the app if they to not already exist

            if (!Roles.RoleExists("Admin")) Roles.CreateRole("Admin");
            if (!Roles.RoleExists("Member")) Roles.CreateRole("Member");

            // override table and key names (just for demo purposes, it has no effect)

            //ContosoEntities.User.Init(table: "User", key: "Id");

            // create membership accounts for admin Debbie and user Art Lover (only the very first time). 
            // you will not need this in your own projects. 

            string email = "phuongvd@contoso.com";
            string password = "secret123";

            if (WebSecurity.GetCreateDate(email) == DateTime.MinValue)
            {
                WebSecurity.CreateUserAndAccount(email, password);
                Roles.AddUserToRole(email, "Admin");
                Roles.AddUserToRole(email, "Member");
            }
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            AntiForgeryConfig.UniqueClaimTypeIdentifier = ClaimTypes.Name;
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception exception = Server.GetLastError();
            Response.Clear();

            HttpException httpException = exception as HttpException;

            if (httpException != null)
            {
                // clear error on server
                Server.ClearError();

                Response.Redirect("/Auth/Auth/Login");
            }
        }
    }
}
