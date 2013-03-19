<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.rol>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar rol
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar Rol</h1>
        <h3>Solo pasara a inactivo</h3>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","Jugadora")%>' method="post">
        
        <div id="detallesWrapper">

        <div class="nombrePropiedadDetalle"><h3>Nombre</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Descripcion</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.descripcion %></h4></div>
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" data-confirm= "Si elimina este rol se eliminaran todos los usuarios con el"  />
        </div>
    </form>
</asp:Content>
