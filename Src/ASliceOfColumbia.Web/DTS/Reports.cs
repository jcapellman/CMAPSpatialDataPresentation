using System.Collections.Generic;
using System.Linq;

using ASliceOfColumbia.PCL.Common;
using ASliceOfColumbia.PCL.Transports;
using ASliceOfColumbia.Web.Entities;

namespace ASliceOfColumbia.Web.DTS {
    public class Reports {
        public List<ReportResponseItem> GetReport(ReportRequestItem requestItem) {
            using (var eFactory = new ASliceOfColumbiaEntities()) {
                var list = new List<ReportResponseItem>();

                switch (requestItem.ReportType) {
                    case ReportsEnum.LOCATION_REQUESTS:
                        list =
                            eFactory.REPORT_getRequestLocationsSP(requestItem.StartDate, requestItem.EndDate)
                                .Select(a => new ReportResponseItem {
                                    TimeOfRequest = a.TimeOfRequest,
                                    ClosestLocation = 0,
                                    GeoCode = new Helpers.GeoCode().ConvertBinary(a.SpatialData)
                                })
                                .ToList();
                        break;
                    case ReportsEnum.LOCATION_REQUESTS_CLOSEST:
                        list =
                            eFactory.REPORT_getRequestLocationsToClosestLocationSP(requestItem.StartDate,
                                requestItem.EndDate)
                                .Select(
                                    a =>
                                        new ReportResponseItem {
                                            ClosestLocation = new Helpers.UnitConverter().Convert(a.ClosestLocation ?? 0),
                                            TimeOfRequest = a.TimeOfRequest,
                                            GeoCode = new Helpers.GeoCode().ConvertBinary(a.SpatialData)
                                        })
                                .ToList();
                        break;
                }

                return list;
            }
        }
    }
}