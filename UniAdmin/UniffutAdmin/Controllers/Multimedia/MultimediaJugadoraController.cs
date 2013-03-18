using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
using System.Web.Routing;

namespace UniffutAdmin.Controllers.Multimedia
{
    public class MultimediaJugadoraController : Controller
    {
        //
        // GET: /MultimediaJugadora/
        private static uniffutData db = new uniffutData();

        public ActionResult Index(int id)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
            }
            else
            {
                bool autorizado = false;
                int idUser = (int)Session["userID"];
                var usuario = db.usuario.FirstOrDefault(u => u.idUsuario.Equals(idUser));
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(3)))
                {
                    if (m.idModulo == 3)
                    {
                        autorizado = true;
                    }
                }
                if (!autorizado)
                {
                    ErrorModel error = new ErrorModel
                    {
                        mensaje = "No tienes permisos para acceder a esta página"
                    };
                    return View("Error", error);
                }
            }
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.multimedia);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.album_jugadora);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.jugadora);
            var multimedia = db.album_jugadora.First(a => a.idAlbum_Jugadora.Equals(id)).multimedia.Where<multimedia>(multi => multi.estado == true);
            return View(multimedia.ToList());
        }

        //
        // GET: /MultimediaJugadora/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /MultimediaJugadora/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /MultimediaJugadora/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /MultimediaJugadora/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /MultimediaJugadora/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /MultimediaJugadora/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /MultimediaJugadora/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
