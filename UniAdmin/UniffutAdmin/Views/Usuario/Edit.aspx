<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.UsuarioRolViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Actualizar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Actualizar Usuario</h1>
    </div>

   <form id="validateForm" action= '<%:Url.Action("Edit","Usuario")%>' method="post">
        
    <div id="createWrapper">
        <div>
        <h3>Nombre</h3>
        <%: Html.TextBoxFor(model => model.Usuario.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "45", @class = "infofield" })%>
        </div>
        <div>
        <h3>Apellidos</h3>
        <%: Html.TextBoxFor(model => model.Usuario.apellido, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "45", @class = "infofield" })%>
        </div>
        <div>
        <h3>Teléfono</h3>
        <%: Html.TextBoxFor(model => model.Usuario.telefono, new { @required = "required", @size = "15", @class="infofield"}) %>
        </div>
        <div>
        <h3>Correo</h3>
        <%: Html.TextBoxFor(model => model.Usuario.correo, new { @required = "required", @maxlength = "50", @type = "email", @name = "email", @class="infofield"}) %>
        </div>
        <div>
        <h3>Rol</h3>
        <%: Html.DropDownListFor(model => model.Usuario.Rol_idRol, new SelectList(Model.Roles, "idRol", "descripcion", Model.Roles.First().idRol), new {@class = "infofield" })%>
        </div>
    </div>
    
            <div>
                <input type="submit" value="Actualizar Datos" class="opcionCrud" />
            </div>

</form>
    <div>
        <%: Html.ActionLink("Volver a Lista", "Index") %>
    </div>
</asp:Content>
