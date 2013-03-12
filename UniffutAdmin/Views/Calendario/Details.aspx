<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.calendario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalle de calendario</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.idCalendario %></div>
        
        <div class="display-label">Fecha de Inicio</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.fechaInicio) %></div>
        
        <div class="display-label">Fecha Final</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.fechaFinal) %></div>
        
        <div class="display-label">Campeonato</div>
        <div class="display-field"><%: Model.Campeonato_idCampeonato %></div>
        
        <div class="display-label">Estado</div>
        <div class="display-field"><%: Model.estado %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Editar", "Edit", new { id=Model.idCalendario }) %> |
        <%: Html.ActionLink("Regresar a la lista", "Index") %>
    </p>

</asp:Content>

