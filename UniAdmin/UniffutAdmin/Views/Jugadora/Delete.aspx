<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.jugadora>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar Jugadora</h1>
        <h3>Solo pasara a inactivo</h3>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","Jugadora")%>' method="post">
        
        <div id="detallesWrapper">

        <div class="nombrePropiedadDetalle"><h3>ID (en la base de datos)</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.idJugadora %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Identificacion</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.identificacion %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Nombre</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Apellidos</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.apellidos %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Fecha de Nacimiento</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fechaNacimiento %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Nacionalidad</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nacionalidad %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Equipo al que pertenece</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.equipo.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Estado</h3></div>
        <div class="propiedadDetalle"><h4><%: (bool)Model.estado ? "Activo":"Inactivo" %></h4></div>
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" />
        </div>
    </form>

</asp:Content>

