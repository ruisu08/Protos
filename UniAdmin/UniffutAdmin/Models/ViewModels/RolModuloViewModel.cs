using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniffutAdmin.Models.ViewModels
{
    public class RolModuloViewModel
    {
        public rol Rol { get; set; }
        public List<modulo> Modulos { get; set; }
        public modulo ModuloEspecifico { get; set; }
    }
}