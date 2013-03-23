<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.rol>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Roles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <div id="topBar">
            <div id="searchBar"> 
                <form id="searchForm" action= '<%:Url.Action("Search","Rol")%>' method="post">
                        <input type="submit"  value="Buscar" id="searchButton"/>
                        <input type="text" name="autor" class="searchText" id="searchBoxOne" value="Buscar por autor"/>
                </form>
            </div>
            <div id="logOut" class="opcionLogOut">
                <%:Html.ActionLink("Cerrar sesión","LogOut","Login") %>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Patrocinadores:</h1>
                <h4 id="contenidoDescripcion">Administración de base de datos de roles de la Uniffut</h4>
            </div>
            <div id="contenedorCrear">
                <%:Html.ActionLink("Crear nuevo rol", "Create") %>
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
                    </div>
                    <div class="options">
                        <div class="itemOption">
                            <%: Html.ActionLink("Editar", "Edit", new { id=item.idRol}) %>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Detalles", "Details", new { id=item.idRol})%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Asignar permisos", "asignarModulosARol", new { id = item.idRol })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Eliminar permisos", "eliminarModulos", new { id = item.idRol })%>
                        </div>
                        <div class="itemOption">
                           <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idRol })%>
                        </div>
                    </div>
                </div>
           <% } %>
            </div>

</asp:Content>

