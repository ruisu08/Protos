<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.equipo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles</h2>

    <fieldset>
        <legend>Informacion</legend>
        
        <div class="display-label" style="text-decoration:underline;">ID</div>
        <div class="display-field"><%: Model.idEquipo %></div>
        
        <div class="display-label" style="text-decoration:underline;">Abreviatura</div>
        <div class="display-field"><%: Model.abreviatura %></div>
        
        <div class="display-label" style="text-decoration:underline;">Nombre</div>
        <div class="display-field"><%: Model.nombre %></div>
        
        <div class="display-label" style="text-decoration:underline;">Historia</div>
        <div class="display-field"><%: new HtmlString(HttpUtility.HtmlDecode(Model.historia)) %></div>
        
        <div class="display-label" style="text-decoration:underline;">Campeonatos Ganados</div>
        <div class="display-field"><%: Model.campeonatosGanados %></div>
        
        <div class="display-label" style="text-decoration:underline;">Divisiones</div>
        <div class="display-field"><%: Model.division.nombre %></div>
        
        <div class="display-label" style="text-decoration:underline;">Estado</div>
        <div class="display-field"><%:(bool)Model.estado ? "Activo":"Inactivo" %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Actualizar", "Edit", new { id=Model.idEquipo }) %> |
        <%: Html.ActionLink("Volver a la Lista", "Index") %>
    </p>

</asp:Content>

