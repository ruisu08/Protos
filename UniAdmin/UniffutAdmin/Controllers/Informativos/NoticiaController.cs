﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniffutAdmin.Models;
using UniffutAdmin.Models.ViewModels;
namespace UniffutAdmin.Controllers
{
    public class NoticiaController : Controller
    {
        private static uniffutData db = new uniffutData();
        //
        // GET: /Noticia/

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
            var noticias = db.noticia.Where<noticia>(r => r.estado == true);
            return View(db.noticia.ToList());
        }

        //
        // GET: /Noticia/Details/5

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
            var noticia = db.noticia.First(p => p.idNoticia.Equals(id));
            return View(noticia);
        }

        //
        // GET: /Noticia/Create

        public ActionResult Create(noticia Noticia)
        {
            if (Session["userID"] == null)
            {
                ErrorModel error = new ErrorModel
                {
                    mensaje = "Debes iniciar sesion para acceder a esta pagina"
                };
                return View("Error", error);
            }
            var viewModel = new NoticiaViewModel { 
                Noticia = Noticia,
                Usuarios = db.usuario.ToList(),
                Tipos = db.tiponoticia.ToList()  
            };
            return View(viewModel);
        } 

        //
        // POST: /Noticia/Create

        [HttpPost]
        public ActionResult Create(noticia Noticia, NoticiaViewModel viewModel)
        {
            try
            {
                viewModel.Usuarios = db.usuario.ToList();
                viewModel.Noticia = Noticia;
                viewModel.Noticia.estado = true;
                viewModel.Tipos = db.tiponoticia.ToList();
                db.noticia.AddObject(viewModel.Noticia);
                db.SaveChanges();
                return RedirectToAction("Index");
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
        
        //
        // GET: /Noticia/Edit/5
 
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
            var noticia = db.noticia.First(p => p.idNoticia.Equals(id));
            var VM = new NoticiaViewModel
            {
                Noticia = noticia,
                Usuarios = db.usuario.ToList(),
                Tipos = db.tiponoticia.ToList()
            };

            return View(VM);
        }

        //
        // POST: /Noticia/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, noticia Noticia, NoticiaViewModel VM)
        {
            try
            {
                var noticia = db.noticia.First(p => p.idNoticia.Equals(id));
                VM = new NoticiaViewModel
                {   Noticia = noticia,
                    Usuarios = db.usuario.ToList()
                };
                VM.Noticia.autor = Noticia.autor;
                VM.Noticia.contenido = Noticia.contenido;
                VM.Noticia.fecha = Noticia.fecha;
                VM.Noticia.TipoNoticia_idTipoNoticia = Noticia.TipoNoticia_idTipoNoticia;
                VM.Noticia.titulo = Noticia.titulo;
                db.SaveChanges();
 
                return RedirectToAction("Index");
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

        //
        // GET: /Noticia/Delete/5
 
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
            var noticia = db.noticia.First(p => p.idNoticia.Equals(id));
            return View(noticia);
        }

        //
        // POST: /Noticia/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var noticia = db.noticia.First(p => p.idNoticia.Equals(id));
                noticia.estado = false;
                db.SaveChanges();
                return RedirectToAction("Index");
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
    }
}