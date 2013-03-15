using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniffutAdmin.Models.ViewModels
{
    public class EquipoAlbumMultimedia
    {
        public equipo Equipo { get; set; }
        public album_equipo Album { get; set; }
        public List<album_equipo> Albumes { get; set; }
        public multimedia Multimedia { get; set; }
    }
}