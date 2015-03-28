using System;
using System.Runtime.Serialization;

namespace ASliceOfColumbia.PCL.Transports {
    [DataContract]
    public class ReportResponseItem {
        [DataMember]
        public DateTime TimeOfRequest { get; set; }

        [DataMember]
        public double ClosestLocation { get; set; }

        [DataMember]
        public GeoCodeItem GeoCode { get; set; }
    }
}