<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.jugadora>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Eliminar</h2>

    <h3>Esto pasara el estado de la jugadora a inactiva, no la eliminara realmente</h3>
    <fieldset>
        <legend>Informacion</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.idJugadora %></div>

        <div class="display-label">Identificacion</div>
        <div class="display-field"><%: Model.identificacion %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.nombre %></div>
        
        <div class="display-label">Apellidos</div>
        <div class="display-field"><%: Model.apellidos %></div>

        <div class="display-label">Fecha de Nacimiento</div>
        <div class="display-field"><%: Model.fechaNacimiento %></div>
        
        <div class="display-label">Equipo</div>
        <div class="display-field"><%: Model.equipo.nombre %></div>
        
        <div class="display-label">Nacionalidad</div>
        <div class="display-field"><%: Model.nacionalidad%></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Eliminar" data-confirm="Si elimina a esta jugadora se eliminara toda la multimedia asociada a ella. Esta seguro que desea eliminar a la jugadora?" /> |
		    <%: Html.ActionLink("Volver a la lista", "Index") %>
        </p>
    <% } %>

</asp:Content>

