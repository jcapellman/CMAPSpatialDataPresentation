using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ASliceOfColumbia.PCL.Transports;

namespace ASliceOfColumbia.Web.Models {
    public class HomeModel {
        public List<ReportResponseItem> ReportItems { get; set; } 

        public List<StoreLocationResponseItem> StoreItems { get; set; } 
    }
}