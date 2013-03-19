using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
using System.Web.Routing;

namespace UniffutAdmin.Controllers.Campeonatos
{
    public class TablaPosicionesController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /TablaPosiciones/



        //
        // GET: /TablaPosiciones/Details/5

        public ActionResult Details(int id)
        {
            var tabla = db.tabla_posiciones.First(t=>t.idCampeonato.Equals(id) && t.estado == true);
            return View(tabla);
        }




        
        //
        // GET: /TablaPosiciones/Edit/5
 
        public ActionResult Edit(int idEquipo, int idTabla)
        {
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.campeonato);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.division);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.equipo);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.tabla_posiciones);
            db.Refresh(System.Data.Objects.RefreshMode.StoreWins, db.tabla_equipo);

            var tablaE = db.tabla_equipo.FirstOrDefault(t => t.idEquipo.Equals(idEquipo) && t.idTabla.Equals(idTabla));
            return View(tablaE);
        }

        //
        // POST: /TablaPosiciones/Edit/5

        [HttpPost]
        public ActionResult Edit(int idEquipo, int idTabla, tabla_equipo Tabla)
        {
            try
            {
                // TODO: Add update logic here
                var tablaE = db.tabla_equipo.FirstOrDefault(t => t.idEquipo.Equals(idEquipo) && t.idTabla.Equals(idTabla));
                tablaE.puntos = Tabla.puntos;
                db.SaveChanges();
                return RedirectToAction("Details", new RouteValueDictionary(new { controller = "TablaPosiciones", action = "Details", id = tablaE.tabla_posiciones.campeonato.idCampeonato }));
            }
            catch
            {
                return View();
            }
        }



      
    }
}
