using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UniffutAdmin.Controllers.Multimedia
{
    public class MultimediaJugadoraController : Controller
    {
        //
        // GET: /MultimediaJugadora/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /MultimediaJugadora/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /MultimediaJugadora/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /MultimediaJugadora/Create

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
        // GET: /MultimediaJugadora/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /MultimediaJugadora/Edit/5

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
        // GET: /MultimediaJugadora/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /MultimediaJugadora/Delete/5

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
