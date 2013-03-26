using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UniffutAdmin.Controllers.Informativos
{
    public class LiveYourGoalsController : Controller
    {
        //
        // GET: /LiveYourGoals/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /LiveYourGoals/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /LiveYourGoals/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /LiveYourGoals/Create

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
        // GET: /LiveYourGoals/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /LiveYourGoals/Edit/5

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
        // GET: /LiveYourGoals/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /LiveYourGoals/Delete/5

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
