using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Services.Model
{
    public class RequestResponse
    {
    }

    [DataContractAttribute]
    public class AuthenticateUserRequest
    {
        [DataMemberAttribute]
        public string Username { get; set; }
        [DataMemberAttribute]
        public string Password { get; set; }

        public AuthenticateUserRequest(string userName, string password)
        {
            this.Username = userName;
            this.Password = password;
        }
    }
    [DataContractAttribute]
    public class AuthenticateUserResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public bool Authenticated { get; set; }
        
    }
}