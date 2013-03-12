using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniffutAdmin.Models.ViewModels
{
    public class TablaPosicionesEquipoViewModel
    {
        public equipo_has_campeonato tablaPosiciones { get; set; }
        public List<equipo> equipos { get; set; }
        public List<campeonato> campeonatos { get; set; }
    }
}