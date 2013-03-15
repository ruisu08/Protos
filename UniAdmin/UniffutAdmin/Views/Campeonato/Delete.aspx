<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.campeonato>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Eliminar Campeonatos</h2>

    <h3>Solo pasara a inactivo</h3>
    <fieldset>
        <legend>Informacion</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.idCampeonato %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.nombre %></div>
        
        <div class="display-label">Descripcion</div>
        <div class="display-field"><%: Model.descripcion %></div>
        
        <div class="display-label">Divisiones</div>
        <div class="display-field"><%: Model.division.nombre %></div>
        
        <div class="display-label">Estado</div>
        <div class="display-field"><%: (bool)Model.estado ? "Activo":"Inactivo" %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Eliminar" /> |
		    <%: Html.ActionLink("Regresar a lista", "Index") %>
        </p>
    <% } %>

</asp:Content>

