using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Contoso.Web.Areas.Auth.Models;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using WebMatrix.WebData;

namespace Contoso.Web.Areas.Auth.Controllers
{
    public class AuthController : Controller
    {

        //
        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (WebSecurity.Login(model.Email, model.Password))
                {

                    return RedirectToAction("Index", "Admin", new { Area = "Admin" });
                }
            }

            ViewBag.Failure = "The email or password is incorrect. Please try again!";

            return View(model);
        }

        [HttpGet]
        public ActionResult Logout()
        {
            WebSecurity.Logout();

            // instead of displaying logout page directly we redirect to confirmation page.
            // this will ensure auth cookie is cleared, which, in turn, ensures correct menu items are displayed

            return RedirectToAction("Login", "Auth", new { Area = "Auth" });
        }


        private ActionResult RedirectToLocal()
        {
                return RedirectToAction("Login", "Auth", new{ Area ="Auth"});
        }


	}
}