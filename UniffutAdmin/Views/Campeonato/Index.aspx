<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.campeonato>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Campeonatos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Campeonato</h2>

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
                Descripcion
            </th>
            <th>
                Division
            </th>
            <th>
                Estado
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Actualizar datos", "Edit", new { id=item.idCampeonato }) %> |
                <%: Html.ActionLink("Datos en detalle", "Details", new { id = item.idCampeonato })%> |
                <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idCampeonato })%>
            </td>
            <td>
                <%: item.idCampeonato %>
            </td>
            <td>
                <%: item.nombre %>
            </td>
            <td>
                <%: item.descripcion %>
            </td>
            <td>
                <%: item.division.nombre %>
            </td>
            <td>
                <%: item.estado %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

