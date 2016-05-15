using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Services.Model
{
    public class DownloadLog
    {
        public ObjectId _id { get; set; }
        public string Username { get; set; }
        public DateTime DateDownloaded { get; set; }
        public string FileDownloaded { get; set; }
    }
}