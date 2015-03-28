using System;
using System.Web.Mvc;

using ASliceOfColumbia.PCL.Common;
using ASliceOfColumbia.PCL.Transports;
using ASliceOfColumbia.Web.Models;

namespace ASliceOfColumbia.Web.Controllers {
    public class HomeController : Controller {
        public ActionResult Index() {
            var model = new HomeModel();

            model.ReportItems =
                new DTS.Reports().GetReport(new ReportRequestItem {
                    EndDate = DateTime.Now.AddDays(1),
                    StartDate = DateTime.Now.AddDays(-30),
                    ReportType = ReportsEnum.LOCATION_REQUESTS_CLOSEST
                });

            model.StoreItems = new DTS.Stores().GetStores();

            return View(model);
        }
    }
}