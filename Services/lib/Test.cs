using Dropbox.Api;
using Dropbox.Api.Files;
using Services.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Services.lib
{
    public class Test
    {
        public async void UploadFileToDropbox()
        {
            System.Diagnostics.Debug.Write("log start" + Environment.NewLine);
            string folder, fileName;
            folder = @"C:\UploadFiles";
            fileName = @"200MB.zip";
            using (var dbx = new DropboxClient(SysConfig.DBKey))
            {
                const int chunkSize = 128 * 1024;

                using (FileStream stream = new FileStream(folder + "/" + fileName, FileMode.Open, FileAccess.Read))
                {
                    int numChunks = (int)Math.Ceiling((double)stream.Length / chunkSize);

                    byte[] buffer = new byte[chunkSize];
                    string sessionId = null;

                    for (int i = 0; i < numChunks; i++)
                    {
                        var byteRead = stream.Read(buffer, 0, chunkSize);
                        UploadSessionAppendArg arg = new UploadSessionAppendArg();
                        using (MemoryStream memStream = new MemoryStream(buffer, 0, byteRead))
                        {
                            if (i == 0)
                            {
                                var result = await dbx.Files.UploadSessionStartAsync(false, memStream);
                                sessionId = result.SessionId;
                            }
                            else
                            {
                                var cursor = new UploadSessionCursor(sessionId, (ulong)(chunkSize * i));

                                if (i == numChunks - 1)
                                {
                                    await dbx.Files.UploadSessionFinishAsync(cursor, new CommitInfo("/" + fileName), memStream);
                                }

                                else
                                {
                                    await dbx.Files.UploadSessionAppendV2Async(cursor, false, memStream);
                                }
                            }
                        }
                        System.Diagnostics.Debug.Write("Chunk " + i.ToString() + " of " + numChunks.ToString() + " Written" + Environment.NewLine);
                    }
                }
            }
        }

        public async Task<Stream> DownloadFileFromDropbox()
        {
            string folder = "designAutomations";
            string file = "200MB.zip";
            using (var dbx = new DropboxClient(SysConfig.DBKey))
            {
                using (var response = await dbx.Files.DownloadAsync("/" + file))
                {
                    return await response.GetContentAsStreamAsync();
                }
            }
        }
    }
}