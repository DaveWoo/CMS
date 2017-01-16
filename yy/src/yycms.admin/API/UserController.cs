﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using yycms.admin.Models;
using yycms.entity;

namespace yycms.admin.API
{
	/// <summary>
	/// 用户
	/// </summary>
	[BasicAuthen]
	public class UserController : BasicAPI
	{
		#region 用户列表

		/// <summary>
		/// 获取用户列表
		/// </summary>
		/// <returns></returns>
		[HttpPost]
		[System.Web.Http.Route("api/User/Get"), ResponseType(typeof(List<yy_User>))]
		public async Task<ResponseData<yy_User>> Get(RequestEntity value)
		//public async Task<IHttpActionResult> Get(RequestEntity value)
		{
			try
			{
				// 查询的表名称
				Type Table = typeof(yy_User);

				var FormData = await Request.Content.ReadAsAsync<Dictionary<String, String>>();

				#region where condition

				//筛选条件
				var Where = String.Empty;

				var WhereBuild = new List<string>();

				#region 用户标题

				if (!String.IsNullOrEmpty(value.Title))
				{
					WhereBuild.Add("Title like '%" + value.Title + "%'");
				}

				#endregion 用户标题

				#region 用户分类

				if (value.TypeID > 0)
				{
					WhereBuild.Add("TypeIDs like '%," + value.TypeID + ",%'");
				}

				#endregion 用户分类

				#region 根据时间过滤

				#region 大于等于 开始时间 && 小于等于 结束时间

				if (!String.IsNullOrEmpty(value.StartTime) && !String.IsNullOrEmpty(value.EndTime))
				{
					DateTime st, et;

					if (DateTime.TryParse(value.StartTime, out st) && DateTime.TryParse(value.EndTime, out et))
					{
						WhereBuild.Add(" CreateDate >= '" + st.ToString("yyyy-MM-dd") + " 00:00:00' AND CreateDate <= '" + et.ToString("yyyy-MM-dd") + " 23:59:59'");
					}
				}

				#endregion 大于等于 开始时间 && 小于等于 结束时间

				#region 大于等于开始时间

				else if (!String.IsNullOrEmpty(value.StartTime))
				{
					DateTime st;
					if (DateTime.TryParse(value.StartTime, out st))
					{
						WhereBuild.Add(" CreateDate >= '" + st.ToString("yyyy-MM-dd") + " 00:00:00'");
					}
				}

				#endregion 大于等于开始时间

				#region 小于等于结束时间

				else if (!String.IsNullOrEmpty(value.EndTime))
				{
					DateTime et;
					if (DateTime.TryParse(value.EndTime, out et))
					{
						WhereBuild.Add(" CreateDate <= '" + et.ToString("yyyy-MM-dd") + " 23:59:59'");
					}
				}

				#endregion 小于等于结束时间

				#endregion 根据时间过滤

				if (WhereBuild.Count > 0)
				{
					Where = " WHERE " + String.Join(" AND ", WhereBuild);
				}

				#endregion where condition

				#region OrderBy

				//排序规则
				String OrderBy = " ID DESC ";
				if (!String.IsNullOrEmpty(value.OrderBy))
				{
					OrderBy = " " + value.OrderBy + " " + (value.IsDesc ? "DESC" : "ASC");
				}

				#endregion OrderBy

				#region 拼接sql语句

				String colsStr = " * ";

				#region 查询数据

				String QuertCMD = String.Format(@"SELECT TOP {0} * FROM (
                                SELECT ROW_NUMBER() OVER (ORDER BY {4}) AS RowNumber," + colsStr + @" FROM {2} WITH(NOLOCK) {3}
                                ) A WHERE RowNumber > {0} * ({1}-1)", value.PageSize, value.PageIndex + 1, "[" + Table.Name + "]", Where, OrderBy);

				#endregion 查询数据

				#region 查询总数

				String DataCountCMD = @"SELECT COUNT(1) FROM [" + Table.Name + "] WITH(NOLOCK) " + Where;

				#endregion 查询总数

				#endregion 拼接sql语句

				#region 执行查询并返回数据

				var DataCount = DB.Database.SqlQuery<int>(DataCountCMD).FirstOrDefault();
				return new ResponseData<yy_User>(value.PageSize,
					value.PageIndex,
					DataCount,
					(DataCount % value.PageSize == 0 ? DataCount / value.PageSize : DataCount / value.PageSize + 1),
					DB.Database.SqlQuery<yy_User>(QuertCMD).ToList());

				#endregion 执行查询并返回数据
				// return Ok(results);
			}
			catch (Exception ex)
			{
				//this.log.Error(ex);
				//return this.BadRequest(ex.Message);
				throw new Exception(ex.Message);
			}
		}

		#endregion 用户列表

		#region 用户详情

		/// <summary>
		/// 获取用户详情
		/// </summary>
		/// <param name="id">用户ID</param>
		/// <returns></returns>
		[HttpGet]
		public UserModel Get(int id)
		{
			//用户详情
			var userDetail = DB.yy_User.Find(id);

			#region 微信公众平台

			var wechat = DB.yy_Platforms.Where(x => x.Code == (int)Unions.WeiXinGZ && x.UserID == id).FirstOrDefault();

			#endregion 微信公众平台

			return new UserModel()
			{
				User = userDetail,
				wechat = wechat
			};
		}

		#endregion 用户详情

		#region 添加用户

		/// <summary>
		/// 添加用户
		/// </summary>
		/// <param name="value">用户实体</param>
		[HttpPost]
		public ResponseItem Post(yy_User value)
		{
			var ExistsUser = DB.yy_User.Where(x => x.UserName == value.UserName).FirstOrDefault();
			if (ExistsUser != null)
			{
				return new ResponseItem(1, "已存在的用户账号。");
			}
			try
			{
				DB.yy_User.Add(value);
				DB.SaveChanges();
				return new ResponseItem(0, "添加用户成功。");
			}
			catch (Exception ex)
			{
				return new ResponseItem(2, ex.Message);
			}
		}

		#endregion 添加用户

		#region 修改用户

		/// <summary>
		/// 修改用户
		/// </summary>
		/// <param name="value">用户详情</param>
		[HttpPut]
		public ResponseItem Put(yy_User value)
		{
			var _Operator = DB.yy_User.Find(value.ID);
			if (_Operator != null)
			{
				if (!_Operator.UserPwd.Equals(value.UserPwd))
				{
					value.UserPwd = MD5(value.UserPwd);
					_Operator.UserPwd = value.UserPwd;
				}
				_Operator.Address = value.Address;
				_Operator.CityID = value.CityID;
				_Operator.CountryID = value.CountryID;
				_Operator.CreateDate = value.CreateDate;
				_Operator.DistrictID = value.DistrictID;
				_Operator.Gender = value.Gender;
				_Operator.LockFlag = value.LockFlag;
				_Operator.Mail = value.Mail;
				_Operator.Mobile = value.Mobile;
				_Operator.Permission = value.Permission;
				_Operator.ProvinceID = value.ProvinceID;
				_Operator.Role = value.Role;
				_Operator.HeadImgUrl = value.HeadImgUrl;
				DB.SaveChanges();
				return new ResponseItem(0, "");
			}
			return new ResponseItem(1, "不存在的用户。");
		}

		#endregion 修改用户

		#region 删除用户

		/// <summary>
		/// 删除用户
		/// </summary>
		/// <param name="id">用户ID。</param>
		[HttpDelete]
		public ResponseItem Delete(int id)
		{
			DB.Database.ExecuteSqlCommand("DELETE yy_User WHERE ID = " + id);
			DB.Database.ExecuteSqlCommand("DELETE yy_Platforms WHERE UserID = " + id);
			return new ResponseItem(0, "");
		}

		#endregion 删除用户

		#region 用户登陆

		/// <summary>
		/// 登陆
		/// </summary>
		/// <returns></returns>
		[HttpPost]
		[AllowAnonymous]
		[ApiExplorerSettings(IgnoreApi = true)]
		public async Task<HttpResponseMessage> Login()
		{
			var FormData = await Request.Content.ReadAsAsync<JToken>();
			var LoginName = FormData["LoginName"].ToString();
			var Password = FormData["Password"].ToString();
			var Remember = FormData["Remember"].Value<Boolean>();
			if (String.IsNullOrEmpty(LoginName) || String.IsNullOrEmpty(Password))
			{
				return ResponseMessage(new { Code = 1, Error = "登录名或者密码不得为空。" });
			}

			Password = MD5(Password);

			var _User = DB.yy_User.Where(x => x.UserName == LoginName &&
					x.UserPwd == Password).FirstOrDefault();

			if (_User == null)
			{
				return ResponseMessage(new { Code = 2, Error = "账号或密码错误，登陆失败。" });
			}

			if (_User.LockFlag != 1)
			{
				return ResponseMessage(new { Code = 3, Error = "账号已经被锁定，登陆失败。" });
			}

			var UserCookie = new CookieHeaderValue(Const.SessionId,
				JsonConvert.SerializeObject(_User))
			{
				Path = "/",
				HttpOnly = false
			};

			if (Remember)
			{
				UserCookie.Expires = DateTime.Now.AddDays(7);
			}
			System.Web.HttpCookie newcookie = new HttpCookie("yycms");
			newcookie.Values["username"] = LoginName;
			newcookie.Values["password"] = Password;
			newcookie.Expires = DateTime.Now.AddDays(1);
			HttpContext.Current.Response.Cookies.Add(newcookie);

			return ResponseMessage(new { Code = 0, Error = "" }, UserCookie);
		}

		#endregion 用户登陆

		#region 用户登出

		/// <summary>
		/// 登陆
		/// </summary>
		/// <returns></returns>
		[HttpGet]
		[AllowAnonymous]
		[ApiExplorerSettings(IgnoreApi = true)]
		public HttpResponseMessage LoginOut()
		{
			HttpRuntime.Cache.Remove(Const.PermissionCacheKey + User.ID.ToString());
			HttpRuntime.Cache.Remove(Const.PermissionTypeCacheKey);
			HttpRuntime.Cache.Remove(Const.SiteSettingKey);
			var UserCookie = new CookieHeaderValue(Const.SessionId, String.Empty)
			{
				Path = "/",
				HttpOnly = false
			};

			//var UserCK = Request.Cookies.Get(Const.SessionId);
			////UserCK = null;
			//if (UserCK != null && !String.IsNullOrEmpty(UserCK.Value))
			//{
			//	try
			//	{
			//		User = JsonConvert.DeserializeObject<yy_User>(
			//			HttpUtility.UrlDecode(UserCK.Value)
			//			);
			//	}
			//	catch { }
			//}

			UserCookie.Expires = DateTime.Now.AddDays(-7);
			return ResponseMessage(new { Code = 0, Error = "" }, UserCookie);
		}

		#endregion 用户登出

		#region 显示或隐藏用户

		/// <summary>
		/// 显示或隐藏用户
		/// </summary>
		/// <param name="value">用户对象。</param>
		/// <returns></returns>
		[HttpPut]
		public ResponseItem ShowHide(yy_User value)
		{
			var _News = DB.yy_User.Find(value.ID);
			if (_News != null)
			{
				_News.LockFlag = value.LockFlag;
				DB.SaveChanges();

				return new ResponseItem(0, "");
			}

			return new ResponseItem(2, "不存在的用户。");
		}

		#endregion 显示或隐藏用户

		#region 根据ID批量删除用户

		/// <summary>
		/// 批量删除用户
		/// </summary>
		/// <param name="ids">用户ID集合，用英文逗号链接。</param>
		[HttpDelete]
		public ResponseItem DeleteByIDs(String ids)
		{
			var IDs = ids.Split(new String[] { "," }, StringSplitOptions.RemoveEmptyEntries);

			foreach (var v in IDs)
			{
				long id = 0;

				if (long.TryParse(v, out id))
				{
					DB.Database.ExecuteSqlCommand("DELETE yy_User WHERE ID = " + id);
				}
			}
			return new ResponseItem(0, "");
		}

		#endregion 根据ID批量删除用户

		#region 根据ID批量显示用户

		/// <summary>
		/// 批量显示用户
		/// </summary>
		/// <param name="ids">用户ID集合，用英文逗号链接。</param>
		[HttpPut]
		public ResponseItem ShowByIDs(String ids)
		{
			var IDs = ids.Split(new String[] { "," }, StringSplitOptions.RemoveEmptyEntries);

			foreach (var v in IDs)
			{
				long id = 0;

				if (long.TryParse(v, out id))
				{
					DB.Database.ExecuteSqlCommand("UPDATE yy_User SET LockFlag = 1 WHERE ID = " + id);
				}
			}
			return new ResponseItem(0, "");
		}

		#endregion 根据ID批量显示用户

		#region 根据ID批量隐藏用户

		/// <summary>
		/// 批量隐藏用户
		/// </summary>
		/// <param name="ids">用户ID集合，用英文逗号链接。</param>
		[HttpPut]
		public ResponseItem HideByIDs(String ids)
		{
			var IDs = ids.Split(new String[] { "," }, StringSplitOptions.RemoveEmptyEntries);

			foreach (var v in IDs)
			{
				long id = 0;

				if (long.TryParse(v, out id))
				{
					DB.Database.ExecuteSqlCommand("UPDATE yy_User SET LockFlag = 0 WHERE ID = " + id);
				}
			}
			return new ResponseItem(0, "");
		}

		#endregion 根据ID批量隐藏用户
	}
}