using System;
using System.Linq;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace yycms.admin.Controllers
{
	public class SinglePageController : BasicController
	{
		//单页列表
		public ActionResult Index()
		{
			return View();
		}

		//新增单页
		public ActionResult Add()
		{
			return View();
		}

		// 修改单页
		public ActionResult Edit()
		{
			return View();
		}

		// GET: 单页分类
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
	}
}