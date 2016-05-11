using MongoDB.Bson;
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
    }

    [DataContractAttribute]
    public class AuthenticateUserResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public bool Authenticated { get; set; }
        [DataMemberAttribute]
        public Person Person { get; set; }
    }

    [DataContractAttribute]
    public class GetNewsItemsResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public List<NewsItem> NewsItems { get; set; }
    }

    [DataContractAttribute]
    public class InsertNewsItemRequest
    {
        [DataMemberAttribute]
        public NewsItem NewsItem { get; set; }
    }

    [DataContractAttribute]
    public class InsertNewsItemResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public ObjectId InsertedId { get; set; }
    }

    [DataContractAttribute]
    public class RegisterUserResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public ObjectId InsertedId { get; set; }
    }

    [DataContractAttribute]
    public class RegisterUserRequest
    {
        [DataMemberAttribute]
        public Person User { get; set; }
    }

    [DataContractAttribute]
    public class GetPersonResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public Person User { get; set; }
    }

    [DataContractAttribute]
    public class GetPersonRequest
    {
        [DataMemberAttribute]
        public string Username { get; set; }
    }
}