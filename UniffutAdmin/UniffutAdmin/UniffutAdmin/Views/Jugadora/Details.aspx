<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.jugadora>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Datos en Detalle</h2>

    <fieldset>
        <legend>Campos</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.idJugadora %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.nombre %></div>
        
        <div class="display-label">Apellidos</div>
        <div class="display-field"><%: Model.apellidos %></div>
        
        <div class="display-label">Fecha de nacimiento</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.fechaNacimiento) %></div>
        
        <div class="display-label">Historia</div>
        <div class="display-field"><%:Html.TextAreaFor(model=> model.historia) %></div>
        
        <div class="display-label">Equipo</div>
        <div class="display-field"><%: Model.Equipo_idEquipo %></div>
        
        <div class="display-label">Estado</div>
        <div class="display-field"><%: (bool)Model.estado ? "Activa":"Inactiva" %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Actualizar datos", "Edit", new { id=Model.idJugadora }) %> |
        <%: Html.ActionLink("Volver a lista", "Index") %>
    </p>

</asp:Content>

