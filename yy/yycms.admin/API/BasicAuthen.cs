using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Http.Filters;
using Newtonsoft.Json;
using yycms.admin.Models;
using yycms.entity;

namespace yycms.admin.API
{
	public class BasicAuthenAttribute : ActionFilterAttribute
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

		protected yy_User User
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
					var PermissionStr = HttpRuntime.Cache.Get(Const.PermissionCacheKey);

					if (PermissionStr == null)
					{
						using (var DB = new DBConnection())
						{
							_Permission = DB.Database.SqlQuery<yy_Permission>(
								String.Format(Const.PermissionSql, User.Permission)).ToList();
						}

						HttpRuntime.Cache.Insert(Const.PermissionCacheKey, _Permission);
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

		public override void OnActionExecuting(System.Web.Http.Controllers.HttpActionContext actionContext)
		{
			#region 如果无需权限验证直接跳过

			if (actionContext.ActionDescriptor.GetCustomAttributes<AllowAnonymousAttribute>().Count > 0)
			{
				base.OnActionExecuting(actionContext);

				return;
			}

			#endregion 如果无需权限验证直接跳过

			String UserStr = String.Empty;

			try
			{
				var cookies = actionContext.Request.Headers.GetCookies().FirstOrDefault().Cookies;

				if (cookies != null)
				{
					var UserCK = cookies.Where(p => p.Name == Const.SessionId).FirstOrDefault();
					if (UserCK != null && !String.IsNullOrEmpty(UserCK.Value))
					{
						try
						{
							_User = JsonConvert.DeserializeObject<yy_User>(
								HttpUtility.UrlDecode(UserCK.Value)
								);
						}
						catch (Exception ex)
						{
							throw new Exception("OnActionExecuting:" + ex.Message);
						}
					}
				}
			}
			catch (Exception ex)
			{
				throw new Exception("OnActionExecuting:" + ex.Message);
			}

			if (User == null)
			{
				actionContext.Response = new HttpResponseMessage(HttpStatusCode.Forbidden)
				{
					Content = new StringContent("无效的用户",
						Encoding.UTF8,
						"application/json")
				};

				return;
			}

			//String ActionPath = "/" + actionContext.ActionDescriptor.ControllerDescriptor.ControllerName.ToLower() + "/" + actionContext.ActionDescriptor.ActionName.ToLower();
			//如果没有权限访问当前API方法
			//如果需要验证每一个API的权限可继续验证，这里暂时不需要了
		}
	}
}