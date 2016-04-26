using Services.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Services
{
    
    public class NewsService : INewsService
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
        /// <param></param>
        /// <returns></returns>
        public List<News> GetNews()
        {
            return new List<News>()
            {
                new News(){
                    Id = 1,
                    title = "I am the first news",
                    description = "all the news will be ...",
                    text = "<h1>The news</h1><p>test</p>",
                    published = true
                },
                new News(){
                    Id = 2,
                    title = "I am the second news",
                    description = "all the news will be ...",
                    text = "<h1>The news</h1><p>test</p>",
                    published = true
                },
                new News(){
                    Id = 3,
                    title = "I am the third news",
                    description = "all the news will be ...",
                    text = "<h1>The news</h1><p>test</p>",
                    published = true
                },
                new News(){
                    Id = 4,
                    title = "I am the fourth news",
                    description = "all the news will be ...",
                    text = "<h1>The news</h1><p>test</p>",
                    published = true
                },
            };
        }
    }
}
