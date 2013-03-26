using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniffutAdmin.Models.ViewModels
{
    public class NoticiaViewModel
    {
        public noticia Noticia { get; set; }
        public List<tiponoticia> Tipos { get; set; }

    }
}