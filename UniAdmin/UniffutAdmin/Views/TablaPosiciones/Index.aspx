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

        <div id="indexWrapper">

    <% foreach (var item in Model) { %>
            <div class="itemWrapper">
                <div class="indexData">
                    <h3>Nombre:</h3>
                    <h4><%:item.equipo.nombre %></h4>
                </div>
                <div class="indexData">
                    <h3>Puntos:</h3>
                    <h4><%:item.puntos %></h4>
                </div>
                <div id="opcionWrapper">
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Actualizar puntaje", "Edit", new { id=item.Equipo_idEquipo}) %>
                    </div>
                </div>
            </div>
    <% } %>

    </div>

</asp:Content>

