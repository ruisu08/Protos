<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.division>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Divisiones
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
    <div id="tituloContenido">
    <h1>Divisiones</h1>
    <h6 id="descripcionController">Aquí se pueden ver todas las divisiones existentes, además de poder crearlas, eliminarlas o editarlas</h6>
    </div>

    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","Division")%>' method="post">
            <p>Buscar por nombre</p>
            <input type="text" name="identificacion" />
            <input type="submit" value="buscar" id="opcionCrud"/>
        </form>
    </div>
</div>

    <div>
    <h2>Lista de Divisiones:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nueva Division", "Create") %></h3>
    </div>

    <div id="tableWrapper">
    <table  id="indTable">
        <tr>
            <th></th>
            <th>
                Abreviatura
            </th>
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
                <%: Html.ActionLink("Editar Division", "Edit", new { id=item.idDivisiones}) %>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Detalles de la Division", "Details", new { id=item.idDivisiones })%>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Eliminar la Division", "Delete", new { id=item.idDivisiones })%>
            </div>

            </td>
            <td>
                <%: item.abreviatura %>
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

