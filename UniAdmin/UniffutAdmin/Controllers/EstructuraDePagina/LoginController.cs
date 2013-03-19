using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;

namespace UniffutAdmin.Controllers.EstructuraDePagina
{
    public class LoginController : Controller
    {
        private static uniffutData db = new uniffutData();

        public ActionResult Index()
        {
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.modulo);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.rol);
            return View();
        }

        public ActionResult Login(Login login)
        {
            var user = db.usuario.FirstOrDefault(u => (u.correo == login.Usuario.correo && u.password == login.Usuario.password) && u.estado == true);
            if (user != null)
            {
                Session["userID"] = user.idUsuario;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                login.mensaje = "El correo o contraseña son incorrectos";
                return View("Index");
            }
        }

        public ActionResult LogOut()
        {

            Session["userID"] = null;
            return View("Index");
        }

    }
}
