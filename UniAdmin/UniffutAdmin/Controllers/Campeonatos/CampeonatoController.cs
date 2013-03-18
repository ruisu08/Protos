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
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.campeonato);
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
                    Campeonato.division = db.division.First(d => d.idDivisiones.Equals(Campeonato.idDivision));
                    viewModel.Campeonato = Campeonato;
                    viewModel.Campeonato.estado = true;
                    foreach (var e in viewModel.Campeonato.division.equipo) {
                        viewModel.Campeonato.equipo.Add(e);
                        e.campeonato.Add(viewModel.Campeonato);
                    }
                    db.campeonato.AddObject(viewModel.Campeonato);
                    var tabla = new tabla_posiciones();
                    tabla.estado = true;
                    tabla.idCampeonato = viewModel.Campeonato.idCampeonato;
                    tabla.campeonato = viewModel.Campeonato;
                    db.tabla_posiciones.AddObject(tabla);
                    foreach (var e in viewModel.Campeonato.equipo) {
                        var tE = new tabla_equipo();
                        tE.idTabla = tabla.idTabla;
                        tE.tabla_posiciones = tabla;
                        tE.idEquipo = e.idEquipo;
                        tE.equipo = e;
                        tE.puntos = 0;
                        db.tabla_equipo.AddObject(tE);
                    }
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

        public ActionResult verTabla(int id) {
            return RedirectToAction("Details", new RouteValueDictionary(new { controller = "TablaPosiciones", action = "Details", id = id }));
        
        }

        public ActionResult agregarEquipo(int id) {
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.campeonato);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.equipo);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.division);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.tabla_posiciones);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.tabla_equipo);

            var Campeonato = db.campeonato.FirstOrDefault(cam => cam.idCampeonato.Equals(id));
            if (Campeonato.division.equipo.Count <= 0) { 
                ErrorModel error = new ErrorModel{
                    mensaje="La division a la que pertenece el campeonato no tiene equipos"
                };
                return View("Error", error);
            }
            var viewModel = new CampeonatoDivisionViewModel
            {
                Campeonato = Campeonato
            };
            List<equipo> listaReal = viewModel.Campeonato.division.equipo.Where<equipo>(e=>e.campeonato.Contains(viewModel.Campeonato) == false && e.estado == true).ToList();
            for (int i = 0; i < viewModel.Campeonato.division.equipo.Count;)
            {
                var list = viewModel.Campeonato.division.equipo.ToList();
                var e = list[i];
                viewModel.Campeonato.division.equipo.Remove(e);
            }
            foreach (var e in listaReal) {
               viewModel.Campeonato.division.equipo.Add(e);
            }
            return View(viewModel);
        }

        [HttpPost]
        public ActionResult agregarEquipo(int id, CampeonatoDivisionViewModel viewModel)
        {
            var campeonato = db.campeonato.FirstOrDefault(cam => cam.idCampeonato.Equals(id));
            var equipo = db.equipo.FirstOrDefault(e => e.idEquipo.Equals(viewModel.EquipoEspecifico.idEquipo));
            campeonato.equipo.Add(equipo);
            equipo.campeonato.Add(campeonato);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.campeonato);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.equipo);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.division);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.tabla_posiciones);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.tabla_equipo);
            db.SaveChanges();
            var tabla = db.tabla_posiciones.FirstOrDefault(t => t.idCampeonato.Equals(campeonato.idCampeonato));
            var tablaEquipo = new tabla_equipo();
            tablaEquipo.equipo = campeonato.equipo.First(e => e.idEquipo.Equals(equipo.idEquipo));
            tablaEquipo.tabla_posiciones = tabla;
            tablaEquipo.puntos = 0;
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult eliminarEquipo(int id) {
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.campeonato);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.equipo);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.division);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.tabla_posiciones);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.tabla_equipo);

            var Campeonato = db.campeonato.FirstOrDefault(cam => cam.idCampeonato.Equals(id));
           
            var viewModel = new CampeonatoDivisionViewModel
            {
                Campeonato = Campeonato
            };

            return View(viewModel);
        }

        [HttpPost]
        public ActionResult eliminarEquipo(int id, CampeonatoDivisionViewModel viewModel)
        {


            var campeonato = db.campeonato.FirstOrDefault(cam => cam.idCampeonato.Equals(id));
            var equipo = db.equipo.First(e=>e.idEquipo.Equals(viewModel.EquipoEspecifico.idEquipo));
            campeonato.equipo.Remove(equipo);
            equipo.campeonato.Remove(campeonato);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.campeonato);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.equipo);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.division);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.tabla_posiciones);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.tabla_equipo);
            //db.SaveChanges();
            var tabla = db.tabla_posiciones.First(t => t.idCampeonato.Equals(campeonato.idCampeonato));
            var tablaEquipo = tabla.tabla_equipo.First(te => te.idEquipo.Equals(equipo.idEquipo) && te.idTabla.Equals(tabla.idTabla));
            tabla.tabla_equipo.Remove(tablaEquipo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}
