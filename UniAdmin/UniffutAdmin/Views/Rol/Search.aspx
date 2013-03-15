<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.rol>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Search
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Resultados de la Busqueda</h2>
    <div id="tableWrapper">
    <table id="indTable">
        <tr>
            <th></th>
            <th>
                Nombre
            </th>
            <th>
                Descripcion
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <div class="opcionCrud">
                    <%: Html.ActionLink("Editar Rol", "Edit", new { id=item.idRol}) %>
                </div>
                <div class="opcionCrud">
                    <%: Html.ActionLink("Detalles del Rol", "Details", new { id=item.idRol })%>
                </div>
                <div class="opcionCrud">
                    <%: Html.ActionLink("Eliminar este Rol", "Delete", new { id=item.idRol })%>
                </div>

                <div class="opcionCrud">
                    <%: Html.ActionLink("Asignar permisos a rol", "asignarModulosARol", new { id = item.idRol })%>
                </div>

            </td>

            <td>
                <%: item.nombre %>
            </td>
            <td>
                <%: item.descripcion %>
            </td>
        </tr>
    
    <% } %>

    </table>
    </div>

</asp:Content>

