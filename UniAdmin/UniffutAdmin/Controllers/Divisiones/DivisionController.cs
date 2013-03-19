﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;

namespace UniffutAdmin.Controllers.Divisiones
{
    public class DivisionController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Division/

        public ActionResult Index()
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
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
            var divisiones = db.division.Where<division>(r => r.estado == true);
            return View(divisiones.ToList());
        }

        //
        // GET: /Division/Details/5

        public ActionResult Details(int id)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
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
            var division = db.division.First(p => p.idDivisiones.Equals(id));
            return View(division);
        }

        //
        // GET: /Division/Create

        public ActionResult Create()
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
            return View();
        } 

        //
        // POST: /Division/Create

        [HttpPost]
        public ActionResult Create(division Division)
        {
            try
            {
                // TODO: Add insert logic here
                Division.abreviatura = Division.abreviatura.ToUpper();
                var oldDivision = db.division.FirstOrDefault(j => j.abreviatura == Division.abreviatura);
                if (oldDivision != null)
                {
                    oldDivision.nombre = Division.nombre;
                    oldDivision.descripcion = Division.descripcion;
                    oldDivision.estado = true;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                Division.estado = true;
                db.division.AddObject(Division);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel { mensaje = e.Message };
                return View("Error", error);
            }
        }
        
        //
        // GET: /Division/Edit/5
 
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
            var division = db.division.First(p => p.idDivisiones.Equals(id));
            return View(division);
        }

        //
        // POST: /Division/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, division Divisiones)
        {
            try
            {
                // TODO: Add update logic here
                var division = db.division.FirstOrDefault(p => p.idDivisiones.Equals(id) && p.estado == true);
                if (division != null)
                {
                    division.abreviatura = Divisiones.abreviatura.ToUpper();
                    division.nombre = Divisiones.nombre;
                    division.descripcion = Divisiones.descripcion;
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
            catch(Exception e)
            {
                ErrorModel error = new ErrorModel { mensaje = e.Message };
                return View("Error", error);
            }
        }

        //
        // GET: /Division/Delete/5
 
        public ActionResult Delete(int id)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
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
            var Division = db.division.FirstOrDefault(p => p.idDivisiones.Equals(id));
            if (!Division.estado) {
                ErrorModel error = new ErrorModel { mensaje = "La division ya fue eliminada" };
                return View("Error", error);
            }
            
            return View(Division);
        }

        //
        // POST: /Division/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, division Division)
        {
            try
            {
                // TODO: Add delete logic here
                Division = db.division.FirstOrDefault(p => p.idDivisiones.Equals(id) && p.estado == true);

                if (Division != null)
                {
                    var CampeonatosEnDivision = Division.campeonato;
                    foreach (var x in CampeonatosEnDivision) {
                        
                        for (int i = 0; i < x.equipo.Count; )
                        {
                            var l = x.equipo.ToList();
                            var e = l[i];
                            x.equipo.Remove(e);
                            e.campeonato.Remove(x);
                        }
                        var tabla = db.tabla_posiciones.First(t => t.idCampeonato.Equals(x.idCampeonato));
                        for (int i = 0; i < tabla.tabla_equipo.Count; )
                        {
                            var l = tabla.tabla_equipo.ToList();
                            var t = l[i];
                            tabla.tabla_equipo.Remove(t);
                        }
                        db.DeleteObject(tabla);
                        x.estado = false;
                    }


                    var EquiposEnDivision = Division.equipo;
                    foreach (var x in EquiposEnDivision)
                    {

                        for (int i = 0; i < x.album_equipo.Count; )
                        {
                            var l = x.album_equipo.ToList();
                            var e = l[i];

                            for (int j = 0; j < e.multimedia.Count; )
                            {
                                var lm = e.multimedia.ToList();
                                var m = lm[j];
                                e.multimedia.Remove(m);
                            }
                        }
                        var JugadoraEnEquipo = x.jugadora;
                        foreach (var j in JugadoraEnEquipo)
                        {
                            for (int i = 0; i < j.album_jugadora.Count; )
                            {
                                var l = j.album_jugadora.ToList();
                                var e = l[i];

                                for (int k = 0; k < e.multimedia.Count; )
                                {
                                    var lm = e.multimedia.ToList();
                                    var m = lm[k];
                                    e.multimedia.Remove(m);
                                }
                            }
                            j.estado = false;
                        }

                        x.estado = false;
                    }


                    Division.estado = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                else{
                    ErrorModel error = new ErrorModel { mensaje = "La division ya fue eliminada" };
                    return View("Error", error);
                }
            }
            catch (Exception e)
            {
                ErrorModel error = new ErrorModel { mensaje = e.Message };
                return View("Error", error);
            }
        }

        [HttpPost]
        public ActionResult Search(String nombre)
        {
            var divisiones = db.division.Where<division>(r => r.nombre.Equals(nombre) && r.estado == true);
            return View("SearchIndex", divisiones.ToList());
        }


        public ActionResult SearchIndex(List<division> list)
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
