using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;

namespace UniffutAdmin.Controllers
{
    public class JugadoraController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Jugadora/

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
            else
            {
                bool autorizado = false;
                int idUser = (int)Session["userID"];
                var usuario = db.usuario.FirstOrDefault(u => u.idUsuario.Equals(idUser));
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(2)))
                {
                    if (m.idModulo == 2)
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
            var jugadoras = db.jugadora.Where<jugadora>(r => r.estado == true);  
            return View(jugadoras.ToList());
        }

        //
        // GET: /Jugadora/Details/5

        public ActionResult Details(int id)
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(2)))
                {
                    if (m.idModulo == 2)
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
            var jugadora = db.jugadora.First(p => p.idJugadora.Equals(id));
            return View(jugadora);
        }

        //
        // GET: /Jugadora/Create

        public ActionResult Create(jugadora Jugadora)
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(2)))
                {
                    if (m.idModulo == 2)
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
            var viewModel = new JugadoraEquipoViewModel
            {
                Equipos = db.equipo.Where<equipo>(e=>e.estado == true).ToList(),
                Jugadora = Jugadora
            };
            if (viewModel.Equipos.Count <= 0)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = "No existen equipos, debe crear el equipo donde estar la jugadora antes que la jugadora";
                return View("Error", error);
            }

            return View(viewModel);
        } 

        //
        // POST: /Jugadora/Create

        [HttpPost]
        public ActionResult Create(jugadora Jugadora, JugadoraEquipoViewModel viewModel)
        {
            try
            {
                /*viewModel.Equipos=db.equipo.ToList();
                viewModel.Jugadora = Jugadora;*/
                if (db.equipo.First(e => e.idEquipo.Equals(Jugadora.Equipo_idEquipo)).estado != false)
                {
                    var oldJugadora = db.jugadora.FirstOrDefault(j => j.identificacion == Jugadora.identificacion);
                    if (oldJugadora != null)
                    {
                        oldJugadora.nacionalidad = Jugadora.nacionalidad;
                        oldJugadora.nombre = Jugadora.nombre;
                        oldJugadora.apellidos = Jugadora.apellidos;
                        oldJugadora.Equipo_idEquipo = Jugadora.Equipo_idEquipo;
                        oldJugadora.fechaNacimiento = Jugadora.fechaNacimiento;
                        oldJugadora.historia = Jugadora.historia;
                        oldJugadora.estado = true;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    viewModel.Jugadora = Jugadora;
                    viewModel.Jugadora.estado = true;
                    db.jugadora.AddObject(viewModel.Jugadora);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel();
                    error.mensaje = "Otro usuario elimino el equipo de la jugadora durante la operacion";
                    return View("Error", error);
                }

            }
            catch(Exception e)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = e.InnerException.ToString()
                };
                return View("Error",error);
            }
        }
        
        //
        // GET: /Jugadora/Edit/5
 
        public ActionResult Edit(int id)
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(2)))
                {
                    if (m.idModulo == 2)
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
            var jugadora = db.jugadora.First(p => p.idJugadora.Equals(id));

            var viewModel = new JugadoraEquipoViewModel
            {
                Equipos = db.equipo.Where<equipo>(e=>e.estado == true).ToList(),
                Jugadora = jugadora
            };
            if (viewModel.Equipos.Count <= 0)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = "No existen equipos, otro usuario elimino los equipos durante la operacion";
                return View("Error", error);
            }
            return View(viewModel);
        }

        //
        // POST: /Jugadora/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, jugadora Jugadora, JugadoraEquipoViewModel viewModel)
        {
            try
            {
                if (db.equipo.First(e => e.idEquipo.Equals(Jugadora.Equipo_idEquipo)).estado != false)
                {
                    var jugadora = db.jugadora.FirstOrDefault(p => p.idJugadora.Equals(id) && p.estado == true);
                    if (jugadora != null)
                    {
                        viewModel = new JugadoraEquipoViewModel
                        {
                            Equipos = db.equipo.ToList(),
                            Jugadora = jugadora
                        };
                        viewModel.Jugadora.apellidos = Jugadora.apellidos;
                        viewModel.Jugadora.Equipo_idEquipo = Jugadora.Equipo_idEquipo;
                        viewModel.Jugadora.fechaNacimiento = Jugadora.fechaNacimiento;
                        viewModel.Jugadora.historia = Jugadora.historia;
                        viewModel.Jugadora.nombre = Jugadora.nombre;
                        viewModel.Jugadora.nacionalidad = Jugadora.nacionalidad;
                        viewModel.Jugadora.identificacion = Jugadora.identificacion;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    else {
                        ErrorModel error = new ErrorModel
                        {
                            mensaje = "Otro usuario elimino la jugadora durante la operacion"
                        };
                        return View("Error", error);
                    }
                }
                else {
                    ErrorModel error = new ErrorModel();
                    error.mensaje = "Otro usuario elimino el equipo de la jugadora durante la operacion";
                    return View("Error", error);
                }
            }
            catch(Exception e)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = e.InnerException.ToString()
                };
                
                return View("Error", error);
            }
        }

        //
        // GET: /Jugadora/Delete/5
 
        public ActionResult Delete(int id)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
            }
            else {
                bool autorizado = false;
                int idUser = (int)Session["userID"];
                var usuario = db.usuario.FirstOrDefault(u => u.idUsuario.Equals(idUser));
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(2)))
                {
                    if (m.idModulo == 2)
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
            var Jugadora = db.jugadora.First(p => p.idJugadora.Equals(id));
            if (!Jugadora.estado) {
                ErrorModel error = new ErrorModel { mensaje = "La jugadora ya fue eliminada" };
                return View("Error", error);
            }
            return View(Jugadora);
        }

        //
        // POST: /Jugadora/Delete/5

        [HttpPost]
        public ActionResult Delete(int id,  jugadora Jugadora)
        {
            try
            {
                Jugadora = db.jugadora.FirstOrDefault(p => p.idJugadora.Equals(id) && p.estado == true);
                if (Jugadora != null)
                {
                    Jugadora.estado = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else {
                    ErrorModel error = new ErrorModel { mensaje = "La jugadora ya fue eliminada" };
                    return View("Error", error);
                }

            }
            catch(Exception e)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = e.InnerException.ToString()
                };
                return View("Error", error);
            }
        }

        public ActionResult agregarHistoria(int id)
        {

            var Jugadora = db.jugadora.FirstOrDefault(e => e.idJugadora.Equals(id));
            var h = new HtmlString(HttpUtility.HtmlDecode(Jugadora.historia));
            Jugadora.historia = h.ToString();
            return View(Jugadora);
        }

        [HttpPost]
        public ActionResult agregarHistoria(int id, jugadora Jugadora)
        {
            var jugadora = db.jugadora.FirstOrDefault(e => e.idJugadora.Equals(id));
            if (jugadora != null)
            {
                jugadora.historia = Jugadora.historia;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Otro usuario elimino la division durante la operacion"
                };
                return View("Error", error);
            }
        }

        public ActionResult Search(int Identificacion) {

            var jugadora = db.jugadora.FirstOrDefault(j => j.identificacion == Identificacion);
            return View("Index",jugadora);
        }
    }
}
