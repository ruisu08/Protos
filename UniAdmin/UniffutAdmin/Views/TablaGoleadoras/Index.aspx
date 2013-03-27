<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.goleadoras>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Goleadoras
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="topBar">
            
            <div id="logOut" class="opcionLogOut">
                <%:Html.ActionLink("Cerrar sesión","LogOut","Login") %>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Tabla de Goleadoras</h1>
                <h4 id="contenidoDescripcion">Administración de Tabla de Goleadoras</h4>
            </div>
            <div id="contenedorCrear">
                <%int ID = Convert.ToInt32(RouteData.Values["id"]);%>
                <%:Html.ActionLink("Crear nueva tabla de goleadoras", "Create", new { id = ID })%>
            </div>
        </div>
        <div id="contenidoEspecifico">
        <% foreach (var item in Model) { %>
                <div class="itemWrapper">
                    <div class="info">
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Jugadora</p></div>
                            <div class="infoText"><p><%:item.jugadora.nombre%></p></div>
                        </div>
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Goles</p></div>
                            <div class="infoText"><p><%:item.goles%></p></div>
                        </div>
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Campeonato</p></div>
                            <div class="infoText"><p><%:item.campeonato.nombre%></p></div>
                        </div>
                    </div>
                    <div class="options">
                        <div class="itemOption">
                            <%: Html.ActionLink("Editar", "Edit", new { id = item.idCampeonato})%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Detalles", "Details", new { id = item.idCampeonato })%>
                        </div>
                        <div class="itemOption">
                             <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idCampeonato })%>
                        </div>
                    </div>
                </div>
           <% } %>
            </div>

</asp:Content>
