<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.album_equipo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Albumes de equipo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div id="topBar">
            <div id="searchBar"> 
                <form id="searchForm" action= '<%:Url.Action("Search","AlbumEquipo")%>' method="post">
                        <input type="submit"  value="Buscar" id="searchButton"/>
                        <input type="text" name="apellidos" class="searchText" id="searchBoxOne" value="Buscar por nombre"/>
                </form>
            </div>
            <div id="logOut" class="opcionLogOut">
                <%:Html.ActionLink("Cerrar sesión","LogOut","Login") %>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Albumes Multimedia de Equipo</h1>
                <h4 id="contenidoDescripcion">Administración de Multimedia de Equipo</h4>
            </div>
            <div id="contenedorCrear">
                <%int ID = Convert.ToInt32(RouteData.Values["id"]);%>
                <%:Html.ActionLink("Crear nuevo Album", "Create", new { id = ID })%>
            </div>
        </div>
        <div id="contenidoEspecifico">
        <% foreach (var item in Model) { %>
                <div class="itemWrapper">
                    <div class="info">
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Nombre</p></div>
                            <div class="infoText"><p><%:item.nombre %></p></div>
                        </div>
                    </div>
                    <div class="options">
                        <div class="itemOption">
                            <%: Html.ActionLink("Editar", "Edit", new { id = item.idAlbum_Equipo })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Agregar media", "agregarMultimedia", new { id = item.idAlbum_Equipo })%>
                        </div>
                        <div class="itemOption">
                           <%: Html.ActionLink("Ver multimedia", "verMultimedia", new { id = item.idAlbum_Equipo })%>
                        </div>
                        <div class="itemOption">
                             <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idAlbum_Equipo })%>
                        </div>
                    </div>
                </div>
           <% } %>
            </div>
</asp:Content>

