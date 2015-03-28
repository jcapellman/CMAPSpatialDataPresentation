using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;

using Windows.Devices.Geolocation;
using Windows.UI.Xaml;
using ASliceOfColumbia.PCL.Common;
using ASliceOfColumbia.PCL.Transports;
using ASliceOfColumbia.PCL.WebAPI;

namespace ASliceOfColumbia.WP.Viewmodels {
    public class MainModel : INotifyPropertyChanged {
        private List<LocationResponseItem> _locations;

        public List<LocationResponseItem> Locations {
            get { return _locations; }

            set {
                _locations = value;
                OnPropertyChanged();
            }
        }

        private Visibility visibilityProgressBar;

        public Visibility Visibility_ProgressBar {
            get { return visibilityProgressBar; }

            set { visibilityProgressBar = value; OnPropertyChanged(); }
        }

        private Visibility visibilityListBox;

        public Visibility Visibility_ListBox {
            get { return visibilityListBox; }

            set { visibilityListBox = value; OnPropertyChanged(); }
        }

        public MainModel() {
            Visibility_ProgressBar = Visibility.Collapsed;
            Visibility_ListBox = Visibility.Collapsed;
        }

        public async void SubmitRequest() {
            Visibility_ProgressBar = Visibility.Visible;

            var handler = new Handler();

            var geolocator = new Geolocator { DesiredAccuracyInMeters = PCL.Common.Constants.MOBILE_ACCURACY };

            var geoPosition = await geolocator.GetGeopositionAsync(maximumAge: TimeSpan.FromMinutes(5), timeout: TimeSpan.FromSeconds(30));

            Locations = await handler.SubmitRequest(new LocationRequestItem {
                GeoCode = new GeoCodeItem {
                    Latitude = geoPosition.Coordinate.Point.Position.Latitude,
                    Longitude = geoPosition.Coordinate.Point.Position.Longitude
                }, DeviceType = DeviceTypesEnum.WindowsPhone
            });

            Visibility_ProgressBar = Visibility.Collapsed;

            Visibility_ListBox = Visibility.Visible;
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