using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;

namespace UniffutAdmin.Controllers
{
    public class CampeonatoController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Campeonato/

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
            var campeonatos = db.campeonato.Where<campeonato>(r => r.estado == true);
            return View(campeonatos.ToList());
        }

        //
        // GET: /Campeonato/Details/5

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
            var campeonato = db.campeonato.First(p => p.idCampeonato.Equals(id));
            return View(campeonato);
        }

        //
        // GET: /Campeonato/Create

        public ActionResult Create(campeonato Campeonato)
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
            var viewModel = new CampeonatoDivisionViewModel
            {                
                Divisiones = db.division.Where<division>(d => d.estado == true).ToList(),
                Campeonato = Campeonato
            };
            if (viewModel.Divisiones.Count <= 0)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = "No existen divisiones, debe crear la division antes de crear el campeonato";
                return View("Error", error);
            }
            return View(viewModel);
        } 

        //
        // POST: /Campeonato/Create

        [HttpPost]
        public ActionResult Create(campeonato Campeonato, CampeonatoDivisionViewModel viewModel)
        {
            try
            {
                if (db.division.First(d => d.idDivisiones.Equals(Campeonato.idDivision)).estado != false)
                {
                    var oldCampeonato = db.campeonato.FirstOrDefault(e => e.nombre == Campeonato.nombre);
                    if (oldCampeonato != null)
                    {
                        oldCampeonato.nombre = Campeonato.nombre;
                        oldCampeonato.descripcion = Campeonato.descripcion;
                        oldCampeonato.idDivision = Campeonato.idDivision;
                        oldCampeonato.estado = true;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    viewModel.Campeonato = Campeonato;
                    viewModel.Campeonato.estado = true;
                    db.campeonato.AddObject(viewModel.Campeonato);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel();
                    error.mensaje = "Otro usuario elimino la division durante la operacion";
                    return View("Error", error);
                }
            }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel {
                    mensaje = e.InnerException.ToString()
                };
                return View("Error",error);
            }
        }
        
        //
        // GET: /Campeonato/Edit/5
 
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
            var campeonato = db.campeonato.First(p => p.idCampeonato.Equals(id));

            var viewModel = new CampeonatoDivisionViewModel
            {
                Divisiones = db.division.Where<division>(d => d.estado == true).ToList(),
                Campeonato = campeonato
            };
            if (viewModel.Divisiones.Count <= 0)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "No exiten divisiones debe crear alguna."
                };
                return View("Error", error);
            }
            return View(viewModel);
        }

        //
        // POST: /Campeonato/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, campeonato Campeonato, CampeonatoDivisionViewModel viewModel)
        {
            try
            {
                if (db.division.First(d => d.idDivisiones.Equals(Campeonato.idDivision)).estado != false)
                {
                    var campeonato = db.campeonato.FirstOrDefault(r => r.idCampeonato.Equals(id) && r.estado == true);
                    if (campeonato != null)
                    {
                        viewModel = new CampeonatoDivisionViewModel
                        {
                            Campeonato = campeonato,
                            Divisiones = db.division.Where<division>(d => d.estado == true).ToList()
                        };

                        viewModel.Campeonato.nombre = Campeonato.nombre;
                        viewModel.Campeonato.descripcion = Campeonato.descripcion;
                        viewModel.Campeonato.idDivision = Campeonato.idDivision;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ErrorModel error = new ErrorModel
                        {
                            mensaje = "Otro usuario elimino el campeonato durante la operacion"
                        };
                        return View("Error", error);
                    }
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
        // GET: /Campeonato/Delete/5
 
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
            var campeonato = db.campeonato.First(p => p.idCampeonato.Equals(id));
            if (!campeonato.estado)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "No existen campeonatos"
                };
                return View("Error", error);
            }

            return View(campeonato);
        }

        //
        // POST: /Campeonato/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var campeonato = db.campeonato.FirstOrDefault(p => p.idCampeonato.Equals(id) && p.estado == true);
                if (campeonato != null)
                {
                    var tablaPosiciones = campeonato.equipo_has_campeonato;
                    foreach (var x in tablaPosiciones)
                    {
                        x.estado = false;
                    }

                    var calendarioEnCampeonato = campeonato.calendario;
                    foreach (var x in calendarioEnCampeonato)
                    {
                        x.estado = false;
                    }

                    campeonato.estado = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje = "El campeonato ya fue eliminado" };
                    return View("Error", error);
                }
                campeonato.estado = false;
                db.SaveChanges();
                // TODO: Add delete logic here

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
        }
    }
}
