using Dropbox.Api;
using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
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

    [DataContractAttribute]
    public class UploadRequest
    {
        [MessageHeader(MustUnderstand = true)]
        public string FileName { get; set; }
     
        [MessageBodyMember(Order = 1)]
        public Stream Stream { get; set; }
    }

    [DataContractAttribute]
    public class UploadResponse
    {
        [DataMemberAttribute]
        public bool UploadSucceeded { get; set; }

        [DataMemberAttribute]
        public bool Errored { get; set; }

        [DataMemberAttribute]
        public string Message { get; set; }
    }

    [MessageContract]
    public class DownloadResponse
    {
        [MessageHeader(MustUnderstand = true)]
        public string FileName { get; set; }

        [MessageBodyMember(Order = 1)]
        public Stream Stream { get; set; }

        //[DataMemberAttribute]
        //public bool Errored { get; set; }

        //[DataMemberAttribute]
        //public string Message { get; set; }
    }

    [MessageContract]
    public class DownloadRequest
    {
        [MessageBodyMember]
        public string FileName;
    }

    [DataContractAttribute]
    public class GetDropboxClientResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public DropboxClient DropboxClient { get; set; }
    }

}