<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.calendario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                Fecha de Inicio
            </th>
            <th>
                Fecha Final
            </th>
            <th>
                Campeonato
            </th>
            
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Actualizar Datos", "Edit", new { id=item.idCalendario }) %> |
                <%: Html.ActionLink("Detalles de datos", "Details", new { id=item.idCalendario })%> |
                <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idCalendario })%>
            </td>
            <td>
                <%: item.idCalendario %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.fechaInicio) %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.fechaFinal) %>
            </td>
            <td>
                <%: item.campeonato.nombre %>
            </td>
            
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Crear Calendario", "Create") %>
    </p>

</asp:Content>

