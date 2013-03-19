<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles de usuario
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="detallesTitulo">
        <h1>Detalles del usuario:</h1>
        <h2><%:" "+Model.identificacion%></h2>
    </div>
    <div id="detallesWrapper">
        <div class="nombrePropiedadDetalle"><h3>Nombre</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Apellidos</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.apellido %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Teléfono</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.telefono %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Correo</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.correo %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Rol</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.rol.nombre %></h4></div>
    </div>
    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver a la lista", "Index") %></h3>
     </div>

</asp:Content>

