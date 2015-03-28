using System;
using ASliceOfColumbia.PCL.Common;

namespace ASliceOfColumbia.Web.Helpers {
    public class UnitConverter {
        private const double CONVERSION_MILES = 1609.344;
        private const double CONVERSION_KILOMETERS = 1000;

        public double Convert(double distance, UnitsEnum unit = UnitsEnum.Miles, int roundingPlaces = 2) {
            switch (unit) {
                case UnitsEnum.Miles:
                    distance /= CONVERSION_MILES;
                    break;
                case UnitsEnum.Kilometers:
                    distance /= CONVERSION_KILOMETERS;
                    break;
            }

            return Math.Round(distance, roundingPlaces);
        }
    }
}