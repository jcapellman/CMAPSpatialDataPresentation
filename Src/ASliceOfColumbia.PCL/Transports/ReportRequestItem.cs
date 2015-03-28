using System;
using System.Runtime.Serialization;

using ASliceOfColumbia.PCL.Common;

namespace ASliceOfColumbia.PCL.Transports {
    [DataContract]
    public class ReportRequestItem {
        [DataMember]
        public ReportsEnum ReportType { get; set; }

        [DataMember]
        public DateTime StartDate { get; set; }

        [DataMember]
        public DateTime EndDate { get; set; }
    }
}