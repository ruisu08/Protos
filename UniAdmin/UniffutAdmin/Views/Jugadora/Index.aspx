<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.jugadora>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Jugadoras
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div id="topBar">
            <div id="searchBar"> 
                <form id="searchForm" action= '<%:Url.Action("Search","Jugadora")%>' method="post">
                        <input type="submit"  value="Buscar" id="searchButton"/>
                        <input type="text" name="apellidos" class="searchText" id="searchBoxOne" value="Buscar por apellido"/>
                        <input type="text" name="equipo"  class="searchText" id="searchBoxTwo" value="Buscar por equipo"/>
                </form>
            </div>
            <div id="logOut" class="opcionLogOut">
                <%:Html.ActionLink("Cerrar sesión","LogOut","Login") %>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Jugadoras:</h1>
                <h4 id="contenidoDescripcion">Administración de base de datos de jugadoras de la Uniffut</h4>
            </div>
            <div id="contenedorCrear">
                <%:Html.ActionLink("Añadir nueva Jugadora", "Create") %>
            </div>
        </div>
        <div id="contenidoEspecifico">
        <% foreach (var item in Model) { %>
                <div class="itemWrapper">
                    <div class="info">
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Nombre</p></div>
                            <div class="infoText"><p><%:item.nombre + " "+item.apellidos%></p></div>
                        </div>
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Equipo</p></div>
                            <div class="infoText"><p><%:item.equipo.nombre%></p></div>
                        </div>
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Edad</p></div>
                            <div class="infoText"><p><% DateTime today = DateTime.Today;
                                                        int age = today.Year - item.fechaNacimiento.Year;
                                                        if (item.fechaNacimiento > today.AddYears(-age)) age--;
                                                        Response.Write(age);
                                                        %>
                                                        </p></div>
                        </div>
                    </div>
                    <div class="options">
                        <div class="itemOption">
                            <%: Html.ActionLink("Editar", "Edit", new { id=item.idJugadora}) %>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Detalles", "Details", new { id=item.idJugadora })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idJugadora })%>
                        </div>
                        <div class="itemOption">
                             <%: Html.ActionLink("Redactar historia", "agregarHistoria", new { id = item.idJugadora })%>
                        </div>
                        <div class="itemOption">
                             <%: Html.ActionLink("Multimedia", "albumesMultimedia", new { id = item.idJugadora })%>
                        </div>
                    </div>
                </div>
           <% } %>
            </div>
 
</asp:Content>

