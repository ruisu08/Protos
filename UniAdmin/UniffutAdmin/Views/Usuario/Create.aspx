﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.UsuarioRolViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Usuario
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear usuario</h2>

    <form id="validateForm" action= '<%:Url.Action("Create","Usuario")%>' method="post">
        <%: Html.ValidationSummary(true) %>

            
            <div class="editor-label">
                <h3>Identificacion</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Usuario.identificacion, new { @required = "required", @maxlength = "30", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Usuario.identificacion)%>
            </div>
            
            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Usuario.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{1,}", @maxlength = "30", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Usuario.nombre)%>
            </div>
            
            <div class="editor-label">
                <h3>Apellido</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Usuario.apellido, new { @required = "required", @pattern = "[a-zA-Z ]{1,}", @maxlength = "50", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Usuario.apellido)%>
            </div>
            
            <div class="editor-label">
               <h3>Teléfono</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Usuario.telefono, new { @required = "required", @size = "15", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Usuario.telefono)%>
            </div>
            
            <div class="editor-label">
                <h3>Correo</h3>
            </div>
            <div class="editor-field">
                <%:Html.TextBoxFor(model => model.Usuario.correo, new { @required = "required", @maxlength = "50", @type = "email", @name = "email", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Usuario.correo)%>
            </div>
            
            <div class="editor-label">
                <h3>Password</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Usuario.password, new { @required = "required", @pattern = "[a-zA-Z]{1,}", @maxlength = "50", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Usuario.password)%>
            </div>

            <div class="editor-label">
               <h3>Rol</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Usuario.Rol_idRol, new SelectList(Model.Roles, "idRol", "descripcion", Model.Roles.First().idRol), new { @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Usuario.Rol_idRol)%>
            </div>
            
            <p>
                <input type="submit" value="Crear nuevo usuario" id="opcionCrud"/>
            </p>

    </form>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

