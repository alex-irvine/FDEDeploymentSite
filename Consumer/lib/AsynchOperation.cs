using Consumer.Models;
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
            // placeholder (file info will come from service)
            string file = "200MB.zip";

            // Response props
            _context.Response.ContentType = "text/plain";
            _context.Response.Clear();
            _context.Response.ContentType = "application/force-download";
            _context.Response.AddHeader("content-disposition", "attachment;    filename=" + file);
            _context.Response.Buffer = false; // stream file

            // download file from dropbox as stream
            using (var dbx = new DropboxClient(SysConfig.DBKey))
            {
                using (var response = await dbx.Files.DownloadAsync("/" + file))
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
            // Task complete
            _completed = true;
            _callback(this);
        }
    }
}