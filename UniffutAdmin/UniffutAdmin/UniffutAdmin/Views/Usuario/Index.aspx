<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.usuario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Usuarios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Usuarios</h2>

    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                Nombre
            </th>
            <th>
                Apellido
            </th>
            <th>
                Telefono
            </th>
            <th>
                Correo
            </th>
            <th>
                Rol
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Actualizar Datos", "Edit", new { id=item.idUsuario }) %> |
                <%: Html.ActionLink("Datos en detalle", "Details", new { id=item.idUsuario })%> |
                <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idUsuario })%>
            </td>
            <td>
                <%: item.idUsuario %>
            </td>
            <td>
                <%: item.nombre %>
            </td>
            <td>
                <%: item.apellido %>
            </td>
            <td>
                <%: item.telefono %>
            </td>
            <td>
                <%: item.correo %>
            </td>
            <td>
                <%: item.rol.descripcion %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Crear nuevo usuario", "Create") %>
    </p>

</asp:Content>

