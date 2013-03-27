<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.partido>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Partidos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div id="topBar">
            <div id="searchBar"> 
                <form id="searchForm" action= '<%:Url.Action("Search","Partido")%>' method="post">
                        <input type="submit"  value="Buscar" id="searchButton"/>
                        <input type="text" name="equipoUno" class="searchText" id="searchBoxOne" value="Primer Equipo"/>
                        <input type="text" name="equipoDos" class="searchText" id="searchBoxTwo" value="Segundo Equipo"/>
                        <input type="checkbox" name="terminado" value="true" checked="checked" /> Partidos Jugados
                        <input type="hidden" name="terminado" value="false" />
                </form>
            </div>
            <div id="logOut" class="opcionLogOut">
                <%:Html.ActionLink("Cerrar sesión","LogOut","Login") %>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Partidos</h1>
                <h4 id="contenidoDescripcion">Administración de partidos</h4>
            </div>
            <div id="contenedorCrear">
                <%int ID = Convert.ToInt32(RouteData.Values["id"]);%>
                <%:Html.ActionLink("Crear nuevo partido", "Create", new { id = ID })%>
            </div>
        </div>
        <div id="contenidoEspecifico">
        <% foreach (var item in Model) { %>
                <div class="itemWrapper">
                    <div class="info">
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Equipo uno</p></div>
                            <div class="infoText"><p><%:item.equipo.nombre%></p></div>
                        </div>
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Equipo dos</p></div>
                            <div class="infoText"><p><%:item.equipo1.nombre%></p></div>
                        </div>
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Fecha</p></div>
                            <div class="infoText"><p><%:item.fecha%></p></div>
                        </div>
                    </div>
                    <div class="options">
                        <div class="itemOption">
                            <%: Html.ActionLink("Editar", "Edit", new { id = item.idpartido})%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Detalles", "Details", new { id = item.idpartido })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Marcar como terminado", "marcarComoTerminado", new { id = item.idpartido })%>
                        </div>
                        <div class="itemOption">
                             <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idpartido })%>
                        </div>
                    </div>
                </div>
           <% } %>
            </div>
</asp:Content>
