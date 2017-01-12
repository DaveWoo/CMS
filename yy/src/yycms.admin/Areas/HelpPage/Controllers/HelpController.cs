using System;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using Newtonsoft.Json;
using yycms.admin.Areas.HelpPage.ModelDescriptions;
using yycms.admin.Areas.HelpPage.Models;
using yycms.admin.Controllers;
using yycms.admin.Models;
using yycms.admin.Utility;

namespace yycms.admin.Areas.HelpPage.Controllers
{
	/// <summary>
	/// The controller that will handle requests for the help page.
	/// </summary>
	public class HelpController : BasicController
	{
		private const string ErrorViewName = "Error";

		public HelpController()
			: this(GlobalConfiguration.Configuration)
		{
		}

		public HelpController(HttpConfiguration config)
		{
			Configuration = config;
		}

		public HttpConfiguration Configuration { get; private set; }

		public ActionResult Index()
		{
			ViewBag.DocumentationProvider = Configuration.Services.GetDocumentationProvider();
			return View(Configuration.Services.GetApiExplorer().ApiDescriptions);
		}

		public ActionResult Api(string apiId, string jsonRequestValue)
		{
			if (!String.IsNullOrEmpty(apiId))
			{
				HelpPageApiModel apiModel = Configuration.GetHelpPageApiModel(apiId);
				if (apiModel != null)
				{
					if (!string.IsNullOrWhiteSpace(jsonRequestValue))
					{
						try
						{
							string relativePath = apiModel.ApiDescription.RelativePath;
							string data = string.Empty;
							if (relativePath.EndsWith("{id}"))
							{
								relativePath = apiModel.ApiDescription.RelativePath.Replace("{id}", "");
								relativePath += jsonRequestValue;
							}
							else
							{
								data = jsonRequestValue;
							}
							string path = string.Format("{0}://{1}/{2}", Request.Url.Scheme, Request.Url.Authority, relativePath);
							apiModel.ResponseMessage = GetResponse(path, apiModel.ApiDescription.HttpMethod, data);
						}
						catch (Exception ex)
						{
							apiModel.ResponseMessage += ex.Message;
						}
					}
					return View(apiModel);
				}
			}

			return View(ErrorViewName);
		}

		private string GetResponse(string path, HttpMethod method, string data)
		{
			Encoding encoding = Encoding.GetEncoding("gb2312");
			byte[] bytesToPost = encoding.GetBytes(data);

			string response = string.Empty;
			var request = (HttpWebRequest)HttpWebRequest.Create(path);
			var session = Request.Cookies.Get(Const.SessionId);
			Cookie cookie = ToCookie(session, request.RequestUri.Host);
			CookieCollection cookieCollection = new CookieCollection();
			request.CookieContainer = new CookieContainer();
			// Set some reasonable limits on resources used by this request
			request.MaximumAutomaticRedirections = 4;
			request.MaximumResponseHeadersLength = 4;
			request.Method = method.ToString();
			request.CookieContainer = new CookieContainer();
			request.CookieContainer.Add(cookie);

			#region  post content  
			if (method == HttpMethod.Post)
			{
				request.ContentType = "application/json";
				request.MediaType = "application/json";
				request.Accept = "application/json";
				request.ContentLength = data.Length;
				Stream requestStream = request.GetRequestStream();
				requestStream.Write(bytesToPost, 0, data.Length);
				requestStream.Close();
			}
			#endregion

			var httpResponse = (HttpWebResponse)request.GetResponse();

			using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
			{
				response = JsonHelper.FormatJson(streamReader.ReadToEnd());
			}

			return response;
		}

		public ActionResult ResourceModel(string modelName)
		{
			if (!String.IsNullOrEmpty(modelName))
			{
				ModelDescriptionGenerator modelDescriptionGenerator = Configuration.GetModelDescriptionGenerator();
				ModelDescription modelDescription;
				if (modelDescriptionGenerator.GeneratedModels.TryGetValue(modelName, out modelDescription))
				{
					return View(modelDescription);
				}
			}

			return View(ErrorViewName);
		}

		public static Cookie ToCookie(HttpCookie oCookie, string requestHost)
		{
			Cookie oC = new Cookie();

			// Convert between the System.Net.Cookie to a System.Web.HttpCookie...
			oC.Domain = requestHost;
			oC.Expires = oCookie.Expires;
			oC.Name = oCookie.Name;
			oC.Path = oCookie.Path;
			oC.Secure = oCookie.Secure;
			oC.Value = oCookie.Value;

			return oC;
		}
	}
}