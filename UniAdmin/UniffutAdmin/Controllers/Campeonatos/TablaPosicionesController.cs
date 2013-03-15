using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;

namespace UniffutAdmin.Controllers.Campeonatos
{
    public class TablaPosicionesController : Controller
    {
        //
        // GET: /TablaPosiciones/
        private static uniffutData db = new uniffutData();

        public ActionResult Index(int id)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
            }
            else
            {
                bool autorizado = false;
                int idUser = (int)Session["userID"];
                var usuario = db.usuario.FirstOrDefault(u => u.idUsuario.Equals(idUser));
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(2)))
                {
                    if (m.idModulo == 2)
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
            var posisiones = db.equipo_has_campeonato.Where<equipo_has_campeonato>(r => r.estado == true && r.Campeonato_idCampeonato.Equals(id));
            return View(posisiones.ToList());
        }

        //
        // GET: /TablaPosiciones/Edit/5
 
        public ActionResult Edit(int id)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
            }
            else
            {
                bool autorizado = false;
                int idUser = (int)Session["userID"];
                var usuario = db.usuario.FirstOrDefault(u => u.idUsuario.Equals(idUser));
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(2)))
                {
                    if (m.idModulo == 2)
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
            var tabla = db.equipo_has_campeonato.First(r => r.Equipo_idEquipo.Equals(id));
            var viewModel = new TablaPosicionesEquipoViewModel
            {
                equipos = db.equipo.ToList(),
                campeonatos = db.campeonato.ToList(),
                tablaPosiciones = tabla
            };
            return View(viewModel);
        }

        //
        // POST: /TablaPosiciones/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, equipo_has_campeonato tablaPosiciones, TablaPosicionesEquipoViewModel viewModel)
        {
            
            try
            {
                var tablaPos = db.equipo_has_campeonato.First(r => r.Equipo_idEquipo.Equals(id));
                viewModel = new TablaPosicionesEquipoViewModel 
                {
                
                    tablaPosiciones = tablaPos,
                    campeonatos = db.campeonato.ToList(),
                    equipos = db.equipo.ToList()
                };

                viewModel.tablaPosiciones.puntos = tablaPosiciones.puntos;                            
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch(Exception e)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = e.Message;
                return View("Error", error);
            }
        }
    }
}
