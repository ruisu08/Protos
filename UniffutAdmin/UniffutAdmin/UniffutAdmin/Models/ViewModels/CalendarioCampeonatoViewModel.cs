using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniffutAdmin.Models.ViewModels
{
    public class CalendarioCampeonatoViewModel
    {
        public calendario Calendario { get; set; }
        public List<campeonato> Campeonato { get; set; }
    }
}