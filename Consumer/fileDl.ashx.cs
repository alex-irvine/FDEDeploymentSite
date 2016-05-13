using Consumer.lib;
using Consumer.Models;
using Dropbox.Api;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace Consumer
{
    /// <summary>
    /// Summary description for fileDl
    /// </summary>
    public class fileDl : IHttpAsyncHandler
    {
        /// <summary>
        /// In point for handler
        /// </summary>
        /// <param name="context"></param>
        /// <param name="cb"></param>
        /// <param name="extraData"></param>
        /// <returns></returns>
        public IAsyncResult BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
        {
            // hand off to asynch object
            AsynchOperation asynch = new AsynchOperation(cb, context, extraData);
            asynch.StartAsyncWork();
            return asynch;
        }

        /// <summary>
        /// Expected from interface
        /// </summary>
        /// <param name="result"></param>
        public void EndProcessRequest(IAsyncResult result)
        {
        }

        /// <summary>
        /// Expected from interface
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
        }

        /// <summary>
        /// Obsolete
        /// </summary>
        /// <returns></returns>
        private byte[] GetProgram () {
            string absolutePath = @"C:\Users\Public\Videos\Sample Videos\Wildlife.wmv";
            byte[] bytes = System.IO.File.ReadAllBytes(absolutePath);
            return bytes;
        }

        /// <summary>
        /// Expected from interface
        /// </summary>
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}