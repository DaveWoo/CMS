using System;
using System.Linq;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace yycms.admin.Controllers
{
	public class FansController : BasicController
	{
		// GET: Fans
		public ActionResult Index()
		{
			ViewBag.Types = News_Types();
			return View();
		}

		private String News_Types()
		{
			return JsonConvert.SerializeObject(DB.yy_News_Type
				.OrderBy(x => x.ShowIndex)
				.ToList());
		}
	}
}