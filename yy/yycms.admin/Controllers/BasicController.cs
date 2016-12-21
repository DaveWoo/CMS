using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using yycms.admin.Models;
using yycms.entity;

namespace yycms.admin.Controllers
{
	public class BasicController : Controller
	{
		#region 数据库

		private DBConnection _DB;

		protected DBConnection DB
		{
			get { if (_DB == null) { _DB = new DBConnection(); } return _DB; }
		}

		#endregion 数据库

		#region 当前用户

		private yy_User _User;

		protected new yy_User User
		{
			get { return _User; }
			set { _User = value; }
		}

		#endregion 当前用户

		#region 当前用户的权限集合

		private List<yy_Permission> _Permission;

		protected List<yy_Permission> Permission
		{
			get
			{
				if (_Permission == null)
				{
					var PermissionStr = HttpRuntime.Cache.Get(Const.PermissionCacheKey + User.ID.ToString());

					if (PermissionStr == null)
					{
						#region 用户权限

						_Permission = DB.Database.SqlQuery<yy_Permission>(
							String.Format(Const.PermissionSql, User.Permission)).ToList();
						HttpRuntime.Cache.Insert(Const.PermissionCacheKey + User.ID.ToString(), _Permission);

						#endregion 用户权限

						#region 权限分组

						var _PermissionType = DB.yy_Permission_Type.ToList();
						HttpRuntime.Cache.Insert(Const.PermissionTypeCacheKey, _PermissionType);

						#endregion 权限分组
					}
					else
					{
						_Permission = PermissionStr as List<yy_Permission>;
					}
				}

				return _Permission;
			}
		}

		#endregion 当前用户的权限集合

		#region 系统配置

		private yy_SiteSetting _SiteSetting;

		protected yy_SiteSetting SiteSetting
		{
			get
			{
				if (_SiteSetting == null)
				{
					var SiteSettingStr = HttpRuntime.Cache.Get(Const.SiteSettingKey);

					if (SiteSettingStr == null)
					{
						_SiteSetting = DB.yy_SiteSetting.FirstOrDefault();

						HttpRuntime.Cache.Insert(Const.SiteSettingKey, _SiteSetting);
					}
					else
					{
						_SiteSetting = SiteSettingStr as yy_SiteSetting;
					}
				}

				return _SiteSetting;
			}
		}

		#endregion 系统配置

		/// <summary>
		/// 权限验证，无需权限请在action或controller标记AllowAnonymousAttribute
		/// </summary>
		/// <param name="filterContext"></param>
		protected override void OnActionExecuting(ActionExecutingContext filterContext)
		{
			#region 站点配置

			ViewBag.SiteSetting = SiteSetting;

			#endregion 站点配置

			//todo

			#region 获取用户信息

			var UserCK = Request.Cookies.Get(Const.SessionId);
			//UserCK = null;
			if (UserCK != null && !String.IsNullOrEmpty(UserCK.Value))
			{
				try
				{
					User = JsonConvert.DeserializeObject<yy_User>(
						HttpUtility.UrlDecode(UserCK.Value)
						);
				}
				catch { }
			}

			#endregion 获取用户信息

			#region 如果无需权限验证直接跳过

			if (filterContext.ActionDescriptor.IsDefined(typeof(AllowAnonymousAttribute), true) ||
			  filterContext.ActionDescriptor.ControllerDescriptor.IsDefined(typeof(AllowAnonymousAttribute), true))
			{
				base.OnActionExecuting(filterContext);

				return;
			}

			#endregion 如果无需权限验证直接跳过

			#region 登陆失败，或没有登陆

			if (User == null)
			{
				filterContext.Result = new RedirectResult("/Admin/Login");
				return;
			}

			#endregion 登陆失败，或没有登陆

			#region 没有权限访问当前页面

			String ActionPath = "/" +
				filterContext.ActionDescriptor.ControllerDescriptor.ControllerName.ToLower() +
				"/" +
				filterContext.ActionDescriptor.ActionName.ToLower();

			var CurrentViewPage = Permission.Where(x => x.PageName == ActionPath).FirstOrDefault();

			if (CurrentViewPage == null)
			{
				filterContext.Result = new RedirectResult("/Admin/NoPermission");
				return;
			}
			//当前访问的页面，用于在客户端定位页面所属的菜单类目，做选中效果
			ViewBag.CurrentPage = CurrentViewPage;

			base.OnActionExecuting(filterContext);

			#endregion 没有权限访问当前页面

			ViewBag.User = User;
		}

		/// <summary>
		/// 资源释放
		/// </summary>
		/// <param name="disposing"></param>
		protected override void Dispose(bool disposing)
		{
			DB.Dispose();
			base.Dispose(disposing);
		}
	}
}