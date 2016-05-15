using Consumer.Models;
using Consumer.ServiceReference1;
using Dropbox.Api;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;

namespace Consumer.lib
{
    /// <summary>
    /// Operation handler class
    /// </summary>
    class AsynchOperation : IAsyncResult
    {
        // iprops backers
        private bool _completed;
        private Object _state;
        private AsyncCallback _callback;
        private HttpContext _context;

        // expected interface properties
        bool IAsyncResult.IsCompleted { get { return _completed; } }
        WaitHandle IAsyncResult.AsyncWaitHandle { get { return null; } }
        Object IAsyncResult.AsyncState { get { return _state; } }
        bool IAsyncResult.CompletedSynchronously { get { return false; } }

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="callback"></param>
        /// <param name="context"></param>
        /// <param name="state"></param>
        public AsynchOperation(AsyncCallback callback, HttpContext context, Object state)
        {
            _callback = callback;
            _context = context;
            _state = state;
            _completed = false;
        }

        /// <summary>
        /// Setup job pool
        /// </summary>
        public void StartAsyncWork()
        {
            ThreadPool.QueueUserWorkItem(new WaitCallback(StartAsyncTask), null);
        }

        /// <summary>
        /// Task handler
        /// </summary>
        /// <param name="workItemState"></param>
        private async void StartAsyncTask(Object workItemState)
        {
            // get file name and dbx key
            GetFileRecordResponse resp;
            using(ServiceReference1.Service1Client client = new Service1Client())
            {
                resp = client.GetFileRecord();
            }

            // Response props
            _context.Response.ContentType = "text/plain";
            _context.Response.Clear();
            _context.Response.ContentType = "application/force-download";
            _context.Response.AddHeader("content-disposition", "attachment;    filename=" + resp.FileName);
            _context.Response.Buffer = false; // stream file

            // download file from dropbox as stream
            using (var dbx = new DropboxClient(resp.DropboxKey))
            {
                using (var response = await dbx.Files.DownloadAsync("/" + resp.FileName))
                {
                    using (Stream stream = await response.GetContentAsStreamAsync())
                    {
                        // send stream to response output stream
                        stream.CopyTo(_context.Response.OutputStream);

                        // done
                        _context.Response.End();
                        _context.Response.Close();
                    }

                }
            }

            // log download
            using(ServiceReference1.Service1Client client = new Service1Client())
            {
                // build request
                LogFileDownloadRequest request = new LogFileDownloadRequest()
                {
                    DownloadLog = new DownloadLog()
                    {
                        Username = _context.User.Identity.Name,
                        DateDownloaded = DateTime.Now,
                        FileDownloaded = resp.FileName
                    }
                };
                // log download
                LogFileDownloadResponse logResp = client.LogFileDownload(request);
                if (logResp.Errored)
                {
                    // dropped a log
                }
            }

            // Task complete
            _completed = true;
            _callback(this);
        }
    }
}