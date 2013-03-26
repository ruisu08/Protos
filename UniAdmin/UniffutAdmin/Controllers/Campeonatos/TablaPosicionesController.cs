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
        private uniffutData db = new uniffutData();
        //
        // GET: /TablaPosiciones/



        //
        // GET: /TablaPosiciones/Details/5

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
            else
            {
                bool autorizado = false;
                int idUser = (int)Session["userID"];
                var usuario = db.usuario.FirstOrDefault(u => u.idUsuario.Equals(idUser));
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(2)))
                {
                    if (m.idModulo == 2 && usuario.rol.estado == true)
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
            var tabla = db.tabla_posiciones.First(t=>t.idCampeonato.Equals(id) && t.estado == true);
            return View(tabla);
        }




        
        //
        // GET: /TablaPosiciones/Edit/5
 
        public ActionResult Edit(int idEquipo, int idTabla)
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(2)))
                {
                    if (m.idModulo == 2 && usuario.rol.estado == true)
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
