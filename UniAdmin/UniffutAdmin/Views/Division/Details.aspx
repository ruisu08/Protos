<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.division>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

       <div id="detallesTitulo">
        <h1>Detalles de la división:</h1>
        <h2><%:" "+Model.nombre%></h2>
    </div>
    <div id="detallesWrapper">
        <div class="nombrePropiedadDetalle"><h3>Abreviatura</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.abreviatura %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Descripción</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.descripcion %></h4></div>
    </div>
    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver a la lista", "Index") %></h3>
     </div>

</asp:Content>

