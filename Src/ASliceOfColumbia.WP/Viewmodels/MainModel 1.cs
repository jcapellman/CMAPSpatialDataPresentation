using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;

using Windows.Devices.Geolocation;

using ASliceOfColumbia.PCL.Transports;
using ASliceOfColumbia.PCL.WebAPI;

namespace ASliceOfColumbia.WP.Viewmodels {
    public class MainModel : INotifyPropertyChanged {
        public async Task<List<bool>> SubmitRequest() {
            var handler = new Handler();

            var geolocator = new Geolocator { DesiredAccuracyInMeters = PCL.Common.Constants.MOBILE_ACCURACY };

            var geoPosition = await geolocator.GetGeopositionAsync(maximumAge: TimeSpan.FromMinutes(5), timeout: TimeSpan.FromSeconds(30));

            return await handler.SubmitRequest(new LocationRequestItem {GeoCode = new GeoCodeItem {
                Latitude = geoPosition.Coordinate.Point.Position.Latitude,
                Longitude = geoPosition.Coordinate.Point.Position.Longitude
            }});
        }

        #region Property Changed
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null) {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }
        #endregion
    }
}
