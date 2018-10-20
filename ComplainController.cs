using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HostelManagementSystem.Controllers
{
    public class ComplainController : Controller
    {
        // GET: Complain
        public ActionResult ComplainForm()
        {
            return View();
        }
    }
}