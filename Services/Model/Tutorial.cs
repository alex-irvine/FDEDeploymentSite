using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Services.Model
{
    public class Tutorial
    {
        public int Id { get; set; }
        public int page { get; set; }
        public string title { get; set; }
        public int userId { get; set; }
        public string text { get; set; }
        public string video { get; set; }
        public bool published { get; set; }
        public DateTime date_published { get; set; }
        public DateTime date_modified { get; set; }
    }
}