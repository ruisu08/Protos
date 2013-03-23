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
        private uniffutData db = new uniffutData();

        public ActionResult Index()
        {
            if (Session["userID"] == null)
            {

                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("ErrorSesion", error);
            }
            return View();
        }
    }
}
