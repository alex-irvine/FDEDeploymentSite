using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;



namespace Services.Model
{
    public class Youtube
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string _id { get; set; }
        public string urlyoutube { get; set; }
        //public bool urlbool { get; set; }
    }
}