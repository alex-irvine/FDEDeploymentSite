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
        public string description { get; set; }
        public string picture { get; set; }
        public string text { get; set; }
        public bool published { get; set; }
    }
}