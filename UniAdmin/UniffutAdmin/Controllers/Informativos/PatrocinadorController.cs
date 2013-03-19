using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
namespace UniffutAdmin.Controllers.Informativos
{
    public class PatrocinadorController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Patrocinador/

        public ActionResult Index()
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(4)))
                {
                    if (m.idModulo == 4)
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
            var patrocinadores = db.patrocinador.Where<patrocinador>(r => r.estado == true);
            return View(patrocinadores.ToList());
        }

        //
        // GET: /Patrocinador/Details/5

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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(4)))
                {
                    if (m.idModulo == 4)
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
            var patrocinadores = db.patrocinador.First(p=> p.idPatrocinador.Equals(id));
            return View(patrocinadores);
        }

        //
        // GET: /Patrocinador/Create

        public ActionResult Create()
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(4)))
                {
                    if (m.idModulo == 4)
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
            return View();
        } 

        //
        // POST: /Patrocinador/Create

        [HttpPost]
        public ActionResult Create(patrocinador Patrocinador)
        {
            try
            {
                var oldPatrocinador = db.patrocinador.FirstOrDefault(e => e.nombre == Patrocinador.nombre);
                if (oldPatrocinador != null)
                {
                    oldPatrocinador.nombre = Patrocinador.nombre;
                    oldPatrocinador.descripcion = Patrocinador.descripcion;
                    oldPatrocinador.fechaIngreso = Patrocinador.fechaIngreso;
                    oldPatrocinador.fechaSalida = Patrocinador.fechaSalida;
                    oldPatrocinador.estado = true;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                Patrocinador.estado = true;
                db.patrocinador.AddObject(Patrocinador);
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
        // GET: /Patrocinador/Edit/5
 
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(4)))
                {
                    if (m.idModulo == 4)
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
            var patrocinadores = db.patrocinador.First(p => p.idPatrocinador.Equals(id));
            return View(patrocinadores);
        }

        //
        // POST: /Patrocinador/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, patrocinador Patrocinador)
        {
            try
            {
                var patrocinador = db.patrocinador.FirstOrDefault(p => p.idPatrocinador.Equals(id) && p.estado == true);
                patrocinador.nombre = Patrocinador.nombre;
                patrocinador.descripcion = Patrocinador.descripcion;
                patrocinador.fechaIngreso = Patrocinador.fechaIngreso;
                patrocinador.fechaSalida = Patrocinador.fechaSalida;
                patrocinador.estado = true;
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
        // GET: /Patrocinador/Delete/5
 
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(4)))
                {
                    if (m.idModulo == 4)
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
            var patrocinadores = db.patrocinador.First(p => p.idPatrocinador.Equals(id));
            return View(patrocinadores);
        }

        //
        // POST: /Patrocinador/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var patrocinador = db.patrocinador.FirstOrDefault(p => p.idPatrocinador.Equals(id) && p.estado == true);
                patrocinador.estado = false;
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

        public ActionResult agregarMultimedia(int id)
        {

            var Patrocinador = db.patrocinador.FirstOrDefault(e => e.idPatrocinador.Equals(id));
            var h = new HtmlString(HttpUtility.HtmlDecode(Patrocinador.fuenteGrafica));
            Patrocinador.fuenteGrafica = h.ToString();
            return View(Patrocinador);
        }

        [HttpPost]
        public ActionResult agregarMultimedia(int id, patrocinador Patrocinador)
        {
            var patrocinador = db.patrocinador.FirstOrDefault(e => e.idPatrocinador.Equals(id));
            if (patrocinador != null)
            {
                patrocinador.fuenteGrafica = Patrocinador.fuenteGrafica;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Otro usuario elimino al patrocinador durante la operacion"
                };
                return View("Error", error);
            }
        }

        public ActionResult verMultimedia(int id)
        {
            var patrocinadores = db.patrocinador.First(p => p.idPatrocinador.Equals(id) && p.fuenteGrafica != null);
            return View(patrocinadores);
        }




        public ActionResult Search(String nombre)
        {

            var patrocinador = db.patrocinador.Where<patrocinador>(r => (r.nombre.Equals(nombre)) && r.estado == true);
            return View("SearchIndex", patrocinador.ToList());
        }

        [HttpPost]
        public ActionResult SearchIndex(List<patrocinador> list)
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(1)))
                {
                    if (m.idModulo == 1)
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

            return View(list);
        }
    }
}
