using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
namespace UniffutAdmin.Controllers
{
    public class EquipoController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Equipo/

        public ActionResult Index()
        {
            var equipos = db.equipo.Where<equipo>(r => r.estado == true);
            return View(equipos.ToList());
        }

        //
        // GET: /Equipo/Details/5

        public ActionResult Details(int id)
        {
            var equipo = db.equipo.First(p => p.idEquipo.Equals(id));
            return View(equipo);
        }

        //
        // GET: /Equipo/Create

        public ActionResult Create(equipo Equipo)
        {
            var viewModel = new EquipoDivisionesViewModel
            {
                equipo = Equipo,
                divisiones = db.division.Where<division>(d=> d.estado==true).ToList()
            };
            if (viewModel.divisiones.Count <= 0)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = "No existen divisiones, debe crear la division donde estara el equipo antes de crear el equipo";
                return View("Error", error);
            }
            return View(viewModel);
        } 

        //
        // POST: /Equipo/Create

        [HttpPost]
        public ActionResult Create(equipo Equipo, EquipoDivisionesViewModel viewModel)
        {
            try
            {
               if (db.division.First(d => d.idDivisiones.Equals(Equipo.idDivision)).estado != false)
                {
                    var oldEquipo = db.equipo.FirstOrDefault(e => e.nombre == Equipo.nombre);
                    if (oldEquipo != null)
                    {
                        oldEquipo.abreviatura = Equipo.abreviatura;
                        oldEquipo.campeonatosGanados = Equipo.campeonatosGanados;
                        oldEquipo.idDivision = Equipo.idDivision;
                        oldEquipo.historia = Equipo.historia;
                        oldEquipo.estado = true;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    viewModel.equipo = Equipo;
                    viewModel.equipo.estado = true;
                    /*viewModel.divisiones = db.division.ToList();*/
                    db.equipo.AddObject(viewModel.equipo);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else {
                    ErrorModel error = new ErrorModel();
                    error.mensaje = "Otro usuario elimino la division durante la operacion";
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
        // GET: /Equipo/Edit/5
 
        public ActionResult Edit(int id)
        {
            var Equipo = db.equipo.First(p => p.idEquipo.Equals(id));

            var viewModel = new EquipoDivisionesViewModel
            {
                equipo = Equipo,
                divisiones = db.division.Where<division>(d => d.estado == true).ToList()
            };
            if (viewModel.divisiones.Count <= 0)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = "No existen divisiones, otro usuario elimino las divisiones durante la operacion";
                return View("Error", error);
            }

            return View(viewModel);
        }

        //
        // POST: /Equipo/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, equipo equipo, EquipoDivisionesViewModel viewModel)
        {
            
            try
            {
                if (db.division.First(d => d.idDivisiones.Equals(equipo.idDivision)).estado != false)
                {
                    var Equipo = db.equipo.FirstOrDefault(r => r.idEquipo.Equals(id) && r.estado == true);
                    if (Equipo != null)
                    {
                        viewModel = new EquipoDivisionesViewModel
                        {
                            equipo = Equipo,
                            divisiones = db.division.ToList()
                        };

                        viewModel.equipo.abreviatura = equipo.abreviatura;
                        viewModel.equipo.estado = equipo.estado;
                        viewModel.equipo.nombre = equipo.nombre;
                        viewModel.equipo.historia = equipo.historia;
                        viewModel.equipo.idDivision = equipo.idDivision;
                        viewModel.equipo.campeonatosGanados = equipo.campeonatosGanados;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    else
                    {

                        ErrorModel error = new ErrorModel
                        {
                            mensaje = "Otro usuario elimino el equipo durante la operacion"
                        };
                        return View("Error", error);
                    }
                }
                else {
                    ErrorModel error = new ErrorModel
                    {
                        mensaje = "Otro usuario elimino la division durante la operacion"
                    };
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
        // GET: /Equipo/Delete/5
 
        public ActionResult Delete(int id)
        {
            var Equipo = db.equipo.First(p => p.idEquipo.Equals(id));
            if (!Equipo.estado)
            {
                ErrorModel error = new ErrorModel { mensaje = "El equipo ya fue eliminado" };
                return View("Error", error);
            }
            return View(Equipo);
        }

        //
        // POST: /Equipo/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, equipo Equipo)
        {
            try
            {
                // TODO: Add delete logic here
                Equipo = db.equipo.FirstOrDefault(p => p.idEquipo.Equals(id) && p.estado == true);
                if (Equipo != null)
                {
                    var JugadoraEnEquipo = Equipo.jugadora;
                    foreach (var x in JugadoraEnEquipo) {
                        x.estado = false;
                        foreach (var m in x.multimedia) {
                            m.estado = false;
                        }
                    }
                    var EquipoEnCampeonato = Equipo.equipo_has_campeonato;
                    foreach (var x in EquipoEnCampeonato)
                    {
                        x.estado = false;
                    }
                    var MultimediaDeEquipo = Equipo.multimedia;
                    foreach (var x in MultimediaDeEquipo)
                    {
                        x.estado = false;
                    }

                    Equipo.estado = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else {
                    ErrorModel error = new ErrorModel { mensaje = "El equipo ya fue eliminado" };
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
    }
}
