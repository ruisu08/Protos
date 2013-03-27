<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.partido>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar partido
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar Partido</h1>
        <h2><%:" "+Model.equipo.nombre +" VS "+Model.equipo1.nombre%></h2>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","Partido")%>' method="post">
        
        <div id="detallesWrapper">
        <div class="nombrePropiedadDetalle"><h3>Fecha</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fecha %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Hora</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.hora %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Estadio</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.estadio %></h4></div>
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" data-confirm= "Esta seguro que desea eliminar este partido?" />
        </div>
    </form>
    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index", new { id = Model.idCampeonato })%></h3>
     </div>

</asp:Content>
