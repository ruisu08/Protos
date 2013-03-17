<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.campeonato>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar Campeonato</h1>
        <h3>Solo pasara a inactivo</h3>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","Campeonato")%>' method="post">
        
        <div id="detallesWrapper">

        <div class="nombrePropiedadDetalle"><h3>ID (en la base de datos)</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.idCampeonato %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Nombre</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Descripción</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.descripcion %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>División a la que pertenece</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.division.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Estado</h3></div>
        <div class="propiedadDetalle"><h4><%: (bool)Model.estado ? "Activo":"Inactivo" %></h4></div>
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" />
        </div>
    </form>

</asp:Content>

