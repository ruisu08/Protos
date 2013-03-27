<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.partido>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="detallesTitulo">
        <h1>Detalles del partido:</h1>
        <h2><%:" "+Model.equipo.nombre +" VS "+Model.equipo1.nombre%></h2>
    </div>
    <div id="detallesWrapper">
        <div class="nombrePropiedadDetalle"><h3>Fecha</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fecha %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Hora</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.hora %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Estadio</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.estadio %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Goles de <%:" "+Model.equipo.nombre %></h3></div>
        <div class="propiedadDetalle"><h4><%: Model.golesEquipoUno %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Goles de <%:" "+Model.equipo1.nombre %></h3></div>
        <div class="propiedadDetalle"><h4><%: Model.golesEquipoDos %></h4></div>
    </div>
    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index", new { id = Model.idCampeonato })%></h3>
     </div>

</asp:Content>
