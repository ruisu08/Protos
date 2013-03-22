<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.campeonato>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Campeonatos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <div id="topBar">
            <div id="searchBar"> 
                <form id="searchForm" action= '<%:Url.Action("Search","Campeonato")%>' method="post">
                        <input type="submit"  value="Buscar" id="searchButton"/>
                        <input type="text"  name="division" class="searchText" id="searchBoxOne" value="Buscar por division"/>
                        <input type="text" name="nombre"  class="searchText" id="searchBoxTwo" value="Buscar por nombre"/>
                </form>
            </div>
            <div id="logOut" class="opcionLogOut">
                <a href="#">Cerrar sesión</a>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Campeonato:</h1>
                <h4 id="contenidoDescripcion">Administración de base de datos de campeonatos de la Uniffut</h4>
            </div>
            <div id="contenedorCrear">
                <%:Html.ActionLink("Crear nuevo Campeonato", "Create")%>
            </div>
        </div>
        <div id="contenidoEspecifico">
        <% foreach (var item in Model) { %>
                <div class="itemWrapper">
                    <div class="info">
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Nombre</p></div>
                            <div class="infoText"><p><%:item.nombre%></p></div>
                        </div>
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>División</p></div>
                            <div class="infoText"><p><%:item.division.nombre %></p></div>
                        </div>
                    </div>
                    <div class="options">
                        <div class="itemOption">
                            <%: Html.ActionLink("Editar", "Edit", new { id=item.idCampeonato}) %>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Detalles", "Details", new { id=item.idCampeonato })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Tabla de posiciones", "verTabla", new { id = item.idCampeonato })%>
                        </div>
                        <div class="itemOption">
                             <%: Html.ActionLink("Agregar equipo", "agregarEquipo", new { id = item.idCampeonato })%>
                        </div>
                        <div class="itemOption">
                              <%: Html.ActionLink("Eliminar equipo", "eliminarEquipo", new { id = item.idCampeonato })%>
                        </div>
                        <div class="itemOption">
                              <%: Html.ActionLink("Eliminar", "Delete", new { id = item.idCampeonato })%>
                        </div>
                    </div>
                </div>
           <% } %>
            </div>


</asp:Content>

