<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	verMultimedia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div id="detallesTitulo">
        <h1>Imagen Principal:</h1>
    </div>
    <div class="thumbnails yoxview">
      <div class="OrdenAlbum">
           <a class="imagenAlbum fancybox-media">
            <%:new HtmlString (HttpUtility.HtmlDecode(Model.imagenPrincipal))%>
           </a>            
        </div>
    </div>
    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver a la Lista", "Index") %></h3>
     </div>


</asp:Content>
