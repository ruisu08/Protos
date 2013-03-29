using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
using System.Web.Routing;

namespace UniffutAdmin.Controllers.Campeonatos
{
    public class TablaGoleadorasController : Controller
    {
        private uniffutData db = new uniffutData();

        // GET: /TablaGoleadoras/Details/5
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
            var goleadoras = db.goleadoras.Where<goleadoras>(r => r.estado == true && r.idCampeonato.Equals(id));
            return View(goleadoras.ToList());
        }

        public ActionResult Details(int id)
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
            var tabla = db.goleadoras.FirstOrDefault(t => t.idCampeonato.Equals(id) && t.estado == true);
            if (tabla == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "No Existe ninguna tabla de goleadoras"
                };
                return View("Error", error);
            }
            return View(tabla);
        }

        //
        // GET: /TablaGoleadoras/Create

        public ActionResult Create(int id, goleadoras goleadoras)
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
            
            var campeonato = db.campeonato.First(d => d.idCampeonato.Equals(id) && d.estado == true);
            if (campeonato.division.equipo.Count <= 0)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "La division a la que pertenece el campeonato no tiene equipos"
                };
                return View("Error", error);
            }
            goleadoras.campeonato = campeonato;
            goleadoras.idCampeonato = campeonato.idCampeonato;
            return View(goleadoras);
        }

        [HttpPost]
        public ActionResult refrescar(int idEquipo)
        {
            return Json(db.jugadora.Where<jugadora>(j => j.Equipo_idEquipo == idEquipo).ToList());

        }


        //
        // POST: /TablaGoleadoras/Create

        [HttpPost]
        public ActionResult Create(int id, goleadoras goleadoras, FormCollection form)
        {
            try
            {
                var campeonato = db.campeonato.First(d => d.idCampeonato.Equals(id) && d.estado == true);
                if (campeonato.estado != false)
                {
                    goleadoras.campeonato = campeonato;
                    goleadoras.idCampeonato = campeonato.idCampeonato;
                    goleadoras.estado = true;
                    goleadoras.goles = 0;
                    db.goleadoras.AddObject(goleadoras);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel();
                    error.mensaje = "Otro usuario elimino el campeonato durante la operación";
                    return View("Error", error);
                }

            }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = e.InnerException.ToString()
                };
                return View("Error", error);
            }
        }

        //
        // GET: /TablaGoleadoras/Edit/5

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
            var goleadoras = db.goleadoras.First(a => a.idCampeonato.Equals(id));
            return View(goleadoras);
        }

        //
        // POST: /TablaGoleadoras/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, goleadoras goleadoras)
        {
            try
            {
                var Goleadoras = db.goleadoras.First(a => a.idCampeonato.Equals(id));
                Goleadoras.idCampeonato = goleadoras.idCampeonato;
                Goleadoras.idJugadora = goleadoras.idJugadora;
                Goleadoras.goles = goleadoras.goles;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = e.InnerException.ToString()
                };
                return View("ErrorSesion", error);
            }
        }

        //
        // GET: /TablaGoleadoras/Delete/5

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
            var goleadoras = db.goleadoras.First(p => p.idCampeonato.Equals(id));
            if (goleadoras.estado == false)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "No existen campeonatos"
                };
                return View("Error", error);
            }

            return View(goleadoras);
        }

        //
        // POST: /TablaGoleadoras/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var goleadoras = db.goleadoras.FirstOrDefault(p => p.idCampeonato.Equals(id) && p.estado == true);
                if (goleadoras != null)
                {
                    goleadoras.estado = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje = "El campeonato ya fue eliminado" };
                    return View("Error", error);
                }
            }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = e.InnerException.ToString()
                };
                return View("Error", error);
            }
        }


    }
}
