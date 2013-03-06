<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.UsuarioRolViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Actualizar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Actualizar</h2>
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
    <div>
        <div>
        <h3>Nombre</h3>
        <%: Html.TextBoxFor(model => model.Usuario.nombre) %>
        <%: Html.ValidationMessageFor(model => model.Usuario.nombre) %>
        </div>
        <div>
        <h3>Apellidos</h3>
        <%: Html.TextBoxFor(model => model.Usuario.apellido) %>
        <%: Html.ValidationMessageFor(model => model.Usuario.apellido) %>
        </div>
        <div>
        <h3>Teléfono</h3>
        <%: Html.TextBoxFor(model => model.Usuario.telefono) %>
        <%: Html.ValidationMessageFor(model => model.Usuario.telefono) %>
        </div>
        <div>
        <h3>Correo</h3>
        <%: Html.TextBoxFor(model => model.Usuario.correo) %>
        <%: Html.ValidationMessageFor(model => model.Usuario.correo) %>
        </div>
        <div>
        <h3>Rol</h3>
        <%: Html.DropDownListFor(model => model.Usuario.Rol_idRol, new SelectList(Model.Roles, "idRol","descripcion",Model.Roles.First().idRol))%>
        <%: Html.ValidationMessageFor(model => model.Usuario.Rol_idRol)%>
        </div>
        <input type="submit" value="Actualizar"/>
    </div>
<% } %>
    <div>
        <%: Html.ActionLink("Volver a lista de usuarios", "Index") %>
    </div>
</asp:Content>
