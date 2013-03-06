using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
namespace UniffutAdmin.Controllers
{
    public class CalendarioController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Calendario/

        public ActionResult Index()
        {
            var calendarios = db.calendario.Where<calendario>(r => r.estado == true);
            return View(calendarios.ToList());
        }

        //
        // GET: /Calendario/Details/5

        public ActionResult Details(int id)
        {
            var calendario = db.calendario.First(p => p.idCalendario.Equals(id));
            return View(calendario);
        }

        //
        // GET: /Calendario/Create

        public ActionResult Create(calendario Calendario)
        {
            var viewModel = new CalendarioCampeonatoViewModel
            {
                Calendario = Calendario,
                Campeonato = db.campeonato.ToList()

            };
            return View(viewModel);
        } 

        //
        // POST: /Calendario/Create

        [HttpPost]
        public ActionResult Create(calendario Calendario, CalendarioCampeonatoViewModel viewModel)
        {
            try
            {
                // TODO: Add insert logic here
                viewModel.Campeonato = db.campeonato.ToList();
                viewModel.Calendario = Calendario;
                viewModel.Calendario.estado = true;
                db.calendario.AddObject(viewModel.Calendario);
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
        // GET: /Calendario/Edit/5
 
        public ActionResult Edit(int id)
        {
            var calendario = db.calendario.First(p => p.idCalendario.Equals(id));
            var viewModel = new CalendarioCampeonatoViewModel
            {
                Calendario = calendario,
                Campeonato = db.campeonato.ToList()

            };
            return View(viewModel);
        }

        //
        // POST: /Calendario/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, calendario Calendario)
        {
            try
            {
                // TODO: Add update logic here
                var calendario = db.calendario.First(p => p.idCalendario.Equals(id));
                var viewModel = new CalendarioCampeonatoViewModel
                {
                    Calendario = calendario,
                    Campeonato = db.campeonato.ToList()

                };
                viewModel.Calendario.fechaInicio = Calendario.fechaInicio;
                viewModel.Calendario.fechaFinal = Calendario.fechaFinal;
                viewModel.Calendario.idCampeonato = Calendario.idCampeonato;
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
        // GET: /Calendario/Delete/5
 
        public ActionResult Delete(int id)
        {
            var calendario = db.calendario.First(p => p.idCalendario.Equals(id));
            return View(calendario);
        }

        //
        // POST: /Calendario/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, calendario Calendario)
        {
            try
            {
                // TODO: Add delete logic here
                var calendario = db.calendario.First(p => p.idCalendario.Equals(id));
                calendario.estado = false;
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
