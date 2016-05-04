using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Consumer
{
    /// <summary>
    /// Summary description for fileDl
    /// </summary>
    public class fileDl : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            byte[] bytes = GetProgram();
            context.Response.Clear();
            context.Response.ContentType = "application/force-download";
            context.Response.AddHeader("content-disposition", "attachment;    filename=FILENAME.txt");
            context.Response.BinaryWrite(bytes);
            context.Response.End();
        }

        private byte[] GetProgram () {
            string absolutePath = "Z:/DesignGUI_PublishingPlatform/Consumer/files/test.txt";
            byte[] bytes = System.IO.File.ReadAllBytes(absolutePath);
            return bytes;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}