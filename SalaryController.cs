using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HostelManagementSystem.Controllers
{
    public class SalaryController : Controller
    {
        // GET: Salary
        public ActionResult SalaryForm()
        {
            return View();
        }
    }
}