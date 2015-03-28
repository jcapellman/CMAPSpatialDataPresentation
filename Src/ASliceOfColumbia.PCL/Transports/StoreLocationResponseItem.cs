using System.Runtime.Serialization;

namespace ASliceOfColumbia.PCL.Transports {
    [DataContract]
    public class StoreLocationResponseItem {
        [DataMember]
        public string Description { get; set; }

        [DataMember]
        public GeoCodeItem GeoCode { get; set; }
    }
}