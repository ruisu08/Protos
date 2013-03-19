<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.noticia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
    <div id="tituloContenido">
    <h1>Noticias</h1>
    <h6 id="descripcionController">Aquí puedes ver todas las noticias creadas hasta el momento</h6>
    </div>

    
</div>

    <div>
    <h2>Lista de Noticias:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nueva Noticia", "Create") %></h3>
    </div>

    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","Noticia")%>' method="post">
            <p>Buscar por tipo</p>
            <input type="text" name="tipo" class="infofield"/>
            <p>Buscar por autor (apellidos o identificación)</p>
            <input type="text" name="autor" class="infofield"/>
            <input type="submit" value="buscar" class="opcionCrud"/>
        </form>
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
                    <%: Html.ActionLink("Editar", "Edit", new { id=item.idNoticia}) %>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Detalles", "Details", new { id=item.idNoticia })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idNoticia })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Redactar noticia", "agregarContenido", new { id=item.idNoticia })%>
                    </div>
                </div>
            </div>
    <% } %>

    </div>

</asp:Content>
