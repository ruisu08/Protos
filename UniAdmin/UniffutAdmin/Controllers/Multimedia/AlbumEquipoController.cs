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
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.album_equipo);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.multimedia);
            var album = db.album_equipo.Where<album_equipo>(r => r.idEquipo.Equals(id));

            return View(album.ToList());
        }

        public ActionResult Create(int id, album_equipo Album)
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
                Equipo = db.equipo.FirstOrDefault(e=>e.idEquipo.Equals(id)),
                Album = Album

            };
            return View(viewModel);
        } 

        //
        // POST: /AlbumEquipo/Create

        [HttpPost]
        public ActionResult Create(int id , EquipoAlbumMultimedia viewModel)
        {
            try
            {
                var equipo = db.equipo.First(d => d.idEquipo.Equals(id));
                if (equipo.estado != false)
                {
                    viewModel.Album.idEquipo = equipo.idEquipo;
                    viewModel.Album.equipo = equipo;
                    viewModel.Album.estado = true;
                    db.album_equipo.AddObject(viewModel.Album);
                    db.SaveChanges();
                    return RedirectToAction("Index", new RouteValueDictionary(new { controller = "AlbumEquipo", action = "Index", id = id }));
                }
                else {
                    ErrorModel error = new ErrorModel();
                    error.mensaje = "Otro usuario elimino el equipo durante la operación";
                    return View("Error", error);
                }
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


        public ActionResult agregarMultimedia(int id)
        {
            /*var album = db.album_equipo.First(a => a.idAlbum_Equipo.Equals(id));
            var equipo = db.equipo.FirstOrDefault(e => e.idEquipo.Equals(album.idEquipo));*/
             var viewModel = new EquipoAlbumMultimedia
             {
                 /*Equipo = equipo,
                 Albumes= equipo.album_equipo.ToList()*/
             };
             return View(viewModel);
        }

        [HttpPost]
        public ActionResult agregarMultimedia(int id, EquipoAlbumMultimedia viewModel) {
            var album = db.album_equipo.First(a => a.idAlbum_Equipo.Equals(id));
            var equipo = db.equipo.FirstOrDefault(e => e.idEquipo.Equals(album.idEquipo));
            var m = new multimedia();
            m.estado = true;
            m.comentario = viewModel.Multimedia.comentario;
            m.fuenteGrafica = viewModel.Multimedia.fuenteGrafica;
            if (album != null) {
                album.multimedia.Add(m);
                db.SaveChanges();
               
                return RedirectToAction("Index", new RouteValueDictionary(new { controller = "AlbumEquipo", action = "Index", id = equipo.idEquipo }));
            }


            return RedirectToAction("Index", new RouteValueDictionary(new { controller = "AlbumEquipo", action = "Index", id = equipo.idEquipo }));
        }

        public ActionResult verMultimedia(int id) {

            return RedirectToAction("Index", new RouteValueDictionary(new { controller = "MultimediaEquipo", action = "Index", id = id }));
        
        }
    }
}
