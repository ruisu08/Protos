using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
using System.Web.Routing;
namespace UniffutAdmin.Controllers
{
    public class EquipoController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Equipo/

        public ActionResult Index()
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("ErrorSesion", error);
            }
            else {
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
            var equipos = db.equipo.Where<equipo>(r => r.estado == true);
            return View(equipos.ToList());
        }

        //
        // GET: /Equipo/Details/5

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
            else {
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
            var equipo = db.equipo.First(p => p.idEquipo.Equals(id));
            return View(equipo);
        }

        //
        // GET: /Equipo/Create

        public ActionResult Create(equipo Equipo)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("ErrorSesion", error);
            }
            else {
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
            var viewModel = new EquipoDivisionesViewModel
            {
                equipo = Equipo,
                divisiones = db.division.Where<division>(d=> d.estado==true).ToList()
            };
            if (viewModel.divisiones.Count <= 0)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = "No existen divisiones, debe crear la division donde estara el equipo antes de crear el equipo";
                return View("Error", error);
            }
            return View(viewModel);
        } 

        //
        // POST: /Equipo/Create

        [HttpPost]
        public ActionResult Create(equipo Equipo, EquipoDivisionesViewModel viewModel)
        {
            try
            {
               if (db.division.First(d => d.idDivisiones.Equals(Equipo.idDivision)).estado != false)
                {
                    Equipo.abreviatura = Equipo.abreviatura.ToUpper();
                    var oldEquipo = db.equipo.FirstOrDefault(e => e.abreviatura == Equipo.abreviatura);
                    if (oldEquipo != null)
                    {
                        oldEquipo.abreviatura = Equipo.abreviatura;
                        oldEquipo.campeonatosGanados = Equipo.campeonatosGanados;
                        oldEquipo.idDivision = Equipo.idDivision;
                        //oldEquipo.historia = Equipo.historia;
                        oldEquipo.estado = true;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    viewModel.equipo = Equipo;
                    viewModel.equipo.estado = true;
                    var album = new album_equipo();
                    album.equipo = viewModel.equipo;
                    album.estado = true;
                    album.nombre = "Sin título";
                    /*viewModel.divisiones = db.division.ToList();*/
                    db.equipo.AddObject(viewModel.equipo);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else {
                    ErrorModel error = new ErrorModel();
                    error.mensaje = "Otro usuario elimino la division durante la operacion";
                    return View("Error", error);
                }
            }
            catch(Exception e)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = e.InnerException.ToString()
                };
                return View("Error", error);
            }
        }
        
        //
        // GET: /Equipo/Edit/5
 
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
            else {
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
            var Equipo = db.equipo.First(p => p.idEquipo.Equals(id));
            var viewModel = new EquipoDivisionesViewModel
            {
                equipo = Equipo,
                divisiones = db.division.Where<division>(d => d.estado == true).ToList()
            };
            if (viewModel.divisiones.Count <= 0)
            {
                ErrorModel error = new ErrorModel();
                error.mensaje = "No existen divisiones, otro usuario elimino las divisiones durante la operacion";
                return View("Error", error);
            }

            return View(viewModel);
        }

        //
        // POST: /Equipo/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, equipo equipo, EquipoDivisionesViewModel viewModel)
        {
            
            try
            {
                if (db.division.First(d => d.idDivisiones.Equals(equipo.idDivision)).estado != false)
                {
                    var Equipo = db.equipo.FirstOrDefault(r => r.idEquipo.Equals(id) && r.estado == true);
                    if (Equipo != null)
                    {
                        viewModel = new EquipoDivisionesViewModel
                        {
                            equipo = Equipo,
                            divisiones = db.division.Where(d=>d.estado == true).ToList()
                        };

                        viewModel.equipo.abreviatura = equipo.abreviatura.ToUpper();
                        viewModel.equipo.nombre = equipo.nombre;
                        viewModel.equipo.idDivision = equipo.idDivision;
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    else
                    {

                        ErrorModel error = new ErrorModel
                        {
                            mensaje = "Otro usuario elimino el equipo durante la operacion"
                        };
                        return View("Error", error);
                    }
                }
                else {
                    ErrorModel error = new ErrorModel
                    {
                        mensaje = "Otro usuario elimino la division durante la operacion"
                    };
                    return View("Error", error);
                }

            }
            catch(Exception e)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = e.InnerException.ToString()
                };
                return View("Error", error);
            }
        }

        //
        // GET: /Equipo/Delete/5
 
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
            var Equipo = db.equipo.First(p => p.idEquipo.Equals(id));
            if (!Equipo.estado)
            {
                ErrorModel error = new ErrorModel { mensaje = "El equipo ya fue eliminado" };
                return View("Error", error);
            }
            return View(Equipo);
        }

        //
        // POST: /Equipo/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, equipo Equipo)
        {
            try
            {
                // TODO: Add delete logic here
                Equipo = db.equipo.FirstOrDefault(p => p.idEquipo.Equals(id) && p.estado == true);
                if (Equipo != null)
                {

                    for (int i = 0; i < Equipo.campeonato.Count; )
                    {
                        var l = Equipo.campeonato.ToList();
                        var e = l[i];
                        var tabla = db.tabla_posiciones.First(t => t.idCampeonato.Equals(e.idCampeonato));
                        for (int j = 0; j < tabla.tabla_equipo.Count; )
                        {
                            var a = tabla.tabla_equipo.ToList();
                            var t = a[j];
                            tabla.tabla_equipo.Remove(t);
                        }
                        db.DeleteObject(tabla);
                        Equipo.campeonato.Remove(e);
                        e.equipo.Remove(Equipo);
                        e.estado = false;
                    }

                    for (int i = 0; i < Equipo.album_equipo.Count; ){
                        var l = Equipo.album_equipo.ToList();
                        var e = l[i];

                        for (int j = 0; j < e.multimedia.Count; )
                        {
                            var lm = e.multimedia.ToList();
                            var m = lm[j];
                            e.multimedia.Remove(m);
                        }
                    }
                    var JugadoraEnEquipo = Equipo.jugadora;
                    foreach (var x in JugadoraEnEquipo) {
                        for (int i = 0; i < x.album_jugadora.Count; )
                        {
                            var l = x.album_jugadora.ToList();
                            var e = l[i];

                            for (int j = 0; j < e.multimedia.Count; )
                            {
                                var lm = e.multimedia.ToList();
                                var m = lm[j];
                                e.multimedia.Remove(m);
                            }
                        }
                        x.estado = false;
                    }

                    Equipo.estado = false;


                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else {
                    ErrorModel error = new ErrorModel { mensaje = "El equipo ya fue eliminado" };
                    return View("Error", error);
                }
               
            }
            catch(Exception e)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = e.InnerException.ToString()
                };
                return View("Error", error);
            }
        }

        public ActionResult agregarHistoria(int id) {

            var Equipo = db.equipo.FirstOrDefault(e => e.idEquipo.Equals(id));
            var h = new HtmlString(HttpUtility.HtmlDecode(Equipo.historia));
            Equipo.historia = h.ToString();
            return View(Equipo);
        }

        [HttpPost]
        public ActionResult agregarHistoria(int id, equipo Equipo) {
            var equipo = db.equipo.FirstOrDefault(e => e.idEquipo.Equals(id));
            if (equipo != null)
            {
                equipo.historia = Equipo.historia;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Otro usuario elimino la division durante la operacion"
                };
                return View("Error", error);
            }
        }

        public ActionResult albumesMultimedia(int id) {
            return RedirectToAction("Index", new RouteValueDictionary(new { controller = "AlbumEquipo", action = "Index", id= id }));
       }

        [HttpPost]
        public ActionResult Search(String nombre, String division)
        {
            var equipos = db.equipo.Where<equipo>(r => (r.nombre.Equals(nombre) || r.division.nombre.Equals(division)) && r.estado == true);
            return View("SearchIndex", equipos.ToList());
        }


        public ActionResult SearchIndex(List<equipo> list)
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
                    if (m.idModulo == 1)
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
