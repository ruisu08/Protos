<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.campeonato>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Campeonatos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="headerContenido">
    <div id="tituloContenido">
    <h1>Campeonatos</h1>
    <h6 id="descripcionController">Aquí puedes los campeonatos creados, además de poder editarlos, eliminarlos o crearlos</h6>
    </div>

    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","Campeonato")%>' method="post">
            <p>Buscar por nombre</p>
            <input type="text" name="identificacion" />
            <input type="submit" value="buscar" id="opcionCrud"/>
        </form>
    </div>
</div>

    <h2>Lista de Campeonatos:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nuevo Campeonato", "Create") %></h3>

    <div id="tableWrapper">
    <table id="indTable">
        <tr>
            <th></th>
            <th>
                Nombre
            </th>
            <th>
                Division
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
            <div class="opcionCrud">
                <%: Html.ActionLink("Editar Campeonato", "Edit", new { id=item.idCampeonato}) %>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Detalles del Campeonato", "Details", new { id=item.idCampeonato })%>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Eliminar este Campeonato", "Delete", new { id=item.idCampeonato })%>
            </div>
            </td>
            <td>
                <%: item.nombre %>
            </td>
            <td>
                <%: item.division.nombre %>
            </td>
        </tr>
    
    <% } %>

    </table>
    </div>

</asp:Content>

