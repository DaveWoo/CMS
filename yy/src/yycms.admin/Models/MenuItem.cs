﻿using System;

namespace yycms.admin.Models
{
	public class MenuItem
	{
		public Int64 id { get; set; }
		public Int64 pId { get; set; }
		public String name { get; set; }
		public String url { get; set; }
		public String target { get; set; }
	}
}