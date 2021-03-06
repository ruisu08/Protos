﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
using System.Web.Routing;

namespace UniffutAdmin.Controllers.UniffutWebSite
{
    public class UniffutNoticiaController : Controller
    {
        private uniffutData db = new uniffutData();
        // GET: /UniffutNoticia/

        public ActionResult Index()
        {
            var Noticias = db.noticia.Where<noticia>(n => n.imagenPrincipal != null && n.estado == true).Take(10).ToList();
            return View(Noticias);
        }

    }
}
