<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.rol>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles de rol
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="detallesTitulo">
        <h1>Detalles del Rol:</h1>
        <h2><%:" "+Model.nombre%></h2>
    </div>
    <div id="detallesWrapper">
        <div>
        <div class="nombrePropiedadDetalle"><h3>ID (en la base de datos)</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.idRol %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Nombre</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Descripción</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.descripcion %></h4></div>
        <div  class="nombrePropiedadDetalle"><h3>Modulos</h3></div>
        <%foreach(var a in Model.modulo.ToList()) {%>
        <div class="propiedadDetalle"><h4><%:a.nombre%></h4></div>    
        <% }%>
        </div>
    </div>
    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver a la lista", "Index") %></h3>
     </div>
</asp:Content>
