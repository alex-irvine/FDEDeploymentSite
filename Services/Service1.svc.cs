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
            Authenticated = true
            };
        }

    }
}
