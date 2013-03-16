<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles Noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div id="detallesTitulo">
        <h1>Detalles de la noticia:</h1>
        <h2><%:" "+Model.titulo%></h2>
    </div>
    <div id="detallesWrapper">
        <div class="nombrePropiedadDetalle"><h3>ID (en la base de datos)</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.idNoticia %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Fecha</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fecha %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Autor</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.usuario.identificacion %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Tipo de noticia</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.tiponoticia.nombre%></h4></div>
    </div>
    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver a la Lista", "Index") %></h3>
     </div>

</asp:Content>

