using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;

namespace UniffutAdmin.Controllers.Informativos
{
    public class LiveYourGoalsController : Controller
    {
        private uniffutData db = new uniffutData();
        //
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(3)))
                {
                    if (m.idModulo == 3 && usuario.rol.estado == true)
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
            var paginas = db.pagina_informativa.Where<pagina_informativa>(r => r.estado == true && r.isLYG == true);
            return View(paginas.ToList());
        }

        //
        // GET: /PaginaInformativa/Details/5

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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(3)))
                {
                    if (m.idModulo == 3 && usuario.rol.estado == true)
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
            var pagina = db.pagina_informativa.First(p => p.idPagina_Informativa.Equals(id));
            return View(pagina);
        }

        //
        // GET: /PaginaInformativa/Create

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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(3)))
                {
                    if (m.idModulo == 3 && usuario.rol.estado == true)
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
        // POST: /PaginaInformativa/Create

        [HttpPost]
        public ActionResult Create(pagina_informativa pagina)
        {
            try
            {
                int idU = (int)Session["userID"];
                pagina.fecha = DateTime.Now;
                pagina.isLYG = true;
                pagina.usuario = db.usuario.First(u => u.idUsuario.Equals(idU));
                pagina.autor = pagina.usuario.idUsuario;
                pagina.estado = true;
                db.pagina_informativa.AddObject(pagina);
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
        // GET: /PaginaInformativa/Edit/5

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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(3)))
                {
                    if (m.idModulo == 3 && usuario.rol.estado == true)
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
            var Pagina = db.pagina_informativa.First(p => p.idPagina_Informativa.Equals(id));

            return View(Pagina);
        }

        //
        // POST: /PaginaInformativa/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, pagina_informativa Pagina)
        {
            try
            {
                var pagina = db.pagina_informativa.First(p => p.idPagina_Informativa.Equals(id) && p.estado == true);
                pagina.titulo = Pagina.titulo;
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
        // GET: /PaginaInformativa/Delete/5

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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(3)))
                {
                    if (m.idModulo == 3 && usuario.rol.estado == true)
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
            var pagina = db.pagina_informativa.First(p => p.idPagina_Informativa.Equals(id));
            if (!pagina.estado)
            {
                ErrorModel error = new ErrorModel { mensaje = "La Pagina Informativa ya fue eliminada" };
                return View("Error", error);
            }
            return View(pagina);
        }

        //
        // POST: /PaginaInformativa/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var pagina = db.pagina_informativa.First(p => p.idPagina_Informativa.Equals(id));
                pagina.estado = false;
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

        public ActionResult agregarContenido(int id)
        {

            var Pagina = db.pagina_informativa.FirstOrDefault(e => e.idPagina_Informativa.Equals(id));
            var h = new HtmlString(HttpUtility.HtmlDecode(Pagina.contenido));
            Pagina.contenido = h.ToString();
            return View(Pagina);
        }

        [HttpPost]
        public ActionResult agregarContenido(int id, pagina_informativa Pagina)
        {
            var pagina = db.pagina_informativa.FirstOrDefault(e => e.idPagina_Informativa.Equals(id));
            if (pagina != null)
            {
                pagina.contenido = Pagina.contenido;
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

        [HttpPost]
        public ActionResult Search(String titulo, String autor)
        {

            var paginas = db.pagina_informativa.Where<pagina_informativa>(r => (r.titulo.Equals(titulo) || r.usuario.apellido.Equals(autor) || r.usuario.identificacion.Equals(autor)) && r.estado == true && r.isLYG == true);
            return View("SearchIndex", paginas.ToList());
        }


        public ActionResult SearchIndex(List<pagina_informativa> list)
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
                    if (m.idModulo == 3 && usuario.rol.estado == true)
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
