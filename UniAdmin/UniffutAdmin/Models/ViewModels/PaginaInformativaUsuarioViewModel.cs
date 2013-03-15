using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniffutAdmin.Models.ViewModels
{
    public class PaginaInformativaUsuarioViewModel
    {
        public List<usuario> Usuario { get; set; }
        public pagina_informativa Pagina { get; set; }
    }
}