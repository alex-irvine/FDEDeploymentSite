using Dropbox.Api;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using Services.Model;
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

    #region Users

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
    public class RegisterUserResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public string InsertedId { get; set; }
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
    public class GetApprovedUsersResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public List<Person> Users { get; set; }
    }

    [DataContractAttribute]
    public class GetNotApprovedUsersResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public List<Person> Users { get; set; }
    }
    [DataContractAttribute]
    public class GetApprovedAdminsResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public List<Person> Users { get; set; }
    }
    [DataContractAttribute]
    public class ApproveUserResponse : ErrorInformation
    {

    }
    [DataContractAttribute]
    public class ApproveUserRequest
    {
        [DataMemberAttribute]
        public string _id { get; set; }
        [DataMemberAttribute]
        public bool Approve { get; set; }
    }
    [DataContractAttribute]
    public class DeleteUserResponse : ErrorInformation
    {

    }

    [DataContractAttribute]
    public class DeleteUserRequest
    {
        [DataMemberAttribute]
        public string _id { get; set; }
    }

    [DataContractAttribute]
    public class SetAdminResponse : ErrorInformation
    {

    }

    [DataContractAttribute]
    public class SetAdminRequest
    {
        [DataMemberAttribute]
        public string _id { get; set; }
    }
    #endregion

    #region News
    [DataContractAttribute]
    public class GetNewsItemsResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public List<NewsItem> NewsItems { get; set; }
    }

    [DataContractAttribute]
    public class GetNewsItemByIdRequest
    {
        [DataMemberAttribute]
        public string _id { get; set; }
    }

    [DataContractAttribute]
    public class GetNewsItemByIdResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public NewsItem News { get; set; }
    }

    [DataContractAttribute]
    public class GetPublishedNewsItemsResponse : ErrorInformation
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
        public string InsertedId { get; set; }
    }

    [DataContractAttribute]
    public class PublishNewsItemRequest
    {
        [DataMemberAttribute]
        public string _id { get; set; }
        [DataMemberAttribute]
        public bool IsPublished { get; set; }
    }

    [DataContractAttribute]
    public class PublishNewsItemResponse : ErrorInformation
    {

    }

    [DataContract]
    public class DeleteNewsItemRequest
    {
        [DataMember]
        public string _id { get; set; }
    }

    [DataContract]
    public class DeleteNewsItemResponse : ErrorInformation
    {

    }

    [DataContract]
    public class UpdateNewsItemRequest
    {
        [DataMember]
        public NewsItem NewsItem { get; set; }
    }

    public class UpdateNewsItemResponse : ErrorInformation
    {

    }
    #endregion

    #region Files
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

    [DataContractAttribute]
    public class InsertFileRecordRequest
    {
        [DataMemberAttribute]
        public string FileName { get; set; }
    }

    [DataContractAttribute]
    public class InsertFileRecordResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public string OldFileName { get; set; }
        [DataMemberAttribute]
        public bool DeleteOldFile { get; set; }
    }

    [DataContractAttribute]
    public class GetFileRecordResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public string FileName { get; set; }
        [DataMemberAttribute]
        public string DropboxKey { get; set; }
    }

    [DataContractAttribute]
    public class LogFileDownloadResponse : ErrorInformation
    {

    }

    [DataContractAttribute]
    public class LogFileDownloadRequest
    {
        [DataMemberAttribute]
        public DownloadLog DownloadLog { get; set; }
    }
    #endregion

    #region Tutorials
    [DataContract]
    public class InsertTutorialItemRequest
    {
        [DataMember]
        public TutorialItem TutorialItem { get; set; }
    }

    [DataContract]
    public class InsertTutorialItemResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public string _idtutorial { get; set; }
    }

    [DataContract]
    public class GetTutorialItemsResponse : ErrorInformation
    {
        [DataMember]
        public List<TutorialItem> TutorialItems { get; set; }
    }

    [DataContract]
    public class GetPublishTutoItemsResponse : ErrorInformation
    {
        [DataMember]
        public List<TutorialItem> TutorialItems { get; set; }
    }

    [DataContract]
    public class PublishTutorialItemRequest
    {
        [DataMember]
        public string _id { get; set; }

        [DataMember]
        public bool IsPublished { get; set; }
    }

    [DataContract]
    public class PublishTutorialItemResponse : ErrorInformation
    {

    }

    [DataContract]
    public class GetTutorialItemByIdRequest
    {
        [DataMember]
        public string _id { get; set; }
    }

    [DataContract]
    public class GetTutorialItemByIdResponse : ErrorInformation
    {
        [DataMember]
        public TutorialItem TutorialItem { get; set; }
    }

    [DataContract]
    public class DeleteTutorialItemRequest
    {
        [DataMember]
        public string _id { get; set; }
    }

    [DataContract]
    public class DeleteTutorialItemResponse : ErrorInformation
    {

    }

    [DataContract]
    public class UpdateTutorialItemRequest
    {
        [DataMember]
        public TutorialItem TutorialItem { get; set; }
    }

    [DataContract]
    public class UpdateTutorialItemResponse : ErrorInformation
    {

    }

    #endregion

    #region Comments

    [DataContract]
    public class InsertCommentRequest
    {
        [DataMember]
        public Comment Comment { get; set; }
    }

    [DataContract]
    public class InsertCommentResponse : ErrorInformation
    {

    }

    [DataContract]
    public class GetPublishedCommentsResponse : ErrorInformation
    {
        [DataMember]
        public List<Comment> Comments { get; set; }
    }

    [DataContract]
    public class GetUnpublishedCommentsResponse : ErrorInformation
    {
        [DataMember]
        public List<Comment> Comments { get; set; }
    }

    [DataContract]
    public class PublishCommentResponse : ErrorInformation
    {

    }

    [DataContract]
    public class PublishCommentRequest
    {
        [DataMember]
        public string _id { get; set; }

        [DataMember]
        public bool IsPublished { get; set; }
    }
    [DataContractAttribute]
    public class DeleteCommentResponse : ErrorInformation
    {

    }

    [DataContractAttribute]
    public class DeleteCommentRequest
    {
        [DataMemberAttribute]
        public string _id { get; set; }
    }


    #endregion

    #region Youtube
    [DataContractAttribute]
    public class InsertUrlYoutubeRequest
    {
        [DataMemberAttribute]
        public string urlyoutube { get; set; }
    }

    [DataContractAttribute]
    public class InsertUrlYoutubeResponse : ErrorInformation
    {
        [DataMemberAttribute]
        public string OldUrlYoutube { get; set; }
        [DataMemberAttribute]
        public bool DeleteOldUrl { get; set; }
    }

    [DataContract]
    public class GetUrlYoutubeResponse : ErrorInformation
    {
        [DataMember]
        public string urlyoutube { get; set; }
    }

    #endregion

    #region Contact

    [DataContract]
    public class InsertContactRequest
    {
        [DataMember]
        public Contact Contact { get; set; }
    }

    [DataContract]
    public class InsertContactResponse : ErrorInformation
    {
    }

    [DataContractAttribute]
    public class GetContactsResponse : ErrorInformation
    {
        [DataMember]
        public List<Contact> Contacts { get; set; }
    }
    [DataContractAttribute]
    public class DeleteContactResponse : ErrorInformation
    {

    }

    [DataContractAttribute]
    public class DeleteContactRequest
    {
        [DataMemberAttribute]
        public string _id { get; set; }
    }

    #endregion

    
}