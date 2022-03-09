using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplicationLibrary.Models
{
    public class Author
	{
		public int authorId { get; set; }
		public string firstName { get; set; }
		public string lastName { get; set; }

		public Author(int authorId_, string firstName_, string lastName_)
		{
			this.authorId = authorId_;
			this.firstName = firstName_;
			this.lastName = lastName_;
		}
	}
}
