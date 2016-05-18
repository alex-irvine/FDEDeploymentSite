using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Services.Model
{
    public class TutorialItem
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string _id { get; set; }
        public string Title { get; set; }
        public string Username { get; set; }
        public bool Published { get; set; }
        public DateTime DatePublished { get; set; }
        public DateTime DateModified { get; set; }

        public List<TutorialPage> Pages { get; set; }
    }
}