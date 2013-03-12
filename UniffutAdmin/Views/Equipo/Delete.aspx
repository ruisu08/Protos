<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.equipo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Eliminar</h2>

        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.idEquipo %></div>
        
        <div class="display-label">Abreviatura</div>
        <div class="display-field"><%: Model.abreviatura %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.nombre %></div>
        
        <div class="display-label">Divisiones</div>
        <div class="display-field"><%: Model.division.abreviatura %></div>

    <% using (Html.BeginForm()) { %>
        <div>
		    <input id="submitBTN" type="submit" value="Borrar" data-confirm="Si elimina al equipo se eliminara de todo los campeonatos y sus tablas de posiciones, asi como sus archivos multimedia. Tambien eliminara a todos los jugadores que esten en el equipo y sus archivos multimedia. Esta seguro que desea eliminar el equipo?" />
        </div>
        <div>
            <%: Html.ActionLink("Volver a la lista", "Index") %>
        </div>
    <% } %>

</asp:Content>

