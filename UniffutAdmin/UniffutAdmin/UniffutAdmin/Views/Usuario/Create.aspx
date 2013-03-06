<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.UsuarioRolViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Usuario
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear usuario</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Información</legend>
            
            <div class="editor-label">
                <h3>ID</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Usuario.idUsuario)%>
                <%: Html.ValidationMessageFor(model => model.Usuario.idUsuario)%>
            </div>
            
            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Usuario.nombre)%>
                <%: Html.ValidationMessageFor(model => model.Usuario.nombre)%>
            </div>
            
            <div class="editor-label">
                <h3>Apellido</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Usuario.apellido)%>
                <%: Html.ValidationMessageFor(model => model.Usuario.apellido)%>
            </div>
            
            <div class="editor-label">
               <h3>Teléfono</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Usuario.telefono)%>
                <%: Html.ValidationMessageFor(model => model.Usuario.telefono)%>
            </div>
            
            <div class="editor-label">
                <h3>Correo</h3>
            </div>
            <div class="editor-field">
                <%:Html.TextBoxFor(model => model.Usuario.correo)%>
                <%: Html.ValidationMessageFor(model => model.Usuario.correo)%>
            </div>
            
            <div class="editor-label">
                <h3>Password</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Usuario.password)%>
                <%: Html.ValidationMessageFor(model => model.Usuario.password)%>
            </div>

            <div class="editor-label">
               <h3>Rol</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Usuario.Rol_idRol, new SelectList(Model.Roles, "idRol","descripcion",Model.Roles.First().idRol))%>
                <%: Html.ValidationMessageFor(model => model.Usuario.Rol_idRol)%>
            </div>
            
            <p>
                <input type="submit" value="Crear nuevo usuario" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

