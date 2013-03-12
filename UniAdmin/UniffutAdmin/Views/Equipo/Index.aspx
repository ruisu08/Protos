<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.equipo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Equipos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Equipos</h2>

    <table  id="indTable">
        <tr>
            <th></th>
            <th >
                Abreviatura
            </th>
            <th >
                Nombre
            </th>
            <th >
                Campeonatos Ganados
            </th>
            <th >
                Division
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td >
                <%: Html.ActionLink("Actualizar", "Edit", new { id=item.idEquipo }) %> |
                <%: Html.ActionLink("Detalles", "Details", new { id=item.idEquipo })%> |
                <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idEquipo })%>
            </td>
            <td >
                <%: item.abreviatura %>
            </td>
            <td >
                <%: item.nombre %>
            </td>
       
            <td >
                <%: item.campeonatosGanados %>
            </td>
            <td >
                <%: item.division.nombre %>
            </td>
         
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Crear nuevo equipo", "Create") %>
    </p>

</asp:Content>

