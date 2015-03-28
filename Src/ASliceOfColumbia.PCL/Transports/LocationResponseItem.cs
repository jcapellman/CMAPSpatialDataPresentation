using System.Runtime.Serialization;

namespace ASliceOfColumbia.PCL.Transports {
    public class LocationResponseItem {
        [DataMember]
        public string LocationName { get; set; }

        [DataMember]
        public bool Is24Hour { get; set; }

        [DataMember]
        public double Distance { get; set; }

        [DataMember]
        public string PhoneNumber { get; set; }
    }
}