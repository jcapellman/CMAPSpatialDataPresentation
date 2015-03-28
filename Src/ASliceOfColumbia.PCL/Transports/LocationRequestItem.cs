using System.Runtime.Serialization;
using ASliceOfColumbia.PCL.Common;

namespace ASliceOfColumbia.PCL.Transports {
    public class LocationRequestItem {
        [DataMember]
        public GeoCodeItem GeoCode { get; set; }

        [DataMember]
        public DeviceTypesEnum DeviceType { get; set; }
    }
}