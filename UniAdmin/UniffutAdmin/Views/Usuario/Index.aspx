<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.usuario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Usuarios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div>
    <h2>Lista de Usuarios:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nuevo Usuario", "Create") %></h3>
    </div>

    <div id="tableWrapper">
    <table id="indTable">
        <tr>
            <th></th>
            <th>
                Identificación
            </th>
            <th>
                Nombre
            </th>
            <th>
                Rol
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
            <div class="opcionCrud">
                <%: Html.ActionLink("Editar Usuario", "Edit", new { id=item.idUsuario}) %>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Detalles del Usuario", "Details", new { id=item.idUsuario })%>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Eliminar este Usuario", "Delete", new { id=item.idUsuario })%>
            </div>

            </td>
                <%: item.identificacion %>
            </td>
            <td>
                <%: item.nombre %>
            </td>
            <td>
                <%: item.rol.descripcion %>
            </td>
        </tr>
    
    <% } %>

    </table>
    </div>

</asp:Content>

