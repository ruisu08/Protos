using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniffutAdmin.Models.ViewModels
{
    public class CampeonatoDivisionViewModel
    {
        public campeonato Campeonato { get; set; }
        public List<division> Divisiones { get; set; }
    }
}