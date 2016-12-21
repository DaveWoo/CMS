using Quartz;

namespace yycms.service
{
	public class TaskMatcher : IMatcher<JobKey>
	{
		public bool IsMatch(JobKey key)
		{
			return true;
		}
	}
}