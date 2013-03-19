<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.multimedia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Multimedia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div id="headerContenido">
        <div id="tituloContenido">
        <h1>Multimedia</h1>
        <h6 id="descripcionController">Aqui veras las fotos y videos que estan en el album</h6>
        </div>

        <div id="busqueda">
            <form id="validateForm" action= '<%:Url.Action("Search","Equipo")%>' method="post">
                <p>Buscar por nombre</p>
                <input type="text" name="identificacion" />
                <input type="submit" value="buscar" id="opcionCrud"/>
            </form>
        </div>
    </div>

     <div>
    <h2>Multimedia en album :</h2>
    <% if (Model.FirstOrDefault() != null)
       { %>
    <h3 id="crearLink"><%:Html.ActionLink("Agregar multimedia", "Create", new { id = Model.First().album_equipo.First().idAlbum_Equipo })%></h3>
    <%} %>
    </div>
    <div class="thumbnails yoxview">
    
    <%foreach (var m in Model)
      { %>
      <div class="OrdenAlbum">
           <a class="imagenAlbum">
            <%:new HtmlString (HttpUtility.HtmlDecode(m.fuenteGrafica))%>
           </a>
           <div class="opcionBorrarMult">
              <%: Html.ActionLink("Eliminar", "Delete", new { id=m.idMultimedia}) %>
           </div>
        </div>
    <%} %>
    </div>
</asp:Content>
