using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
namespace UniffutAdmin.Controllers.EstructuraDePagina
{
    public class CampeonatoSubMenuController : Controller
    {
        //
        // GET: /CampeonatoSubMenu/

        public ActionResult Index()
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
            }
            return View();
        }

    }
}
