 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;

namespace UniffutAdmin.Controllers
{
    public class UsuarioController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Usuario/

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
            else {


                bool autorizado = false;
                int idUser = (int)Session["userID"];
                var usuario = db.usuario.FirstOrDefault(u => u.idUsuario.Equals(idUser));
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(1)))
                {
                    if (m.idModulo == 1 && usuario.rol.estado == true)
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
            var usuarios = db.usuario.Where<usuario>(r => r.estado == true);
            return View(usuarios.ToList());
        }

        //
        // GET: /Usuario/Details/5

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
            else {

                bool autorizado = false;
                int idUser = (int)Session["userID"];
                var usuario = db.usuario.FirstOrDefault(u => u.idUsuario.Equals(idUser));
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(1)))
                {
                    if (m.idModulo == 1 && usuario.rol.estado == true)
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
            var usu = db.usuario.First(s => s.idUsuario.Equals(id));
            return View(usu);
        }

        //
        // GET: /Usuario/Create

        public ActionResult Create(usuario Usuario)
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
                    if (m.idModulo == 1 && usuario.rol.estado == true)
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
            var viewModel = new UsuarioRolViewModel
            {
                Roles = db.rol.Where<rol>(d => d.estado == true).ToList(),
                Usuario = Usuario
            };
            if (viewModel.Roles.Count <= 0)
            {
                ErrorModel error = new ErrorModel();                
                error.mensaje = "No existen roles, debe crear el rol para este usuario.";
                return View("Error", error);
            }
            return View(viewModel);
        } 

        //
        // POST: /Usuario/Create

        [HttpPost]
        public ActionResult Create(usuario Usuario, UsuarioRolViewModel viewModel)
        {
            try
            {
                if (db.rol.First(d => d.idRol.Equals(Usuario.Rol_idRol)).estado != false)
                {

                    viewModel.Usuario = Usuario;
                    viewModel.Usuario.estado = true;
                    db.usuario.AddObject(viewModel.Usuario);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel();
                    error.mensaje = "Otro usuario elimino el rol durante la operacion";
                    return View("Error", error);
                }
            }
            catch(Exception e)
            {
                ErrorModel error = new ErrorModel {mensaje = e.Message};
                return View("Error",error);
            }
        }
        
        //
        // GET: /Usuario/Edit/5
 
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(1)))
                {
                    if (m.idModulo == 1 && usuario.rol.estado == true)
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
            var usu = db.usuario.First(s => s.idUsuario.Equals(id));
            var viewModel = new UsuarioRolViewModel
            {
                Roles = db.rol.Where<rol>(d => d.estado == true).ToList(),
                Usuario = usu
            };
            if (viewModel.Roles.Count <= 0)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = "No existen roles, otro usuario elimino los roles durante la operacion";
                return View("Error", error);
            }
            return View(viewModel);
        }

        //
        // POST: /Usuario/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, usuario Usuario, UsuarioRolViewModel viewModel)
        {
            try
            {

                if (db.rol.First(d => d.idRol.Equals(Usuario.Rol_idRol)).estado != false)
                {
                    var usuario = db.usuario.FirstOrDefault(r => r.idUsuario.Equals(id) && r.estado == true);
                    if (usuario != null)
                    {
                        viewModel = new UsuarioRolViewModel
                        {
                            Usuario = usuario,
                            Roles = db.rol.ToList()
                        };

                        viewModel.Usuario.nombre = Usuario.nombre;
                        viewModel.Usuario.apellido = Usuario.apellido;
                        viewModel.Usuario.telefono = Usuario.telefono;
                        viewModel.Usuario.correo = Usuario.correo;
                        viewModel.Usuario.password = Usuario.password;
                        viewModel.Usuario.identificacion = Usuario.identificacion;
                        viewModel.Usuario.estado = Usuario.estado;
                        viewModel.Usuario.Rol_idRol = Usuario.Rol_idRol;
                        db.SaveChanges();
                        return RedirectToAction("Index");

                    }
                    else
                    {
                        ErrorModel error = new ErrorModel()
                        {
                            mensaje = "Otro usuario elimino el Usuario durante la operacion"
                        };
                        return View("Error", error);
                    }
                }
                else
                {
                    ErrorModel error = new ErrorModel
                    {
                        mensaje = "Otro usuario elimino el rol durante la operacion"
                    };
                    return View("Error", error);
                }
            }
            catch(Exception e)
            
            {
                ErrorModel error = new ErrorModel { mensaje = e.Message };
                return View("Error", error);
            }
        }

        //
        // GET: /Usuario/Delete/5
 
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(1)))
                {
                    if (m.idModulo == 1 && usuario.rol.estado == true)
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
            var usu = db.usuario.First(s => s.idUsuario.Equals(id));
            if (!usu.estado)
            {
                ErrorModel error = new ErrorModel { mensaje = "El usuario ya fue eliminado" };
                return View("Error", error);
            }
            return View(usu);
        }

        //
        // POST: /Usuario/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, usuario Usuario){
            try
            {

                Usuario = db.usuario.FirstOrDefault(p => p.idUsuario.Equals(id) && p.estado == true);
                if (Usuario != null)
                {
                    Usuario.estado = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje = "El Usuario ya fue eliminado" };
                    return View("Error", error);
                }
               
            }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel { mensaje = e.Message };
                return View("Error", error);
            }
        }


        [HttpPost]
        public ActionResult Search(String Apellido, String ID, String Rol) {
            var usuarios = db.usuario.Where<usuario>(r => (r.apellido.Equals(Apellido) || r.identificacion.Equals(ID) || r.rol.nombre.Equals(Rol)) && r.estado == true);
            return View("SearchIndex", usuarios.ToList());
        }


        public ActionResult SearchIndex(List<usuario> list)
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
                    if (m.idModulo == 1 && usuario.rol.estado == true)
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
