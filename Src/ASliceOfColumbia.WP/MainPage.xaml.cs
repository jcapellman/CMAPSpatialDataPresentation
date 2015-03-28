using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=391641

namespace ASliceOfColumbia.WP
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class MainPage : Page {
        private Viewmodels.MainModel viewModel {
            get { return (Viewmodels.MainModel) DataContext; }
        }

        public MainPage() {
            this.InitializeComponent();

            DataContext = new Viewmodels.MainModel();
        }

        protected override void OnNavigatedTo(NavigationEventArgs e) {
            
        }

        private void BtnGetNearbyLocations_OnClick(object sender, RoutedEventArgs e) {
            viewModel.SubmitRequest();
        }
    }
}