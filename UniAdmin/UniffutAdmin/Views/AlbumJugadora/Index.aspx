<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.album_jugadora>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Albumes de jugadora
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <div id="tituloContenido">
        <h1>Albumes</h1>
        <h6 id="descripcionController">Aquí se pueden ver los albumes creados hasta el momento, además de editarlos, eliminarlos o crearlos</h6>
        </div>

        <div id="busqueda">
            <form id="validateForm" action= '<%:Url.Action("Search","Jugadora")%>' method="post">
                <p>Buscar por nombre</p>
                <input type="text" name="identificacion" />
                <input type="submit" value="buscar" id="opcionCrud"/>
            </form>
        </div>
    </div>

     <div>
    <h2>Lista de Albumes:</h2>
  
    
    <h3 id="crearLink"><%:Html.ActionLink("Crear nuevo Album", "Create", new { id = Model.First().idJugadora})%></h3>

    </div>

    <div id="indexWrapper">

    <% foreach (var item in Model) { %>
            <div class="itemWrapper">
                <div class="indexData">
                    <h3>Nombre:</h3>
                    <h4><%:item.nombre %></h4>
                </div>
                <div id="opcionWrapper">
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Editar Album", "Edit", new { id=item.idAlbum_Jugadora}) %>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Eliminar este Album", "Delete", new { id=item.idAlbum_Jugadora })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Agregar multimedia", "agregarMultimedia", new { id = item.idAlbum_Jugadora })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Ver multimedia", "verMultimedia", new { id = item.idAlbum_Jugadora })%>
                    </div>
                </div>
            </div>
    <% } %>

    </div>

</asp:Content>
