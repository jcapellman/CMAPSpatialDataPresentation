using System.Runtime.Serialization;

namespace ASliceOfColumbia.PCL.Transports {
    [DataContract]
    public class GeoCodeItem {
        [DataMember]
        public double Latitude { get; set; }

        [DataMember]
        public double Longitude { get; set; }
    }
}