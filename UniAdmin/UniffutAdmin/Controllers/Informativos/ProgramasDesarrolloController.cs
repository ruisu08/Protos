using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UniffutAdmin.Controllers.Informativos
{
    public class ProgramasDesarrolloController : Controller
    {
        //
        // GET: /ProgramasDesarrollo/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /ProgramasDesarrollo/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /ProgramasDesarrollo/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /ProgramasDesarrollo/Create

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
        // GET: /ProgramasDesarrollo/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /ProgramasDesarrollo/Edit/5

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
        // GET: /ProgramasDesarrollo/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /ProgramasDesarrollo/Delete/5

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
