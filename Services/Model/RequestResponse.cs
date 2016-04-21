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
<<<<<<< HEAD

=======
>>>>>>> d0f63ad158b3a5d9a6a407478898166e0f5b00f0
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