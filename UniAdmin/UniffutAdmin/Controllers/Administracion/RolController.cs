using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;

namespace UniffutAdmin.Controllers.Administracion
{
    public class RolController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Rol/

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
            else {
                bool autorizado = false;
                int idUser = (int)Session["userID"];
                var usuario = db.usuario.FirstOrDefault(u => u.idUsuario.Equals(idUser));
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod=>mod.idModulo.Equals(1))) {
                    if (m.idModulo == 1) {
                        autorizado = true;
                    }
                }
                if (!autorizado) {
                    ErrorModel error = new ErrorModel
                    {
                        mensaje = "No tienes permisos para acceder a esta página"
                    };
                    return View("Error", error);
                }
            }
            var roles = db.rol.Where<rol>(r => r.estado == true);
            return View(roles.ToList());
        }

        //
        // GET: /Rol/Details/5

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
                foreach (var m in usuario.rol.modulo)
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
            var rol = db.rol.First(r => r.idRol.Equals(id));
            return View(rol);
        }

        //
        // GET: /Rol/Create

        public ActionResult Create()
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
                foreach (var m in usuario.rol.modulo)
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
            return View();
        } 

        //
        // POST: /Rol/Create

        [HttpPost]
        public ActionResult Create(rol Rol)
        {
            try
            {
                Rol.nombre = Rol.nombre.ToUpper();
                var oldRol = db.rol.FirstOrDefault(e => e.nombre == Rol.nombre);
                if (oldRol != null)
                {
                    oldRol.nombre = Rol.nombre;
                    oldRol.descripcion = Rol.descripcion;
                    oldRol.estado = true;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                 }
                
                Rol.estado = true;
                db.rol.AddObject(Rol);
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
        // GET: /Rol/Edit/5
 
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
                foreach (var m in usuario.rol.modulo)
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
            var rol = db.rol.First(r => r.idRol.Equals(id));
            return View(rol);
        }

        //
        // POST: /Rol/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, rol rRol)
        {
            try
            {
                var rol = db.rol.FirstOrDefault(e => e.idRol.Equals(id) && e.estado == true);
                if (rol != null)
                {
                    rol.nombre = rRol.nombre;
                    rol.descripcion = rRol.descripcion;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje = "Otro usuario elimino el rol durante la operacion"};
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
        // GET: /Rol/Delete/5
 
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
                foreach (var m in usuario.rol.modulo)
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
            var rol = db.rol.First(r => r.idRol.Equals(id));
            if (!rol.estado)
            {
                ErrorModel error = new ErrorModel { mensaje = "El rol ya fue eliminado"};
                return View("Error", error);
            }
            return View(rol);
        }

        //
        // POST: /Rol/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, rol Rol)
        {
            try
            {
                Rol = db.rol.FirstOrDefault(r => r.idRol.Equals(id) && r.estado == true);
                if (Rol != null)
                {
                    Rol.estado = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje ="El rol ya fue eliminado"};
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

        public ActionResult asignarModulosARol(int id) {
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
                foreach (var m in usuario.rol.modulo)
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
            var rol = db.rol.First(r => r.idRol.Equals(id));
            var viewModel = new RolModuloViewModel
            {
                Rol = rol,
                Modulos = db.modulo.ToList()
                
            };
            return View(viewModel);
        
        }
        [HttpPost]
        public ActionResult asignarModulosARol(int id, RolModuloViewModel viewModel) {
            try
            {
                var rol = db.rol.FirstOrDefault(e => e.idRol.Equals(id) && e.estado == true);
                if (rol != null)
                {
                    var modulo = db.modulo.First(m => m.idModulo.Equals(viewModel.ModuloEspecifico.idModulo));
                    rol.modulo.Add(modulo);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje = "Otro usuario elimino el rol durante la operacion" };
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
    }
}
