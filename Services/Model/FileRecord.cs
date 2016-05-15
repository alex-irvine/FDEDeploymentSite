using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Services.Model
{
    public class FileRecord
    {
        public ObjectId _id { get; set; }
        public string FileName { get; set; }
    }
}