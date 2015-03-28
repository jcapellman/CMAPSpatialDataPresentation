using System.Collections.Generic;
using System.Web.Http;

using ASliceOfColumbia.PCL.Transports;
using ASliceOfColumbia.Web.DTS;

namespace ASliceOfColumbia.Web.Controllers {
    public class MobileRequestController : ApiController {
        public List<LocationResponseItem> POST(LocationRequestItem requestItem) { return new MobileRequests(requestItem).Get(); } 
    }
}