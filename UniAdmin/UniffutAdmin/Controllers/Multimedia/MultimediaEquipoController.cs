using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
using System.Web.Routing;
namespace UniffutAdmin.Controllers
{
    public class MultimediaEquipoController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Multimedia/

        public ActionResult Index(int id)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("ErrorSesion", error);
            }
            else {
                bool autorizado = false;
                int idUser = (int)Session["userID"];
                var usuario = db.usuario.FirstOrDefault(u => u.idUsuario.Equals(idUser));
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(2)))
                {
                    if (m.idModulo == 2 && usuario.rol.estado == true)
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
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.multimedia);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.album_equipo);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.equipo);
            var multimedia = db.album_equipo.First(a => a.idAlbum_Equipo.Equals(id)).multimedia.Where<multimedia>(multi=>multi.estado == true);
            return View(multimedia.ToList());
        }
         //
        // GET: /Multimedia/Create

        public ActionResult Create(int id)
        {
            return RedirectToAction("agregarMultimedia", new RouteValueDictionary(new { controller = "AlbumEquipo", action = "agregarMultimedia", id = id }));
        } 

        //
        // POST: /Multimedia/Create

      /*  [HttpPost]
        public ActionResult Create(int id)
        {
            try
            {

                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = e.InnerException.ToString()
                };
                return View("Error", error);
            }
        }*/
        

        //
        // GET: /Multimedia/Delete/5
 
        /*public ActionResult Delete(int id)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("ErrorSesion", error);
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
            var mult = db.multimedia.First(mu => mu.idMultimedia.Equals(id));
            return View(mult);
        }*/

        //
        // POST: /Multimedia/Delete/5

        public ActionResult Delete(int id, int idAlbum)
        {
            try
            {
                var mult = db.multimedia.First(mu => mu.idMultimedia.Equals(id));
                mult.estado = false;
                db.SaveChanges();
                // TODO: Add delete logic here

                return RedirectToAction("Index", new RouteValueDictionary(new { controller = "MultimediaEquipo", action = "Index", id = idAlbum }));
            }
            catch
            {
                return View();
            }
        }
    }
}
