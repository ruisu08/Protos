<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.calendario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Eliminar</h2>

    <h3>Desea Inabilitar el estado del calendario</h3>
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
        
        <div class="display-label">estado</div>
        <div class="display-field"><%: (bool)Model.estado ? "Activo" : "Inactivo" %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Volver a la lista", "Index") %>
        </p>
    <% } %>

</asp:Content>

