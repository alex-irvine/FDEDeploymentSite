using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace Services.Model
{
    public class NewsItem
    {
        public ObjectId _id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Text { get; set; }
        public bool Published { get; set; }
        public DateTime Date_published { get; set; }
        public DateTime Date_modified { get; set; }
    }
}