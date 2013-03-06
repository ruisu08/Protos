<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.jugadora>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Jugadoras
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Jugadoras</h2>

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
                Apellidos
            </th>
            <th>
                Edad
            </th>
            <th>
                Equipo
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Actualizar datos", "Edit", new { id=item.idJugadora }) %> |
                <%: Html.ActionLink("Datos en detalle", "Details", new { id=item.idJugadora })%> |
                <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idJugadora })%>
            </td>
            <td>
                <%: item.idJugadora %>
            </td>
            <td>
                <%: item.nombre %>
            </td>
            <td>
                <%: item.apellidos %>
            </td>
            <td>
            <!---String.Format("{0:g}", item.fechaNacimiento)-->
                <% DateTime dob = Convert.ToDateTime(item.fechaNacimiento);
                   DateTime hoy = DateTime.Now;
                   int edad = hoy.Year - dob.Year;
                   if (hoy.Month < dob.Month || (hoy.Month == dob.Month && hoy.Day < dob.Day)) { edad--; };
                   Response.Write(edad);
                   %>
            </td>
            <td>
                <%:item.equipo.nombre%>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Añadir jugadora a la lista", "Create") %>
    </p>

</asp:Content>

