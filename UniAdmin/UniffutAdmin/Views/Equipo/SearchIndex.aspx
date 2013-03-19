<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.equipo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Equipos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <div id="tituloContenido">
        <h1>Equipos</h1>
        <h6 id="descripcionController">Aquí se pueden ver los equipos creados hasta el momento, además de editarlos, eliminarlos o crearlos</h6>
        </div>

        
    </div>

     <div>
    <h2>Lista de Equipos:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nuevo Equipo", "Create") %></h3>
    </div>

    <div id="busqueda">
            <form id="validateForm" action= '<%:Url.Action("Search","Equipo")%>' method="post">
                <p>Buscar por nombre</p>
                <input type="text" name="nombre" class="infofield"/>
                <p>Buscar por división</p>
                <input type="text" name="division" class="infofield"/>
                <input type="submit" value="buscar" class="opcionCrud"/>
            </form>
        </div>

    <div id="indexWrapper">

    <% foreach (var item in Model) { %>
            <div class="itemWrapper">
                <div class="indexData">
                    <h3>Nombre:</h3>
                    <h4><%:item.nombre %></h4>
                </div>
                <div class="indexData">
                    <h3>Abreviatura:</h3>
                    <h4><%:item.abreviatura%></h4>
                </div>
                <div id="opcionWrapper">
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Editar", "Edit", new { id=item.idEquipo}) %>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Detalles", "Details", new { id=item.idEquipo })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idEquipo })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Redactar Historia", "agregarHistoria", new { id=item.idEquipo })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Albumes Multimedia", "albumesMultimedia", new { id = item.idEquipo })%>
                    </div>
                </div>
            </div>
    <% } %>

    </div>

</asp:Content>
