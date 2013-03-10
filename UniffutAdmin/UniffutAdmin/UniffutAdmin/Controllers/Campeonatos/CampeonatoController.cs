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
            var viewModel = new CampeonatoDivisionViewModel
            {                
                Divisiones = db.division.ToList(),
                Campeonato = Campeonato
            };

            return View(viewModel);
        } 

        //
        // POST: /Campeonato/Create

        [HttpPost]
        public ActionResult Create(campeonato Campeonato, CampeonatoDivisionViewModel viewModel)
        {
            try
            {
                // TODO: Add insert logic here
                viewModel.Divisiones = db.division.ToList();
                viewModel.Campeonato = Campeonato;
                viewModel.Campeonato.estado = true;
                db.campeonato.AddObject(viewModel.Campeonato);
                db.SaveChanges();
                return RedirectToAction("Index");
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
            var campeonato = db.campeonato.First(p => p.idCampeonato.Equals(id));

            var viewModel = new CampeonatoDivisionViewModel
            {
                Divisiones = db.division.ToList(),
                Campeonato = campeonato
            };
            return View(viewModel);
        }

        //
        // POST: /Campeonato/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, campeonato Campeonato, CampeonatoDivisionViewModel viewModel)
        {
            try
            {
                var campeonato = db.campeonato.First(p => p.idCampeonato.Equals(id));

                viewModel = new CampeonatoDivisionViewModel
                {
                    Divisiones = db.division.ToList(),
                    Campeonato = campeonato
                };

                viewModel.Campeonato.descripcion = Campeonato.descripcion;
                viewModel.Campeonato.idDivision = Campeonato.idDivision;
                viewModel.Campeonato.nombre = Campeonato.nombre;
                db.SaveChanges();
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
            var campeonato = db.campeonato.First(p => p.idCampeonato.Equals(id));

            return View(campeonato);
        }

        //
        // POST: /Campeonato/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var campeonato = db.campeonato.First(p => p.idCampeonato.Equals(id));
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
