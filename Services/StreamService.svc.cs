using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Builders;
using MongoDB.Driver.GridFS;
using Services.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Dropbox.Api;
using Dropbox.Api.Files;
using System.Threading.Tasks;

namespace Services
{
    /// <summary>
    /// Test services for file handling using streams
    /// </summary>
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall,
        ConcurrencyMode = ConcurrencyMode.Single)]
    public class StreamService : IStreamService
    {
        public UploadResponse Upload(UploadRequest request)
        {
            try
            {
                // open DB client and get DB reference
                var client = new MongoClient(SysConfig.DBconn);
                var database = client.GetDatabase("da_pp_db");

                // stream the file to GridFS
                var us = new GridFSBucket(database);
                var id = us.UploadFromStream(request.FileName,request.Stream);

                return new UploadResponse
                           {
                               UploadSucceeded = true,
                               Errored = false,
                               Message = "File uploaded"
                           };
            }
            catch (Exception ex)
            {
                return new UploadResponse
                           {
                               UploadSucceeded = false,
                               Errored = true,
                               Message = ex.Message
                           };
            }
        }

        public Stream Download()
        {
            DownloadResponse response = new DownloadResponse() 
            { 
                FileName = SysConfig.FileName,
                Stream = new MemoryStream()
            };
            try
            {
                // open DB client and get DB reference
                var client = new MongoClient(SysConfig.DBconn);
                var database = client.GetDatabase("da_pp_db");

                // download file as stream
                var bucket = new GridFSBucket(database);
                bucket.DownloadToStreamByName(response.FileName, response.Stream);
                
                // return the stream
                //response.Errored = false;
                //response.Message = "Stream initiated";
                return response.Stream;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public RemoteFileInfo DownloadFile(DownloadRequest request)
        {
            RemoteFileInfo result = new RemoteFileInfo();
            string filePath = System.IO.Path.Combine(@"c:\Uploadfiles", request.FileName);
            System.IO.FileInfo fileInfo = new System.IO.FileInfo(filePath);

            // check if exists
            if (!fileInfo.Exists)
                throw new System.IO.FileNotFoundException("File not found",
                                                          request.FileName);

            // open stream
            System.IO.FileStream stream = new System.IO.FileStream(filePath,
                      System.IO.FileMode.Open, System.IO.FileAccess.Read);

            // return result 
            result.FileName = request.FileName;
            result.Length = fileInfo.Length;
            result.FileByteStream = stream;
            return result;
        }

        public void UploadFile(RemoteFileInfo request)
        {
            FileStream targetStream = null;
            Stream sourceStream = request.FileByteStream;

            string uploadFolder = @"C:\upload\";

            string filePath = Path.Combine(uploadFolder, request.FileName);

            using (targetStream = new FileStream(filePath, FileMode.Create,
                                  FileAccess.Write, FileShare.None))
            {
                //read from the input stream in 65000 byte chunks

                const int bufferLen = 65000;
                byte[] buffer = new byte[bufferLen];
                int count = 0;
                while ((count = sourceStream.Read(buffer, 0, bufferLen)) > 0)
                {
                    // save to output stream
                    targetStream.Write(buffer, 0, count);
                }
                targetStream.Close();
                sourceStream.Close();
            }

        }

        public async void UploadFileToDropbox()
        {
            System.Diagnostics.Debug.Write("log start"+Environment.NewLine);
            string folder, fileName;
            folder = @"C:\UploadFiles";
            fileName = @"200MB.zip";
            using(var dbx = new DropboxClient(SysConfig.DBKey))
            {
                const int chunkSize = 128 * 1024;

                using (FileStream stream = new FileStream(folder + "/" + fileName, FileMode.Open, FileAccess.Read))
                {
                    int numChunks = (int)Math.Ceiling((double)stream.Length / chunkSize);

                    byte[] buffer = new byte[chunkSize];
                    string sessionId = null;

                    for(int i=0;i<numChunks;i++)
                    {
                        var byteRead = stream.Read(buffer, 0, chunkSize);
                        UploadSessionAppendArg arg = new UploadSessionAppendArg();
                        using(MemoryStream memStream = new MemoryStream(buffer,0,byteRead))
                        {
                            if(i==0)
                            {
                                var result = await dbx.Files.UploadSessionStartAsync(false,memStream);
                                sessionId = result.SessionId;
                            }
                            else
                            {
                                var cursor =  new UploadSessionCursor(sessionId, (ulong)(chunkSize * i));

                                if (i == numChunks - 1)
                                {
                                    await dbx.Files.UploadSessionFinishAsync(cursor, new CommitInfo("/" + fileName), memStream);
                                }

                                else
                                {
                                    await dbx.Files.UploadSessionAppendV2Async(cursor,false,memStream);
                                }
                            }
                        }
                        System.Diagnostics.Debug.Write("Chunk "+i.ToString()+" of " +numChunks.ToString()+" Written"+Environment.NewLine);
                    }
                }
            }
        }

        public async Task<Stream> DownloadFileFromDropbox()
        {
            string folder = "designAutomations";
            string file = "200MB.zip";
            using(var dbx = new DropboxClient(SysConfig.DBKey))
            {
                using (var response = await dbx.Files.DownloadAsync("/" + file))
                {
                    return await response.GetContentAsStreamAsync();
                }
            }
        }

    }
}
