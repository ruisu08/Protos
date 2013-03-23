<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.usuario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Usuarios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <div id="topBar">
            <div id="searchBar"> 
                <form id="searchForm" action= '<%:Url.Action("Search","Usuario")%>' method="post">
                        <input type="submit"  value="Buscar" id="searchButton"/>
                        <input type="text" name="Rol" class="searchText" id="searchBoxOne" value="Buscar por rol"/>
                        <input type="text" name="Apellido" class="searchText" id="searchBoxTwo" value="Buscar por apellido"/>
                </form>
            </div>
            <div id="logOut" class="opcionLogOut">
                <%:Html.ActionLink("Cerrar sesión","LogOut","Login") %>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Usuarios:</h1>
                <h4 id="contenidoDescripcion">Administración de base de datos de usuarios de la Uniffut</h4>
            </div>
            <div id="contenedorCrear">
                <%:Html.ActionLink("Crear nuevo usuario", "Create") %>
            </div>
        </div>
        <div id="contenidoEspecifico">
        <% foreach (var item in Model) { %>
                <div class="itemWrapper">
                    <div class="info">
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Nombre</p></div>
                            <div class="infoText"><p><%:item.nombre + " "+item.apellido%></p></div>
                        </div>
                    </div>
                    <div class="info">
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Rol</p></div>
                            <div class="infoText"><p><%:item.rol.nombre%></p></div>
                        </div>
                    </div>
                    <div class="options">
                        <div class="itemOption">
                            <%: Html.ActionLink("Editar", "Edit", new { id=item.idUsuario}) %>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Detalles", "Details", new { id=item.idUsuario})%>
                        </div>
                        <div class="itemOption">
                           <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idUsuario })%>
                        </div>
                    </div>
                </div>
           <% } %>
            </div>


</asp:Content>