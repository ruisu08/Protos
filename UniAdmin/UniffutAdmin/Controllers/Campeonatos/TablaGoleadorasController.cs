using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UniffutAdmin.Controllers.Campeonatos
{
    public class TablaGoleadorasController : Controller
    {
        //
        // GET: /TablaGoleadoras/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /TablaGoleadoras/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /TablaGoleadoras/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /TablaGoleadoras/Create

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
        // GET: /TablaGoleadoras/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /TablaGoleadoras/Edit/5

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
        // GET: /TablaGoleadoras/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /TablaGoleadoras/Delete/5

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
