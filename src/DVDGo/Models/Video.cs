using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DVDGo.Models
{
    public class Video {
        public int Id { get; set; }
        public string Name { get; set; }
        public int GenreId { get; set; }
        public int RatingId { get; set; }
        public bool DVD { get; set; }
        public bool BlueRay { get; set; }
    }
}
