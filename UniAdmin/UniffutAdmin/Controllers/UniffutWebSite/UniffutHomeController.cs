using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels.UniffutWebSite;

namespace UniffutAdmin.Controllers.UniffutWebSite
{
    public class UniffutHomeController : Controller
    {
        //
        // GET: /UniffutHome/
        private uniffutData db = new uniffutData();

        public ActionResult Index()
        {
            var viewModel = new HomeViewModel
            {
                Noticias = db.noticia.Where<noticia>(n => n.imagenPrincipal != null && n.estado == true).Take(5).ToList()
            };
            return View(viewModel);
        }

    }
}
