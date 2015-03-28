using System.Collections.Generic;
using System.Linq;

using ASliceOfColumbia.PCL.Transports;
using ASliceOfColumbia.Web.Entities;

namespace ASliceOfColumbia.Web.DTS {
    public class Stores {
        public List<StoreLocationResponseItem> GetStores() {
            using (var eFactory = new ASliceOfColumbiaEntities()) {
                var result = eFactory.Locations.ToList();

                return result.Select(a => new StoreLocationResponseItem {Description = a.Description, GeoCode = new Helpers.GeoCode().ConvertDbGeography(a.SpatialLocation)}).ToList();
            }
        } 
    }
}