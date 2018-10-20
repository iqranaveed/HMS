using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HostelManagementSystem.Controllers
{
    public class StudentActivityController : Controller
    {
        // GET: StudentActivity
        public ActionResult StudentActivityForm()
        {
            return View();
        }
    }
}