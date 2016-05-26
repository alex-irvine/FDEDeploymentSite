using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace Services.Model
{
    public class Comment
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string _id { get; set; }
        public string Author { get; set; }
        public string Text { get; set; }
        public bool Published { get; set; }
        public DateTime Date_published { get; set; }
    }
}