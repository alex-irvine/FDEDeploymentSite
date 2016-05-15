using MongoDB.Bson;
using MongoDB.Driver;
using Services.lib;
using Services.Model;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }

        /// <summary>
        /// Test service
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public GetPersonResponse GetPerson(GetPersonRequest request)
        {
            try
            {
                // open DB client and get DB reference
                MongoClient client = new MongoClient(SysConfig.DBconn);
                var database = client.GetDatabase("da_pp_db");
                // get the collection
                var collection = database.GetCollection<Person>("Users");

                // get person
                Person user = collection.Find(new BsonDocument("Username", request.Username)).First();

                if(user != null)
                {
                    // cleanse password data
                    user.Password = null;
                    user.Salt = null;
                    // return the user
                    return new GetPersonResponse()
                    {
                        User = user,
                        Errored = false,
                        Message = "Person found"
                    };
                }
                else
                {
                    return new GetPersonResponse()
                    {
                        Errored = true,
                        Message = "Person not found"
                    };
                }
            }
            // db errors    
            catch (Exception ex)
            {
                return new GetPersonResponse()
                {
                    Errored = true,
                    Message = ex.Message
                };
            }
        }

        /// <summary>
        /// Test authenticator
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public AuthenticateUserResponse AuthenticateUser(AuthenticateUserRequest request)
        {
            try
            {
                // open DB client and get DB reference
                MongoClient client = new MongoClient(SysConfig.DBconn);
                var database = client.GetDatabase("da_pp_db");
                // get the collection
                var collection = database.GetCollection<Person>("Users");

                // get person
                Person user = collection.Find(new BsonDocument("Username", request.Username)).First();

                if (user == null)
                {
                    return new AuthenticateUserResponse()
                    {
                        Authenticated = false,
                        Errored = true,
                        Message = "Username not found"
                    };
                }

                // get hash
                byte[] hash = AuthLib.CreateHash(request.Password, Convert.FromBase64String(user.Salt));

                // check hash
                bool authenticated = AuthLib.SlowEquals(hash, Convert.FromBase64String(user.Password));
                if(authenticated)
                {
                    //cleanse passwords
                    user.Password = null;
                    user.Salt = null;
                    // respond
                    return new AuthenticateUserResponse()
                    {
                        Person = user,
                        Authenticated = true,
                        Errored = false,
                        Message = "User authenticated"
                    };
                }
                else
                {
                    return new AuthenticateUserResponse()
                    {
                        Authenticated = false,
                        Errored = true,
                        Message = "Password incorrect"
                    };
                }
            }
            // db errors    
            catch (Exception ex)
            {
                return new AuthenticateUserResponse()
                {
                    Authenticated = false,
                    Errored = true,
                    Message = ex.Message
                };
            }
        }

        /// <summary>
        /// Get all news items as a list
        /// </summary>
        /// <returns></returns>
        public GetNewsItemsResponse GetNewsItems()
        {
            // init response
            GetNewsItemsResponse response = new GetNewsItemsResponse() 
                {NewsItems = new List<NewsItem>()};
            try
            {
                // open DB client and get DB reference
                MongoClient client = new MongoClient(SysConfig.DBconn);
                var database = client.GetDatabase("da_pp_db");
                // get the collection
                var collection = database.GetCollection<NewsItem>("NewsItems");

                // query collection for all results
                response.NewsItems = collection.Find(new BsonDocument()).ToList();

                // generate error data
                if(response.NewsItems.Count > 0)
                {
                    response.Errored = false;
                    response.Message = "News items found";
                }
                else
                {
                    response.Errored = true;
                    response.Message = "No news items found";
                }
            }
            // db errors    
            catch(Exception ex)
            {
                response.Errored = true;
                response.Message = ex.Message;
            }

            // respond
            return response;
            
        }

        /// <summary>
        /// Inserts a single news story
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public InsertNewsItemResponse InsertNewsItem(InsertNewsItemRequest request)
        {
            try
            {
                // open DB client and get DB reference
                MongoClient client = new MongoClient(SysConfig.DBconn);
                var database = client.GetDatabase("da_pp_db");
                // get the collection
                var collection = database.GetCollection<NewsItem>("NewsItems");

                // insert the passed news story
                collection.InsertOne(request.NewsItem);

                if(request.NewsItem._id != null)
                {
                    return new InsertNewsItemResponse()
                    {
                        InsertedId = request.NewsItem._id,
                        Errored = false,
                        Message = "Successfully inserted"
                    };
                }
                else
                {
                    return new InsertNewsItemResponse()
                    {
                        Errored = true,
                        Message = "Item not inserted"
                    };
                }
            }
            // db errors
            catch(Exception ex)
            {
                return new InsertNewsItemResponse()
                {
                    Errored = true,
                    Message = ex.Message
                };
            }
        }

        /// <summary>
        /// Creates a user on the database with hashed password
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public RegisterUserResponse RegisterUser(RegisterUserRequest request)
        {
            // create and store salt
            byte[] salt = AuthLib.CreateSalt();
            request.User.Salt = Convert.ToBase64String(salt);

            // create hash and replace password
            byte[] pass = AuthLib.CreateHash(request.User.Password, salt);
            request.User.Password = Convert.ToBase64String(pass);

            // add user to DB
            try
            {
                // open DB client and get DB reference
                MongoClient client = new MongoClient(SysConfig.DBconn);
                var database = client.GetDatabase("da_pp_db");
                // get the collection
                var collection = database.GetCollection<Person>("Users");

                // insert the user 
                collection.InsertOne(request.User);

                // check the insert was successful
                if(request.User._id != null)
                {
                    return new RegisterUserResponse()
                    {
                        InsertedId = request.User._id,
                        Errored = false,
                        Message = "User registered"
                    };
                }
                else
                {
                    return new RegisterUserResponse()
                    {
                        Errored = true,
                        Message = "User not registered"
                    };
                }
                
            }
            // db errors
            catch (Exception ex)
            {
                return new RegisterUserResponse()
                {
                    Errored = true,
                    Message = ex.Message
                };
            }

        }

        /// <summary>
        /// Insert or update the current file record
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public InsertFileRecordResponse InsertFileRecord(InsertFileRecordRequest request)
        {
            // init response
            InsertFileRecordResponse response = new InsertFileRecordResponse();

            // open DB and insert/update the record
            try
            {
                // open DB client and get DB reference
                MongoClient client = new MongoClient(SysConfig.DBconn);
                var database = client.GetDatabase("da_pp_db");
                // get the collection
                var collection = database.GetCollection<FileRecord>("FileRecord");

                // get old file name
                List<FileRecord> fr = collection.Find(new BsonDocument()).ToList();
                if(fr.Count > 0)
                {
                    response.OldFileName = fr[0].FileName;
                    // if there is an old file and it has a different name flag the
                    // old file should be deleted
                    response.DeleteOldFile = request.FileName != response.OldFileName;
                    // if old file name same as new file name return out here
                    if (request.FileName == response.OldFileName)
                    {
                        response.Errored = false;
                        response.Message = "Same file name no record created";
                        return response;
                    }
                }
                
                // if first insert create the record else update the record (should only be one)
                if(collection.Find(new BsonDocument()).Count()>0)
                {
                    collection.UpdateOne(new BsonDocument(), new BsonDocument("$set", new BsonDocument( "FileName", request.FileName)));
                }
                else
                {
                    collection.InsertOne(new FileRecord() { FileName = request.FileName });
                }

                response.Errored = false;
                response.Message = "Record successfully updated";
            }
            // db errors    
            catch (Exception ex)
            {
                response.Errored = true;
                response.Message = ex.Message;
            }

            return response;
        }

        /// <summary>
        /// Get the dropbox key and name of current file from record
        /// </summary>
        /// <returns></returns>
        public GetFileRecordResponse GetFileRecord()
        {
            GetFileRecordResponse response = new GetFileRecordResponse() 
            {
                DropboxKey = SysConfig.DBKey
            };

            try
            {
                // open DB client and get DB reference
                MongoClient client = new MongoClient(SysConfig.DBconn);
                var database = client.GetDatabase("da_pp_db");
                // get the collection
                var collection = database.GetCollection<FileRecord>("FileRecord");

                // grab current file name
                List<FileRecord> fr = new List<FileRecord>();
                fr = collection.Find(new BsonDocument()).ToList();
                response.FileName = fr[0].FileName;
            }
            // db errors    
            catch (Exception ex)
            {
                response.Errored = true;
                response.Message = ex.Message;
            }

            return response;
        }

    }
}
