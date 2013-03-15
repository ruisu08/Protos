<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.equipo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Equipos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <div id="tituloContenido">
        <h1>Roles</h1>
        <h6 id="descripcionController">Aquí se pueden ver los equipos creados hasta el momento, además de editarlos, eliminarlos o crearlos</h6>
        </div>

        <div id="busqueda">
            <form id="validateForm" action= '<%:Url.Action("Search","Equipo")%>' method="post">
                <p>Buscar por nombre</p>
                <input type="text" name="identificacion" />
                <input type="submit" value="buscar" id="opcionCrud"/>
            </form>
        </div>
    </div>

     <div>
    <h2>Lista de Equipos:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nuevo Equipo", "Create") %></h3>
    </div>

    <div id="tableWrapper">
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
                Division
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
            <div class="opcionCrud">
                <%: Html.ActionLink("Editar Usuario", "Edit", new { id=item.idEquipo}) %>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Detalles del Usuario", "Details", new { id=item.idEquipo })%>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Eliminar este Usuario", "Delete", new { id=item.idEquipo })%>
            </div>

            <div class="opcionCrud">
                <%: Html.ActionLink("Redactar Historia", "agregarHistoria", new { id=item.idEquipo })%>
            </div>

            <div class="opcionCrud">
                <%: Html.ActionLink("Agregar multimedia", "agregarMultimedia", new { id = item.idEquipo })%>
            </div>

            </td>

            <td >
                <%: item.abreviatura %>
            </td>
            <td >
                <%: item.nombre %>
            </td>
            <td >
                <%: item.division.nombre %>
            </td>
         
        </tr>
    
    <% } %>

    </table>
    </div>

</asp:Content>

