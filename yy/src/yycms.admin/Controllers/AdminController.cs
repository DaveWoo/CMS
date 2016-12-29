using System.Web.Mvc;

namespace yycms.admin.Controllers
{
	public class AdminController : BasicController
	{
		public ActionResult Index()
		{
			ViewBag.Title = "Home Page";
			return View();
		}

		public ActionResult Setting()
		{
			return View();
		}

		[AllowAnonymous]
		public ActionResult Login()
		{
			if (User != null)
			{
				return new RedirectResult("/Admin/index");
			}
			return View();
		}
	}
}