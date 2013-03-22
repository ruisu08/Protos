<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.equipo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Equipos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


 <div id="topBar">
            <div id="searchBar"> 
                <form id="searchForm" action= '<%:Url.Action("Search","Equipo")%>' method="post">
                        <input type="submit"  value="Buscar" id="searchButton"/>
                        <input type="text" name="nombre" class="searchText" id="searchBoxOne" value="Buscar por nombre"/>
                        <input type="text" name="division"  class="searchText" id="searchBoxTwo" value="Buscar por división"/>
                </form>
            </div>
            <div id="logOut" class="opcionLogOut">
                <a href="#">Cerrar sesión</a>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Equipos:</h1>
                <h4 id="contenidoDescripcion">Administración de base de datos de equipos de la Uniffut</h4>
            </div>
            <div id="contenedorCrear">
                <%:Html.ActionLink("Añadir nueva Equipo", "Create") %>
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
                            <div class="infoTitle"><p>Abreviatura</p></div>
                            <div class="infoText"><p><%:item.abreviatura%></p></div>
                        </div>
                    </div>
                    <div class="options">
                        <div class="itemOption">
                            <%: Html.ActionLink("Editar", "Edit", new { id=item.idEquipo}) %>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Detalles", "Details", new { id=item.idEquipo })%>
                        </div>
                        <div class="itemOption">
                             <%: Html.ActionLink("Redactar Historia", "agregarHistoria", new { id=item.idEquipo })%>
                        </div>
                        <div class="itemOption">
                             <%: Html.ActionLink("Multimedia", "albumesMultimedia", new { id = item.idEquipo })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idEquipo })%>
                        </div>
                    </div>
                </div>
           <% } %>
            </div>

</asp:Content>

