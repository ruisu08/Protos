using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
using System.Web.Routing;

namespace UniffutAdmin.Controllers.UniffutWebSite
{
    public class UniffutTipoNoticiaController : Controller
    {
        private uniffutData db = new uniffutData();
        // GET: /TipoNoticia/

        public ActionResult Index()
        {
            var tipos = db.tiponoticia.Where(d => d.estado == true);
            return View(tipos);
        }

    }
}
