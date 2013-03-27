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
    public class PartidoController : Controller
    {
        private uniffutData db = new uniffutData();
        //
        // GET: /Partido/

        public ActionResult Index(int id)
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
            var partidos = db.partido.Where<partido>(r => r.estado == true && r.idCampeonato.Equals(id));
            return View(partidos.ToList());
        }



        //
        // GET: /Partido/Create

        public ActionResult Create(int id, partido Partido)
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

            var camp = db.campeonato.FirstOrDefault(j => j.idCampeonato.Equals(id));
            Partido.campeonato = camp;
            Partido.idCampeonato = camp.idCampeonato;
            return View(Partido);
        } 

        //
        // POST: /Partido/Create

        [HttpPost]
        public ActionResult Create(int id, partido Partido,FormCollection form)
        {
            try
            {
                var campeonato = db.campeonato.First(d => d.idCampeonato.Equals(id));
                if (campeonato.estado != false)
                {
                    Partido.campeonato = campeonato;
                    Partido.idCampeonato = campeonato.idCampeonato;
                    Partido.estado = true;
                    Partido.golesEquipoUno = 0;
                    Partido.golesEquipoDos = 0;
                    db.partido.AddObject(Partido);
                    db.SaveChanges();
                    return RedirectToAction("Index", new RouteValueDictionary(new { controller = "Partido", action = "Index", id = id }));
                }
                else
                {
                    ErrorModel error = new ErrorModel();
                    error.mensaje = "Otro usuario elimino el campeonato durante la operación";
                    return View("Error", error);
                }
            }
            catch
            {
                return View();
            }
        }


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
            var partido = db.partido.First(a => a.idpartido.Equals(id));
            return View(partido);
        }
        //
        // GET: /Partido/Edit/5
 
        public ActionResult Edit(int id)
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
            var partido = db.partido.First(a => a.idpartido.Equals(id));
            return View(partido);
        }

        //
        // POST: /Partido/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, partido Partido)
        {
            try
            {
                // TODO: Add update logic here
                var par = db.partido.FirstOrDefault(t => t.idpartido.Equals(id));
                par.equipoUno = Partido.equipoUno;
                par.equipo = Partido.equipo;
                par.equipoDos = Partido.equipoDos;
                par.equipo1 = Partido.equipo1;
                par.fecha = Partido.fecha;
                par.hora = Partido.hora;
                par.estadio = Partido.estadio;
                db.SaveChanges();
                return RedirectToAction("Index", new RouteValueDictionary(new { controller = "TablaPosiciones", action = "Index", id = par.idCampeonato}));
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Partido/Delete/5
 
        public ActionResult Delete(int id)
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
            var partido= db.partido.First(p => p.idpartido.Equals(id));
            if (!partido.estado)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "No existen campeonatos"
                };
                return View("Error", error);
            }

            return View(partido);
        }

        //
        // POST: /Partido/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var partido = db.partido.FirstOrDefault(p => p.idpartido.Equals(id) && p.estado == true);
                if (partido != null)
                {
                    partido.estado = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ErrorModel error = new ErrorModel { mensaje = "El campeonato ya fue eliminado" };
                    return View("Error", error);
                }
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




        [HttpPost]
        public ActionResult Search(String equipoUno, String equipoDos)
        {
            var partidos = db.partido.Where<partido>(r => (r.equipo.nombre.Equals(equipoUno) || r.equipo1.nombre.Equals(equipoDos)) && r.estado == true);
            return View("SearchIndex", partidos.ToList());
        }


        public ActionResult SearchIndex(List<partido> list)
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
                foreach (var m in usuario.rol.modulo.Where<modulo>(mod => mod.idModulo.Equals(1)))
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

            return View(list);
        }
    }
}
