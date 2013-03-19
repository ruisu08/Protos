<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.pagina_informativa>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Páginas Informativas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
    <div id="tituloContenido">
    <h1>Páginas Informativas</h1>
    <h6 id="descripcionController">Aquí puedes ver todas las páginas informativas creadas hasta el momento</h6>
    </div>

    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","Noticia")%>' method="post">
            <p>Buscar por nombre</p>
            <input type="text" name="identificacion" />
            <input type="submit" value="buscar" id="opcionCrud"/>
        </form>
    </div>
</div>

    <div>
    <h2>Lista de Páginas informativas:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nueva Página informativa", "Create") %></h3>
    </div>

 <div id="indexWrapper">

    <% foreach (var item in Model) { %>
            <div class="itemWrapper">
                <div class="indexData">
                    <h3>Título:</h3>
                    <h4><%:item.titulo %></h4>
                </div>
                <div class="indexData">
                    <h3>Autor:</h3>
                    <h4><%:item.usuario.identificacion%></h4>
                </div>
                <div class="indexData">
                    <h3>Fecha:</h3>
                    <h4><%:item.fecha%></h4>
                </div>
                <div id="opcionWrapper">
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Editar", "Edit", new { id=item.idPagina_Informativa}) %>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Detalles", "Details", new { id=item.idPagina_Informativa })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idPagina_Informativa })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Redactar contenido", "agregarContenido", new { id=item.idPagina_Informativa })%>
                    </div>
                </div>
            </div>
    <% } %>

    </div>


</asp:Content>
