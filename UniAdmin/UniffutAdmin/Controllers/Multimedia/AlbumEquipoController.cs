using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;

namespace UniffutAdmin.Controllers.Multimedia
{
    public class AlbumEquipoController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /AlbumEquipo/

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

            var album = db.album_equipo.Where<album_equipo>(r => r.idEquipo == id);
            return View(album.ToList());
        }

        public ActionResult Create(equipo equipo)
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

            var viewModel = new EquipoAlbumMultimedia
            {
                Equipo = equipo,
                Albumes = db.album_equipo.Where<album_equipo>(d=>d.estado == true).ToList(),

            };
            return View(viewModel);
        } 

        //
        // POST: /AlbumEquipo/Create

        [HttpPost]
        public ActionResult Create(equipo equipo ,album_equipo album, EquipoAlbumMultimedia viewModel)
        {
            try
            {
                if (db.equipo.First(d => d.idEquipo == equipo.idEquipo).estado != false)
                {
                    var oldAlbum = db.album_equipo.FirstOrDefault(r => r.nombre == album.nombre);
                    if (oldAlbum != null) {

                        oldAlbum.nombre = album.nombre;
                        oldAlbum.idEquipo = album.idEquipo;
                    }
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
            

        //
        // GET: /AlbumEquipo/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /AlbumEquipo/Delete/5

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
