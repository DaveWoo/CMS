using System;
using System.Linq;
using System.Web.Mvc;
using Newtonsoft.Json;
using yycms.admin.Models;

namespace yycms.admin.Controllers
{
	public class SpiderController : BasicController
	{
		// GET: User
		public ActionResult Index()
		{
			//新闻分类
			ViewBag.Types = News_Types();
			ViewBag.Platforms = JsonConvert.SerializeObject(UnionCollection.Items);
			return View();
		}

		// GET: User
		public ActionResult Add()
		{
			//新闻分类
			ViewBag.Types = News_Types();
			ViewBag.Platforms = JsonConvert.SerializeObject(UnionCollection.Items);
			return View();
		}

		// GET: User
		public ActionResult Edit()
		{
			//新闻分类
			ViewBag.Types = News_Types();
			ViewBag.Platforms = JsonConvert.SerializeObject(UnionCollection.Items);
			return View();
		}

		public ActionResult News()
		{
			ViewBag.Spiders = JsonConvert.SerializeObject(DB.yy_Spider.Select(x => new { ID = x.ID, Name = x.Title }).ToList());
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