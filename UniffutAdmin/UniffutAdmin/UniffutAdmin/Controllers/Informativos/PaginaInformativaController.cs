using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
namespace UniffutAdmin.Controllers.Informativos
{
    public class PaginaInformativaController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /PaginaInformativa/

        public ActionResult Index()
        {
            var paginas = db.pagina_informativa.Where<pagina_informativa>(r => r.estado == true);
            return View(paginas.ToList());
        }

        //
        // GET: /PaginaInformativa/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /PaginaInformativa/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /PaginaInformativa/Create

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
        // GET: /PaginaInformativa/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /PaginaInformativa/Edit/5

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
        // GET: /PaginaInformativa/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /PaginaInformativa/Delete/5

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
