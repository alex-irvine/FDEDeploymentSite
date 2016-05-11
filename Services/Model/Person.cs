using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Services.Model
{
    public class Person
    {
        public ObjectId _id { get; set; }
        public string Username { get; set; }
        public string Company { get; set; }
        public bool IsAdmin { get; set; }
        public string Password { get; set; }
        public string Salt { get; set; }
    }
}