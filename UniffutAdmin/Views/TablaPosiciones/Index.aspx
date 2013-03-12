<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.equipo_has_campeonato>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table >
        <tr>
            <th></th>
            <th >
                Equipo
            </th>
            <th >
                Campeonato
            </th>
            <th >
                Puntos
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr >
            <td >
                <%: Html.ActionLink("Actualizar", "Edit", new { id=item.Equipo_idEquipo }) %> |
                <%: Html.ActionLink("Detalles", "Details", new { id=item.Equipo_idEquipo })%> |
                <%: Html.ActionLink("Eliminar", "Delete", new { id=item.Equipo_idEquipo })%>
            </td>
            <td >
                <%: item.equipo.nombre %>
            </td>
            <td >
                <%: item.campeonato.nombre %>
            </td>
            <td >
                <%: item.puntos %>
            </td>
           
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Crear nueva tabla", "Create") %>
    </p>

</asp:Content>

