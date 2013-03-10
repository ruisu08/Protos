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
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
            }
            var calendarios = db.calendario.Where<calendario>(r => r.estado == true);
            return View(calendarios.ToList());
        }

        //
        // GET: /Calendario/Details/5

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
            var calendario = db.calendario.First(p => p.idCalendario.Equals(id));
            return View(calendario);
        }

        //
        // GET: /Calendario/Create

        public ActionResult Create(calendario Calendario)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
            }
            var viewModel = new CalendarioCampeonatoViewModel
            {
                Calendario = Calendario,
                Campeonato = db.campeonato.Where<campeonato>(d => d.estado == true).ToList()

            };
            if (viewModel.Campeonato.Count <= 0)
            {
                ErrorModel error = new ErrorModel() { mensaje = "No existen campeonatos, debe crear el campeonato antes de crear el calendario"};
                return View("Error", error);
            }
            return View(viewModel);
        } 

        //
        // POST: /Calendario/Create

        [HttpPost]
        public ActionResult Create(calendario Calendario, CalendarioCampeonatoViewModel viewModel)
        {
            try
            {

                if (db.campeonato.First(p => p.idCampeonato.Equals(Calendario.idCampeonato)).estado == true)
                {
                    var oldCalendario = db.calendario.FirstOrDefault(e => e.fechaInicio == Calendario.fechaInicio && e.idCampeonato == Calendario.idCampeonato);
                    if (oldCalendario != null)
                    {
                        oldCalendario.fechaInicio = Calendario.fechaInicio;
                        oldCalendario.fechaFinal = Calendario.fechaFinal;
                        oldCalendario.idCampeonato = Calendario.idCampeonato;
                        oldCalendario.estado = true;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }

                    viewModel.Calendario = Calendario;
                    viewModel.Calendario.estado = true;
                    db.calendario.AddObject(viewModel.Calendario);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje = "Otro usuario elimino el campeonato durante la operacion"};
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
        // GET: /Calendario/Edit/5
 
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
            var calendario = db.calendario.First(p => p.idCalendario.Equals(id));
            var viewModel = new CalendarioCampeonatoViewModel
            {
                Calendario = calendario,
                Campeonato = db.campeonato.Where<campeonato>(d => d.estado == true).ToList()
            };
            if (viewModel.Campeonato.Count <= 0)
            {
                ErrorModel error = new ErrorModel { mensaje = "No existen campeonatos, otro usuario elimino los campeonatos durante la operacion" };
                return View("Error", error);
            }
            return View(viewModel);
        }

        //
        // POST: /Calendario/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, calendario Calendario, CalendarioCampeonatoViewModel viewModel)
        {
            try
            {

                if (db.campeonato.First(d => d.idCampeonato.Equals(Calendario.idCampeonato)).estado != false)
                {
                    var calendario = db.calendario.FirstOrDefault(d => d.idCalendario.Equals(id) && d.estado == true);
                    if (calendario != null)
                    {
                        viewModel = new CalendarioCampeonatoViewModel
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
                    else
                    {
                        ErrorModel error = new ErrorModel { mensaje = "Otro usuario elimino el calendario durante la Operacion" };
                        return View("Error", error);
                    }
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje = "Otro usuario elimino el campeonato durante la operacion" };
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
        // GET: /Calendario/Delete/5
 
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
            var calendario = db.calendario.First(p => p.idCalendario.Equals(id));
            if (!calendario.estado)
            {
                ErrorModel error = new ErrorModel { mensaje = "El calendario ya fue eliminado" };
                return View("Error", error);
            }
            return View(calendario);
        }

        //
        // POST: /Calendario/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, calendario Calendario)
        {
            try
            {
                Calendario = db.calendario.FirstOrDefault(p => p.idCalendario.Equals(id) && p.estado == true);
                if (Calendario != null)
                {
                    Calendario.estado = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje = "El calendario ya fue eliminado" };
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
