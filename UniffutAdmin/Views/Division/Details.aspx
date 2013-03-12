<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.division>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles de los datos</h2>

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
        
        <div class="display-label">Estado</div>
        <div class="display-field"><%: (bool)Model.estado ? "Activo":"Inactivo" %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Actualizar", "Edit", new { id=Model.idDivisiones }) %> |
        <%: Html.ActionLink("Regresar a la lista", "Index") %>
    </p>

</asp:Content>

