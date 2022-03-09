using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplicationLibrary.Models
{
	public class Rarity
	{
		public int rarityId { get; set; }
		public int points { get; set; }
		public string description { get; set; }

		public Rarity(int rarityId_, int points_, string description_)
		{
			this.rarityId = rarityId_;
			this.points = points_;
			this.description = description_;
		}
	}
}
