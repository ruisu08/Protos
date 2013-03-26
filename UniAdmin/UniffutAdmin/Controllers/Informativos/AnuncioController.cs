using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;

namespace UniffutAdmin.Controllers.Informativos
{
    public class AnuncioController : Controller
    {
        private uniffutData db = new uniffutData();
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
                    if (m.idModulo == 4 && usuario.rol.estado == true)
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
            var anuncios = db.anuncio.Where<anuncio>(r => r.estado == true);
            return View(anuncios.ToList());
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
                    if (m.idModulo == 4 && usuario.rol.estado == true)
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
            var anuncio = db.anuncio.First(p => p.idAnuncio.Equals(id));
            return View(anuncio);
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
                    if (m.idModulo == 4 && usuario.rol.estado == true)
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
        public ActionResult Create(anuncio Anuncio)
        {
            try
            {
                Anuncio.estado = true;
                db.anuncio.AddObject(Anuncio);
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
                    if (m.idModulo == 4 && usuario.rol.estado == true)
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
            var anuncio = db.anuncio.First(p => p.idAnuncio.Equals(id));
            return View(anuncio);
        }

        //
        // POST: /Patrocinador/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, anuncio Anuncio)
        {
            try
            {
                var anuncio = db.anuncio.FirstOrDefault(p => p.idAnuncio.Equals(id) && p.estado == true);
                anuncio.nombre = Anuncio.nombre;
                anuncio.isPrincipal = Anuncio.isPrincipal;
                anuncio.fechaInicio = Anuncio.fechaInicio;
                anuncio.fechaFinal = Anuncio.fechaFinal;
                anuncio.estado = true;
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
                    if (m.idModulo == 4 && usuario.rol.estado == true)
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
            var anuncio = db.anuncio.First(p => p.idAnuncio.Equals(id));
            return View(anuncio);
        }

        //
        // POST: /Patrocinador/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var anuncio = db.anuncio.FirstOrDefault(p => p.idAnuncio.Equals(id) && p.estado == true);
                anuncio.estado = false;
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

            var Anuncio = db.anuncio.FirstOrDefault(e => e.idAnuncio.Equals(id));
            var h = new HtmlString(HttpUtility.HtmlDecode(Anuncio.fuenteGrafica));
            Anuncio.fuenteGrafica = h.ToString();
            return View(Anuncio);
        }

        [HttpPost]
        public ActionResult agregarMultimedia(int id, anuncio Anuncio)
        {
            var anuncio = db.anuncio.FirstOrDefault(e => e.idAnuncio.Equals(id));
            if (anuncio != null)
            {
                anuncio.fuenteGrafica = Anuncio.fuenteGrafica;
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
            var anuncio = db.anuncio.First(p => p.idAnuncio.Equals(id) && p.fuenteGrafica != null);
            return View(anuncio);
        }




        public ActionResult Search(String nombre)
        {

            var anuncio = db.anuncio.Where<anuncio>(r => (r.nombre.Equals(nombre)) && r.estado == true);
            return View("SearchIndex", anuncio.ToList());
        }

        [HttpPost]
        public ActionResult SearchIndex(List<anuncio> list)
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
                    if (m.idModulo == 4 && usuario.rol.estado == true)
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
