﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles</h2>

    <fieldset>
        <legend>Información</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.idUsuario %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.nombre %></div>
        
        <div class="display-label">Apellidos</div>
        <div class="display-field"><%: Model.apellido %></div>
        
        <div class="display-label">Telefono</div>
        <div class="display-field"><%: Model.telefono %></div>
        
        <div class="display-label">Correo</div>
        <div class="display-field"><%: Model.correo %></div>
        
        
        <div class="display-label">Estado</div>
        <div class="display-field"><%: (bool)Model.estado ? "Activo":"Inactivo" %></div>
        
        <div class="display-label">Rol</div>
        <div class="display-field"><%: Model.rol.descripcion %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Actualizar datos", "Edit", new { id=Model.idUsuario }) %> |
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </p>

</asp:Content>
