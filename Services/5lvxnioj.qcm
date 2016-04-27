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
        public Person GetPerson(string username)
        {
            Person pson = new Person();
            pson.UserName = "Test";
            pson.Id = 1;
            pson.IsAdmin = true;
            pson.Company = "testCompany";
            return pson;
        }

        /// <summary>
        /// Test authenticator
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public AuthenticateUserResponse AuthenticateUser(AuthenticateUserRequest request)
        {
            return new AuthenticateUserResponse() { 
            Errored = false,
            Message = "Successfully authenticated",
            Authenticated = true,
            Person = GetPerson(request.Username)
            };
        }

        public GetNewsItemsResponse GetNewsItems()
        {

            Image pic = Image.FromFile("Z:\\DesignGUI_PublishingPlatform\\cat.jpg");
            MemoryStream ms = new MemoryStream();
            pic.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);

            NewsItem newsItem = new NewsItem()
            {
                Picture = ms.ToArray(),
                Text = "<h2>What is Lorem Ipsum?</h2>" +
                    "<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing" +
                    "and typesetting industry. Lorem Ipsum has been the industry's standard" +
                    "dummy text ever since the 1500s, when an unknown printer took a galley" +
                    "of type and scrambled it to make a type specimen book. It has survived" +
                    "not only five centuries, but also the leap into electronic typesetting," +
                    "remaining essentially unchanged. It was popularised in the 1960s with" +
                    "the release of Letraset sheets containing Lorem Ipsum passages, and more" +
                    "recently with desktop publishing software like Aldus PageMaker" +
                    "including versions of Lorem Ipsum.</p>"
            };
            List<NewsItem> newsItems = new List<NewsItem>();

            newsItems.Add(newsItem);
            return new GetNewsItemsResponse()
            {
                NewstItems = newsItems
            };
        }

    }
}
