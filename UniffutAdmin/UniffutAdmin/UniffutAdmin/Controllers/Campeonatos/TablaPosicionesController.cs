using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;

namespace UniffutAdmin.Controllers.Campeonatos
{
    public class TablaPosicionesController : Controller
    {
        //
        // GET: /TablaPosiciones/
        private static uniffutData db = new uniffutData();

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
            var posisiones = db.equipo_has_campeonato.Where<equipo_has_campeonato>(r => r.estado == true);
            return View(posisiones.ToList());
        }

        //
        // GET: /TablaPosiciones/Details/5

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
            var tabla = db.equipo_has_campeonato.First(r => r.Equipo_idEquipo.Equals(id));
            return View(tabla);
        }

        //
        // GET: /TablaPosiciones/Create

        public ActionResult Create(equipo_has_campeonato tabla)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
            }
            var viewModel = new TablaPosicionesEquipoViewModel
            {
                equipos = db.equipo.ToList(),
                campeonatos = db.campeonato.ToList(),
                tablaPosiciones = tabla
            };
            
            return View(viewModel);
        } 

        //
        // POST: /TablaPosiciones/Create

        [HttpPost]
        public ActionResult Create(equipo_has_campeonato tablaPosiciones, TablaPosicionesEquipoViewModel viewModel)
        {
            try
            {
                viewModel.tablaPosiciones = tablaPosiciones;
                viewModel.tablaPosiciones.estado = true;
                viewModel.equipos = db.equipo.ToList();
                viewModel.campeonatos = db.campeonato.ToList();

                db.equipo_has_campeonato.AddObject(viewModel.tablaPosiciones);
                db.SaveChanges();
                return RedirectToAction("Index");
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
        // GET: /TablaPosiciones/Edit/5
 
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
            var tabla = db.equipo_has_campeonato.First(r => r.Equipo_idEquipo.Equals(id));
            var viewModel = new TablaPosicionesEquipoViewModel
            {
                equipos = db.equipo.ToList(),
                campeonatos = db.campeonato.ToList(),
                tablaPosiciones = tabla
            };
            return View(viewModel);
        }

        //
        // POST: /TablaPosiciones/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, equipo_has_campeonato tablaPosiciones, TablaPosicionesEquipoViewModel viewModel)
        {
            
            try
            {
                var tablaPos = db.equipo_has_campeonato.First(r => r.Equipo_idEquipo.Equals(id));
                viewModel = new TablaPosicionesEquipoViewModel 
                {
                
                    tablaPosiciones = tablaPos,
                    campeonatos = db.campeonato.ToList(),
                    equipos = db.equipo.ToList()
                };

                viewModel.tablaPosiciones.puntos = tablaPosiciones.puntos;                            
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch(Exception e)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = e.Message;
                return View("Error", error);
            }
        }

        //
        // GET: /TablaPosiciones/Delete/5
 
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
            var tablaPos = db.equipo_has_campeonato.First(r => r.Equipo_idEquipo.Equals(id));
            return View(tablaPos);
        }

        //
        // POST: /TablaPosiciones/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var tablaPos = db.equipo_has_campeonato.First(r => r.Campeonato_idCampeonato.Equals(id));
                tablaPos.estado = false;
                db.SaveChanges(); 
                return RedirectToAction("Index");
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
