using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Services.Model
{
    public class RequestResponse
    {
    }

    public class AuthenticateUserRequest
    {
        public string Username { get; set; }
        public string Password { get; set; }

        public AuthenticateUserRequest(string userName, string password)
        {
            this.Username = userName;
            this.Password = password;
        }
    }

    public class AuthenticateUserResponse : ErrorInformation
    {
        public bool Authenticated { get; set; }
        
    }
}