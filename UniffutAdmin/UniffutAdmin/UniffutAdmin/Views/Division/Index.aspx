<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.division>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Divisiones
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Divisiones</h2>

    <table  id="indTable">
        <tr>
            <th></th>
            <th>
                Nombre
            </th>
            <th>
                Descripcion
            </th>
             <th>
                Abreviatura
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Actualizar datos", "Edit", new { id=item.idDivisiones }) %> |
                <%: Html.ActionLink("Detalles", "Details", new { id=item.idDivisiones })%> |
                <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idDivisiones })%>
            </td>
            <td>
                <%: item.nombre %>
            </td>
            <td>
                <%: item.descripcion %>
            </td>
            <td>
                <%: item.abreviatura %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Crear nueva", "Create") %>
    </p>

</asp:Content>

