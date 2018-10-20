using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HostelManagementSystem.Controllers
{
    public class LeaveController : Controller
    {
        // GET: Leave
        public ActionResult LeaveForm()
        {
            return View();
        }
    }
}