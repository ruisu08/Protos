<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.division>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Eliminar</h2>

    <h3>Eliminar (esto pasara el estado a Inactivo)</h3>
    <fieldset>
        <legend>Informacion</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.idDivisiones %></div>
        
        <div class="display-label">Abreviatura</div>
        <div class="display-field"><%: Model.abreviatura %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.nombre %></div>
        
        <div class="display-label">Descripcion</div>
        <div class="display-field"><%: Model.descripcion %></div>
        
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Eliminar" data-confirm="Si elimina la division eliminara todos los campeonatos, junto con sus tablas de posiciones y calendarios, y equipos en ella, junto con sus jugadoras. Esta seguro que desea eliminar la division?"/> |
		    <%: Html.ActionLink("Regresar a la lista", "Index") %>
        </p>
    <% } %>

</asp:Content>

