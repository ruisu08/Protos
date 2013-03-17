using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;

namespace UniffutAdmin.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        private static uniffutData db = new uniffutData();

        public ActionResult Index()
        {
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.modulo);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.rol);
            return View();
        }
    }
}
