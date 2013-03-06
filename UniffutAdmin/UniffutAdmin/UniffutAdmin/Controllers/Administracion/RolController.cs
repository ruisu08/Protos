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
            var roles = db.rol.Where<rol>(r => r.estado == true);
            return View(roles.ToList());
        }

        //
        // GET: /Rol/Details/5

        public ActionResult Details(int id)
        {
            var rol = db.rol.First(r => r.idRol.Equals(id));
            return View(rol);
        }

        //
        // GET: /Rol/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Rol/Create

        [HttpPost]
        public ActionResult Create(rol Rol)
        {
            try
            {
                // TODO: Add insert logic here
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
                return View("Error a la hora de crear el rol", error);
            }
        }
        
        //
        // GET: /Rol/Edit/5
 
        public ActionResult Edit(int id)
        {
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
                var rol = db.rol.First(r => r.idRol.Equals(id));
                // TODO: Add update logic here

                rol.descripcion = rRol.descripcion;
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
        // GET: /Rol/Delete/5
 
        public ActionResult Delete(int id)
        {
            var rol = db.rol.First(r => r.idRol.Equals(id));
            return View(rol);
        }

        //
        // POST: /Rol/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var rol = db.rol.First(r => r.idRol.Equals(id));
                // TODO: Add delete logic here
                rol.estado = false;
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
    }
}
