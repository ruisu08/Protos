<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.equipo_has_campeonato>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <div id="headerContenido">
    <div id="tituloContenido">
    <h1>Tabla de Posiciones</h1>
    <h6 id="descripcionController">Aquí puedes ver las tablas de posiciones de los actuales campeonatos</h6>
    </div>

    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","TablaPosiciones")%>' method="post">
            <p>Buscar por nombre</p>
            <input type="text" name="identificacion" />
            <input type="submit" value="buscar" id="opcionCrud"/>
        </form>
    </div>
</div>

    <div>
    <h2>Lista de Tablas de Posiciones:</h2>
    </div>

    <div id="tableWrapper">
    <table id="indTable">
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
            <td>
            <div class="opcionCrud">
                <%: Html.ActionLink("Editar Tabla de Posiciones", "Edit", new { id=item.Equipo_idEquipo}) %>
            </div>

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
    </div>

</asp:Content>

