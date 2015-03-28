using System.Collections.Generic;
using System.Web.Http;

using ASliceOfColumbia.PCL.Transports;

namespace ASliceOfColumbia.Web.Controllers {
    public class ReportsController : ApiController {
        public List<ReportResponseItem> POST(ReportRequestItem requestItem) {
            return new DTS.Reports().GetReport(requestItem);
        } 
    }
}