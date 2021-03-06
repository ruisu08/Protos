﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
using System.Web.Routing;

namespace UniffutAdmin.Controllers.Multimedia
{
    public class AlbumJugadoraController : Controller
    {
        private uniffutData db = new uniffutData();
        //
        // GET: /AlbumJugadora/

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
            else
            {
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
            var album = db.album_jugadora.Where<album_jugadora>(r => r.idJugadora.Equals(id));

            return View(album.ToList());
        }

        //
        // GET: /AlbumJugadora/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /AlbumJugadora/Create

        public ActionResult Create(int id, album_jugadora Album)
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
            var viewModel = new JugadoraAlbumMultimedia
            {
                jugadora = db.jugadora.FirstOrDefault(j => j.idJugadora.Equals(id)),
                album = Album

            };
            return View(viewModel);
        }

        //
        // POST: /AlbumEquipo/Create

        [HttpPost]
        public ActionResult Create(int id, JugadoraAlbumMultimedia viewModel)
        {
            try
            {
                var jugadora = db.jugadora.First(d => d.idJugadora.Equals(id));
                if (jugadora.estado != false)
                {
                    viewModel.album.idJugadora = jugadora.idJugadora;
                    viewModel.album.jugadora = jugadora;
                    viewModel.album.estado = true;
                    db.album_jugadora.AddObject(viewModel.album);
                    db.SaveChanges();
                    return RedirectToAction("Index", new RouteValueDictionary(new { controller = "AlbumJugadora", action = "Index", id = id }));
                }
                else
                {
                    ErrorModel error = new ErrorModel();
                    error.mensaje = "Otro usuario elimino la jugadora durante la operación";
                    return View("Error", error);
                }
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /AlbumJugadora/Edit/5
 
        public ActionResult Edit(int id)
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
            var album = db.album_jugadora.First(a => a.idAlbum_Jugadora.Equals(id));
            return View(album);
        }

        //
        // POST: /AlbumJugadora/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, album_jugadora album)
        {
            try
            {
                    var Album = db.album_jugadora.FirstOrDefault(r => r.idAlbum_Jugadora.Equals(id) && r.estado == true);
                    if (Album != null)
                    {

                        Album.nombre = album.nombre;
                        db.SaveChanges();
                        return RedirectToAction("Index");

                    }
                    else
                    {
                        ErrorModel error = new ErrorModel()
                        {
                            mensaje = "Otro usuario elimino el album durante la operacion"
                        };
                        return View("Error", error);
                    }
             }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel { mensaje = e.Message };
                return View("Error", error);
            }
        }


        public ActionResult Delete(int id)
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
            var album = db.album_jugadora.First(a => a.idAlbum_Jugadora.Equals(id));
            if (!album.estado)
            {
                ErrorModel error = new ErrorModel { mensaje = "El album ya fue eliminada" };
                return View("Error", error);
            }
            return View(album);
        }

        //
        // POST: /AlbumEquipo/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {

                var Album = db.album_jugadora.First(a => a.idAlbum_Jugadora.Equals(id));
                if (Album != null)
                {

                    for (int i = 0; i < Album.multimedia.Where<multimedia>(m => m.estado == true).Count(); )
                    {
                        var l = Album.multimedia.Where<multimedia>(m => m.estado == true).ToList();
                        var multi = l[i];
                        multi.estado = false;
                    }
                    Album.estado = false;
                    db.SaveChanges();
                    return RedirectToAction("Index", id = Album.idJugadora);
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje = "El Album ya fue eliminado" };
                    return View("Error", error);
                }

            }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel { mensaje = e.Message };
                return View("Error", error);
            }
        }


        public ActionResult agregarMultimedia(int id)
        {
            /*var album = db.album_equipo.First(a => a.idAlbum_Equipo.Equals(id));
            var equipo = db.equipo.FirstOrDefault(e => e.idEquipo.Equals(album.idEquipo));*/
            var viewModel = new JugadoraAlbumMultimedia
            {
                /*Equipo = equipo,
                Albumes= equipo.album_equipo.ToList()*/
            };
            return View(viewModel);
        }

        [HttpPost]
        public ActionResult agregarMultimedia(int id, JugadoraAlbumMultimedia viewModel)
        {
            var album = db.album_jugadora.First(a => a.idAlbum_Jugadora.Equals(id));
            var jugadora = db.jugadora.FirstOrDefault(e => e.idJugadora.Equals(album.idJugadora));
            var m = new multimedia();
            m.estado = true;
            m.comentario = viewModel.Multimedia.comentario;
            m.fuenteGrafica = viewModel.Multimedia.fuenteGrafica;
            if (album != null)
            {
                album.multimedia.Add(m);
                db.SaveChanges();
                return RedirectToAction("Index", new RouteValueDictionary(new { controller = "AlbumJugadora", action = "Index", id = jugadora.idJugadora }));
            }


            return RedirectToAction("Index", new RouteValueDictionary(new { controller = "AlbumEquipo", action = "Index", id = jugadora.idJugadora }));
        }

        public ActionResult verMultimedia(int id)
        {
                       
            return RedirectToAction("Index", new RouteValueDictionary(new { controller = "MultimediaJugadora", action = "Index", id = id }));

        }
    }
}
