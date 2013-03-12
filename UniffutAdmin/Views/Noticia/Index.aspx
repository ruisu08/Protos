<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.noticia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Noticias</h2>

    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                Titulo
            </th>
            <th>
                Fecha
            </th>
            <th>
                autor
            </th>
            <th>
                Tipo de Noticia
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Editar noticia", "Edit", new { id=item.idNoticia }) %> |
                <%: Html.ActionLink("Detalles de noticias", "Details", new { id=item.idNoticia })%> |
                <%: Html.ActionLink("Eliminar noticia", "Delete", new { id=item.idNoticia })%>
            </td>
            <td>
                <%: item.idNoticia %>
            </td>
            <td>
                <%: item.titulo %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.fecha) %>
            </td>
            <td>
                <%: item.usuario.nombre + " " + item.usuario.apellido %>
            </td>
            <td>
                <%: item.tiponoticia.nombre%>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Crear nueva noticia", "Create") %>
    </p>

</asp:Content>

