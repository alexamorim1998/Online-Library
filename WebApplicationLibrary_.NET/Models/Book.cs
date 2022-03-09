using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplicationLibrary.Models
{
	public class Book
	{
		public int bookId { get; set; }
		public int authorId { get; set; }
		public string ISBN { get; set; }
		public int rarityId { get; set; }
		public string title { get; set; }
		public bool isBorrowed { get; set; }

		public Book(int bookId_, int authorId_, string ISBN_, int rarityId_, string title_, bool isBorrowed_)
		{
			this.bookId = bookId_;
			this.authorId = authorId_;
			this.ISBN = ISBN_;
			this.rarityId = rarityId_;
			this.title = title_;
			this.isBorrowed = isBorrowed_;
		}
	}

}
