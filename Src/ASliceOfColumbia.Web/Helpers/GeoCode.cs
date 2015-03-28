using System.Data.Entity.Spatial;
using System.IO;
using ASliceOfColumbia.PCL.Transports;
using Microsoft.SqlServer.Types;

namespace ASliceOfColumbia.Web.Helpers {
    public class GeoCode {
        public GeoCodeItem ConvertBinary(byte[] data, int srid = PCL.Common.Constants.SRID) {
            var binaryReader = new BinaryReader(new MemoryStream(data));
            var location = new SqlGeography();
            location.Read(binaryReader);

            return new GeoCodeItem {Latitude = location.Lat.Value, Longitude = location.Long.Value};
        }

        public GeoCodeItem ConvertDbGeography(DbGeography geography) {
            return new GeoCodeItem {Latitude = geography.Latitude.Value, Longitude = geography.Longitude.Value};
        }
        
        public DbGeography ConvertGeoCode(GeoCodeItem geoCode, int srid = PCL.Common.Constants.SRID) {
            var text = string.Format("POINT({0} {1})", geoCode.Longitude, geoCode.Latitude);

            return DbGeography.PointFromText(text, srid);
        }
    }
}