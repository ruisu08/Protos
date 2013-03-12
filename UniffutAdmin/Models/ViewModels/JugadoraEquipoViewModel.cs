using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniffutAdmin.Models.ViewModels
{
    public class JugadoraEquipoViewModel
    {
        public List<equipo> Equipos { get; set; }
        public jugadora Jugadora { get; set; }
    }
}