<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.campeonato>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles de los campeonatos</h2>

    <fieldset>
        <legend>Campos</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.idCampeonato %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.nombre %></div>
        
        <div class="display-label">Descripcion</div>
        <div class="display-field"><%: Model.descripcion %></div>
        
        <div class="display-label">Divisiones</div>
        <div class="display-field"><%: Model.Divisiones_idDivisiones %></div>
        
        <div class="display-label">Estado</div>
        <div class="display-field"><%: (bool)Model.estado ? "Activo":"Inactivo" %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Actualizar datos", "Edit", new { id=Model.idCampeonato }) %> |
        <%: Html.ActionLink("Regresar a la lista", "Index") %>
    </p>

</asp:Content>

