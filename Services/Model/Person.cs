using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Services.Model
{
    public class Person
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Company { get; set; }
        public bool IsAdmin { get; set; }

    }
}