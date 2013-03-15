<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.jugadora>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Jugadoras
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="headerContenido">
    <div id="tituloContenido">
    <h1>Jugadoras</h1>
    <h4 id="descripcionController">Aqui es donde puedes ver,editar,agregar y eliminar la información de las jugadoras así con sus fotos y videos</h4>
    </div>
    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","Jugadora")%>' method="post">
            <p>Buscar por identificación</p>
            <input type="text" name="identificacion" />
            <input id="botonBusqueda" type="submit" value="buscar"/>
        </form>
    </div>
</div>

    <div>
    <h2>Lista de Jugadoras:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nueva Jugadora", "Create") %></h3>
    </div>

 <div id="indexWrapper">

    <% foreach (var item in Model) { %>
            <div class="itemWrapper">
                <div class="indexData">
                    <h3>Identificación:</h3>
                    <h4><%:item.identificacion %></h4>
                </div>
                <div class="indexData">
                    <h3>Nombre:</h3>
                    <h4><%:item.nombre%></h4>
                </div>
                <div class="indexData">
                    <h3>Apellidos:</h3>
                    <h4><%:item.apellidos%></h4>
                </div>
                <div class="indexData">
                    <h3>Edad:</h3>
                    <h4><%:item.fechaNacimiento%></h4>
                </div>
               <div class="indexData">
                    <h3>Nacionalidad:</h3>
                    <h4><%:item.nacionalidad%></h4>
                </div>
                <div class="indexData">
                    <h3>Equipo:</h3>
                    <h4><%:item.equipo.nombre%></h4>
                </div>
                <div id="opcionWrapper">
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Editar Jugadora", "Edit", new { id=item.idJugadora}) %>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Detalles de la Jugadora", "Details", new { id=item.idJugadora })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Eliminar esta Jugadora", "Delete", new { id=item.idJugadora })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Redactar historia", "agregarHistoria", new { id = item.idJugadora })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Agregar multimedia", "agregarMultimedia", new { id=item.idJugadora })%>
                    </div>
                </div>
            </div>
    <% } %>

    </div>
 
</asp:Content>

