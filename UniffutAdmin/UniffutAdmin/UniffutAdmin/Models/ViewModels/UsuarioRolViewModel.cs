using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniffutAdmin.Models.ViewModels
{
    public class UsuarioRolViewModel
    {
        public usuario Usuario { get; set; }
        public List<rol> Roles { get; set; }
    }
}