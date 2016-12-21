using System;
using System.Linq;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace yycms.admin.Controllers
{
	public class KeywordsController : BasicController
	{
		//关键字列表
		public ActionResult Index()
		{
			return View();
		}

		//新增关键字
		public ActionResult Add()
		{
			ViewBag.NewsTypes = News_Types();
			ViewBag.ProductTypes = Product_Types();
			return View();
		}

		// 修改关键字
		public ActionResult Edit()
		{
			ViewBag.NewsTypes = News_Types();
			ViewBag.ProductTypes = Product_Types();
			return View();
		}

		// 关键字分类
		public ActionResult Types()
		{
			return View();
		}

		private String News_Types()
		{
			return JsonConvert.SerializeObject(DB.yy_News_Type
				.OrderBy(x => x.ShowIndex)
				.ToList());
		}

		private String Product_Types()
		{
			return JsonConvert.SerializeObject(DB.yy_Product_Type
				.OrderBy(x => x.ShowIndex)
				.ToList());
		}
	}
}