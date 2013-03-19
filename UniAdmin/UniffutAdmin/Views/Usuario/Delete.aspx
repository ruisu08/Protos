<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar Usuario</h1>
        <h3>Solo pasara a inactivo</h3>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","Jugadora")%>' method="post">
        
        <div id="detallesWrapper">


        <div class="nombrePropiedadDetalle"><h3>Identificacion</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.identificacion %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Nombre</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Apellidos</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.apellido %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Teléfono</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.telefono %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Correo</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.correo %></h4></div>
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" />
        </div>
    </form>

</asp:Content>

