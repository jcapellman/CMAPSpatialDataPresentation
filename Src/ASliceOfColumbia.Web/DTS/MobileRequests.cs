using System.Collections.Generic;
using System.Linq;

using ASliceOfColumbia.PCL.Transports;
using ASliceOfColumbia.Web.Entities;

namespace ASliceOfColumbia.Web.DTS {
    public class MobileRequests {
        private readonly LocationRequestItem _requestItem;

        public MobileRequests(LocationRequestItem requestItem) { _requestItem = requestItem; }

        public List<LocationResponseItem> Get() {
            using (var eFactory = new ASliceOfColumbiaEntities()) {
                return
                    eFactory.WEBAPI_getNearByLocationsSP(new Helpers.GeoCode().ConvertGeoCode(_requestItem.GeoCode), 
                    (int)_requestItem.DeviceType, 
                    PCL.Common.Constants.SRID).Select(
                        a =>
                            new LocationResponseItem {
                                Distance = new Helpers.UnitConverter().Convert(a.Distance.Value),
                                Is24Hour = a.IsOpen24Hours,
                                LocationName = a.Description,
                                PhoneNumber = a.PhoneNumber
                                    
                    }).ToList();
            }
        }
    }
}