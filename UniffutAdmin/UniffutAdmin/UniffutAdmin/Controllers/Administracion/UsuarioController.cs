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
            var usuarios = db.usuario.Where<usuario>(r => r.estado == true);
            return View(usuarios.ToList());
        }

        //
        // GET: /Usuario/Details/5

        public ActionResult Details(int id)
        {
            var u = db.usuario.First(s => s.idUsuario.Equals(id));
            return View(u);
        }

        //
        // GET: /Usuario/Create

        public ActionResult Create(usuario Usuario)
        {
            var viewModel = new UsuarioRolViewModel
            {
                Roles = db.rol.ToList(),
                Usuario = Usuario
            };
            return View(viewModel);
        } 

        //
        // POST: /Usuario/Create

        [HttpPost]
        public ActionResult Create(usuario Usuario, UsuarioRolViewModel viewModel)
        {
            try
            {
                // TODO: Add insert logic here
                viewModel.Roles = db.rol.ToList();
                viewModel.Usuario = Usuario;
                viewModel.Usuario.estado = true;
                db.usuario.AddObject(viewModel.Usuario);
                db.SaveChanges();
                return RedirectToAction("Index");
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
            var u = db.usuario.First(s => s.idUsuario.Equals(id));
            var viewModel = new UsuarioRolViewModel
            {
                Roles = db.rol.ToList(),
                Usuario = u
            };
            return View(viewModel);
        }

        //
        // POST: /Usuario/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, usuario Usuario, UsuarioRolViewModel viewModel)
        {
            try
            {
                // TODO: Add update logic here
                var u = db.usuario.First(s => s.idUsuario.Equals(id));
                viewModel.Usuario = u;
                viewModel.Roles = db.rol.ToList();
                viewModel.Usuario.apellido = Usuario.apellido;
                viewModel.Usuario.nombre = Usuario.nombre;
                viewModel.Usuario.correo = Usuario.correo;
                viewModel.Usuario.estado = Usuario.estado;
                viewModel.Usuario.password = Usuario.password;
                viewModel.Usuario.telefono = Usuario.telefono;
                db.SaveChanges();
                return RedirectToAction("Index");
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
            var u = db.usuario.First(s => s.idUsuario.Equals(id));
            return View(u);
        }

        //
        // POST: /Usuario/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, usuario Usuario){
            try
            {
                // TODO: Add delete logic here
                var u = db.usuario.First(s => s.idUsuario.Equals(id));
                u.estado = false;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel { mensaje = e.Message };
                return View("Error", error);
            }
        }
    }
}
