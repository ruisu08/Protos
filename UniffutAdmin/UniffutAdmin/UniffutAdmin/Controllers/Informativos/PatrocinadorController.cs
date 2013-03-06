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
            var patrocinadores = db.patrocinador.Where<patrocinador>(r => r.estado == true);
            return View(patrocinadores.ToList());
        }

        //
        // GET: /Patrocinador/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Patrocinador/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Patrocinador/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Patrocinador/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Patrocinador/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Patrocinador/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Patrocinador/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
