using System;
using System.Configuration;
using Microsoft.AspNet.SignalR.Client;
using yycms.service.PlugIn;

namespace yycms.service.Queues
{
	public class CodeCompile : IQueue
	{
		public bool Enable
		{
			get
			{
				return true;
			}
		}

		public string Path
		{
			get
			{
				return this.GetType().Name;
			}
		}

		public void ReceiveCompleted(String body)
		{
			if (String.IsNullOrEmpty(body))
			{
				return;
			}
			var globalHub = ConfigurationManager.AppSettings["GlobalHub"];
			var compileEvent = ConfigurationManager.AppSettings["CompileEvent"];
			try
			{
				var result = new PageBuilder().BuildPage(body, 0);

				NSoup.Nodes.Document doc = NSoup.NSoupClient.Parse(result);

				result = doc.OuterHtml();

				Signal_Excute(globalHub, x => { x.Invoke(compileEvent, 0, result); });
			}
			catch (Exception ex)
			{
				Signal_Excute(globalHub, x => { x.Invoke(compileEvent, 1, ex.Message); });
			}
		}

		#region 互动发送消息

		/// <summary>
		/// 互动发送消息
		/// </summary>
		/// <param name="HubName"></param>
		/// <param name="HubAction"></param>
		public void Signal_Excute(String HubName, Action<IHubProxy> HubAction)
		{
			var HubUrl = string.Format("{0}/{1}", ConfigurationManager.AppSettings["AdminSiteUrl"], ConfigurationManager.AppSettings["Signal"]);

			var Connection = new HubConnection(HubUrl);

			var HubItem = Connection.CreateHubProxy(HubName);

			Connection.Start().ContinueWith(task =>
			{
				if (!task.IsFaulted)
				{
					HubAction(HubItem);
				}
			}).Wait();

			Connection.Stop();
		}

		#endregion 互动发送消息
	}
}