using System;
using System.Configuration;
using System.Diagnostics;
using System.Threading;

namespace yycms.service
{
	public class Log
	{
		public void Add(String Source, String _Content, EventLogEntryType _Type)
		{
			String LogName = ConfigurationManager.AppSettings["ServiceName"];

			if (String.IsNullOrEmpty(LogName))
			{
				LogName = "yueyaCms.Service";
			}

			String MachineName = ".";

			if (!EventLog.SourceExists(Source, MachineName))
			{
				var SourceEntity = new EventSourceCreationData(Source, LogName)
				{
					MachineName = MachineName
				};
				EventLog.CreateEventSource(SourceEntity);
			}

			new EventLog(LogName, MachineName, Source).WriteEntry(_Content,
				_Type,
				Thread.CurrentContext.ContextID);
		}
	}
}