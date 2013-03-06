<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.rol>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar rol
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Eliminar rol</h2>

    <fieldset>
    <div class="display-label">ID</div>
    <div class="display-field"><%: Model.idRol %></div>
                
        <div class="display-label">Estado</div>
        <div class="display-field"><%: (bool)Model.estado ? "Activo" : "Inactivo"%></div>
    </fieldset>

    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Eliminar" /> |
		    <%: Html.ActionLink("Volver a la lista", "Index") %>
        </p>
    <% } %>
</asp:Content>
