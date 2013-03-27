<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.tiponoticia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="topBar">
            <div id="logOut" class="opcionLogOut">
                <%:Html.ActionLink("Cerrar sesión","LogOut","Login") %>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Tipo Noticias:</h1>
                <h4 id="contenidoDescripcion">Administración los tipos de noticias</h4>
            </div>
            <div id="contenedorCrear">
                <%:Html.ActionLink("Crear nuevo tipo de noticia", "Create") %>
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
                            <div class="infoTitle"><p>Descripcion</p></div>
                            <div class="infoText"><p><%:item.descripcion%></p></div>
                        </div>
                    </div>
                    <div class="options">
                        <div class="itemOption">
                            <%: Html.ActionLink("Editar", "Edit", new { id=item.idTipoNoticia}) %>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Detalles", "Details", new { id=item.idTipoNoticia })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idTipoNoticia })%>
                        </div>

                    </div>
                </div>
           <% } %>
            </div>

</asp:Content>
