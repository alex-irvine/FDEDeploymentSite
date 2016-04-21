using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Services.Model
{
    [DataContractAttribute]
    public class ErrorInformation
    {
        [DataMemberAttribute]
        public bool Errored { get; set; }
        [DataMemberAttribute]
        public string Message { get; set; }
    }
}
