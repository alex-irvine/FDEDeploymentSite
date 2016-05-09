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
    public interface ITutorialService
    {
        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);

        // TODO: Add your service operations here
        [OperationContract]
        List<Tutorial> GetTutorials();
        // One Tutorial , all pages
        [OperationContract]
        List<Tutorial> GetTutorialById(string id);
    }
}