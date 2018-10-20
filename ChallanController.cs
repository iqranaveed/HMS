using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HostelManagementSystem.Controllers
{
    public class ChallanController : Controller
    {
        // GET: Challan
        public ActionResult ChallanForm()
        {
            return View();
        }
    }
}