<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.rol>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Roles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="headerContenido">
    <div id="tituloContenido">
    <h1>Roles</h1>
    <h6 id="descripcionController">Aquí puedes ver los tipos de usuarios existentes y a que partes del sistema tiene acceso, puedes crear un tipo de usuario nuevo también</h6>
    </div>

    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","Rol")%>' method="post">
            <p>Buscar por nombre</p>
            <input type="text" name="identificacion" />
            <input type="submit" value="buscar" id="opcionCrud"/>
        </form>
    </div>
</div>

<div>
    <h2>Lista de jugadoras:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nuevo Rol", "Create") %></h3>
</div>

<div id="tableWrapper">
    <table id="indTable">
        <tr>
            <th></th>
            <th>
                Nombre
            </th>
            <th>
                Descripcion
            </th>

        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
            <div class="opcionCrud">
                <%: Html.ActionLink("Editar Rol", "Edit", new { id=item.idRol}) %>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Detalles del Rol", "Details", new { id=item.idRol })%>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Eliminar este Rol", "Delete", new { id=item.idRol })%>
            </div>

            <div class="opcionCrud">
                <%: Html.ActionLink("Asignar permisos a Rol", "asignarModulosARol", new { id = item.idRol })%>
            </div>

            </td>
            <td>
                <%: item.nombre %>
            </td>
            <td>
                <%: item.descripcion %>
            </td>

        </tr>
    
    <% } %>

    </table>
</div>


</asp:Content>

