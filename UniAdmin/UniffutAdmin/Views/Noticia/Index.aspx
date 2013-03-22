﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.noticia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <div id="topBar">
            <div id="searchBar"> 
                <form id="searchForm" action= '<%:Url.Action("Search","Noticia")%>' method="post">
                        <input type="submit"  value="Buscar" id="searchButton"/>
                        <input type="text" name="tipo" class="searchText" id="searchBoxOne" value="Buscar por tipo"/>
                        <input type="text" name="autor"  class="searchText" id="searchBoxTwo" value="Buscar por autor"/>
                </form>
            </div>
            <div id="logOut" class="opcionLogOut">
                <a href="#">Cerrar sesión</a>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Noticias:</h1>
                <h4 id="contenidoDescripcion">Administración de base de datos de noticias de la Uniffut</h4>
            </div>
            <div id="contenedorCrear">
                <%:Html.ActionLink("Crear nueva noticia", "Create") %>
            </div>
        </div>
        <div id="contenidoEspecifico">
        <% foreach (var item in Model) { %>
                <div class="itemWrapper">
                    <div class="info">
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Título</p></div>
                            <div class="infoText"><p><%:item.titulo%></p></div>
                        </div>
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Autor</p></div>
                            <div class="infoText"><p><%:item.usuario.nombre + " "+item.usuario.apellido%></p></div>
                        </div>
                        <div class="itemInfo" >
                            <div class="infoTitle"><p>Tipo</p></div>
                            <div class="infoText"><p><%:item.tiponoticia.nombre%></p></div>
                        </div>
                    </div>
                    <div class="options">
                        <div class="itemOption">
                            <%: Html.ActionLink("Editar", "Edit", new { id=item.idNoticia}) %>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Detalles", "Details", new { id=item.idNoticia })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Redactar noticia", "agregarContenido", new { id=item.idNoticia })%>
                        </div>
                        <div class="itemOption">
                            <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idNoticia })%>
                        </div>
                    </div>
                </div>
           <% } %>
            </div>

</asp:Content>

