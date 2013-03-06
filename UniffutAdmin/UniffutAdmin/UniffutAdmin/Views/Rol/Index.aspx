<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.rol>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Roles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Roles</h2>

    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                Descripcion
            </th>

        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Editar", "Edit", new { id=item.idRol }) %> |
                <%: Html.ActionLink("Detalles", "Details", new { id=item.idRol })%> |
                <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idRol })%>
            </td>
            <td>
                <%: item.idRol %>
            </td>
            <td>
                <%: item.descripcion %>
            </td>

        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Crear nuevo rol", "Create") %>
    </p>

</asp:Content>

