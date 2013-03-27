using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
namespace UniffutAdmin.Controllers
{
    public class NoticiaController : Controller
    {
        private uniffutData db = new uniffutData();
        //
        // GET: /Noticia/

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
            var noticias = db.noticia.Where<noticia>(r => r.estado == true);
            return View(noticias.ToList());
        }

        //
        // GET: /Noticia/Details/5

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
            var noticia = db.noticia.First(p => p.idNoticia.Equals(id));
            return View(noticia);
        }

        //
        // GET: /Noticia/Create

        public ActionResult Create(noticia Noticia)
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
            var viewModel = new NoticiaViewModel 
            { 
                Noticia = Noticia,
                Tipos = db.tiponoticia.ToList()  
            };
            if (viewModel.Tipos.Count <= 0)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = "No existen tipos de noticia, debe crear algun tipo de noticia para editar estar seccion";
                return View("Error", error);
            }
            return View(viewModel);
        } 

        //
        // POST: /Noticia/Create

        [HttpPost]
        public ActionResult Create(noticia Noticia, NoticiaViewModel viewModel)
        {
            try
            {
                    Noticia.fecha = DateTime.Now;
                    int idUser = (int)Session["userID"];
                    
                    Noticia.usuario = db.usuario.First(u => u.idUsuario.Equals(idUser));
                    Noticia.autor = Noticia.usuario.idUsuario;
                    viewModel.Noticia = Noticia;
                    viewModel.Noticia.estado = true;
                    viewModel.Tipos = db.tiponoticia.ToList();
                    db.noticia.AddObject(viewModel.Noticia);
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
        // GET: /Noticia/Edit/5
 
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
            var noticia = db.noticia.First(p => p.idNoticia.Equals(id));
            var VM = new NoticiaViewModel
            {
                Noticia = noticia,
                Tipos = db.tiponoticia.ToList()
            };
            if (VM.Tipos.Count <= 0)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = "No existen tipos de noticia, debe crear algun tipo de noticia para editar estar seccion";
                return View("Error", error);
            }

            return View(VM);
        }

        //
        // POST: /Noticia/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, noticia Noticia, NoticiaViewModel VM)
        {
            try
            {
                var noticia = db.noticia.FirstOrDefault(p => p.idNoticia.Equals(id) && p.estado == true);
                if (noticia != null)
                {
                    VM = new NoticiaViewModel
                    {
                        Noticia = noticia,
                    };
                    VM.Noticia.titulo = Noticia.titulo;
                    VM.Noticia.tiponoticia = Noticia.tiponoticia;
                    VM.Noticia.TipoNoticia_idTipoNoticia = Noticia.TipoNoticia_idTipoNoticia;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel
                    {
                        mensaje = "La noticia se encuentra eliminada actualmente o no existe"
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
        // GET: /Noticia/Delete/5
 
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
            var noticia = db.noticia.First(p => p.idNoticia.Equals(id));
            if (!noticia.estado)
            {
                ErrorModel error = new ErrorModel { mensaje = "La noticia ya fue eliminada" };
                return View("Error", error);
            }
            return View(noticia);
        }

        //
        // POST: /Noticia/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var noticia = db.noticia.First(p => p.idNoticia.Equals(id));
                noticia.estado = false;
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

            var Noticia = db.noticia.FirstOrDefault(e => e.idNoticia.Equals(id));
            var h = new HtmlString(HttpUtility.HtmlDecode(Noticia.contenido));
            Noticia.contenido = h.ToString();
            return View(Noticia);
        }

        [HttpPost]
        public ActionResult agregarContenido(int id, noticia Noticia)
        {
            var noticia = db.noticia.FirstOrDefault(e => e.idNoticia.Equals(id));
            if (noticia != null)
            {
                noticia.contenido = Noticia.contenido;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Otro usuario elimino la noticia durante la operacion"
                };
                return View("Error", error);
            }
        }

        public ActionResult agregarImagenPrincipal(int id)
        {
            var Noticia = db.noticia.FirstOrDefault(e => e.idNoticia.Equals(id));
            var h = new HtmlString(HttpUtility.HtmlDecode(Noticia.contenido));
            Noticia.imagenPrincipal = h.ToString();
            return View(Noticia);
        }

        [HttpPost]
        public ActionResult agregarImagenPrincipal(int id, noticia Noticia)
        {
            try
            {
                var noticia = db.noticia.First(d => d.idNoticia.Equals(id) && d.estado == true);
                if (noticia != null)
                {
                    noticia.imagenPrincipal = Noticia.imagenPrincipal;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel
                    {
                        mensaje = "Otro usuario elimino la noticia durante la operacion"
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

        public ActionResult verMultimedia(int id)
        {
            var noticia = db.noticia.First(p => p.idNoticia.Equals(id) && p.imagenPrincipal != null);
            return View(noticia);
        }


        [HttpPost]
        public ActionResult Search(String tipo, String autor)
        {

            var noticias = db.noticia.Where<noticia>(r => (r.tiponoticia.nombre.Equals(tipo) || r.usuario.apellido.Equals(autor) || r.usuario.identificacion.Equals(autor)) && r.estado == true);
            return View("SearchIndex", noticias.ToList());
        }


        public ActionResult SearchIndex(List<noticia> list)
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
