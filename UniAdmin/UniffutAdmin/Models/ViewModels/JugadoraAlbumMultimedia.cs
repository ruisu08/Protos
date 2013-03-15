using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniffutAdmin.Models.ViewModels
{
    public class JugadoraAlbumMultimedia
    {
        public jugadora jugadora { get; set; }
        public album_jugadora album { get; set; }
        public List<album_jugadora> albumes { get; set; }
        public multimedia Multimedia { get; set; }
    }
}