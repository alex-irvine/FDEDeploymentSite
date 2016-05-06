using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Services.Model
{
    public class News
    {
        public int Id { get; set; }
        public string title { get; set; }
        public int userId { get; set; }
        public string text { get; set; }
        public bool published { get; set; }
        public DateTime date_published { get; set; }
        public DateTime date_modified { get; set; }
    }
}