<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.division>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar Division</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","Division")%>' method="post">
        
        <div id="detallesWrapper">

        <div class="nombrePropiedadDetalle"><h3>Nombre</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Descripción</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.descripcion %></h4></div>
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" data-confirm= "Si elimina esta division se eliminaran todos sus campeonatos, equipos y las jugadoras de estos equipos" />
        </div>
    </form>

</asp:Content>

