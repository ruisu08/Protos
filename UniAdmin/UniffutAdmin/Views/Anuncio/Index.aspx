﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.anuncio>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Anuncios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


 <div id="topBar">
            <div id="searchBar"> 
                <form id="searchForm" action= '<%:Url.Action("Search","Anuncio")%>' method="post">
                        <input type="submit"  value="Buscar" id="searchButton"/>
                        <input type="text" name="nombre" class="searchText" id="searchBoxOne" value="Buscar por nombre"/>
                </form>
            </div>
            <div id="logOut" class="opcionLogOut">
                <%:Html.ActionLink("Cerrar sesión","LogOut","Login") %>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Anuncio:</h1>
                <h4 id="contenidoDescripcion">Administración de base de datos de anuncios de la Uniffut</h4>
            </div>
            <div id="contenedorCrear">
                <%:Html.ActionLink("Crear nuevo anuncio", "Create") %>
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
                            <%: Html.ActionLink("Editar", "Edit", new { id=item.idAnuncio}) %>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Detalles", "Details", new { id=item.idAnuncio})%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Asignar media", "agregarMultimedia", new { id=item.idAnuncio })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Ver media", "verMultimedia", new { id=item.idAnuncio })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idAnuncio})%>
                        </div>
                    </div>
                </div>
           <% } %>
            </div>

</asp:Content>

