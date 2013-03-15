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

    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","Noticia")%>' method="post">
            <p>Buscar por nombre</p>
            <input type="text" name="identificacion" />
            <input type="submit" value="buscar" id="opcionCrud"/>
        </form>
    </div>
</div>

    <div>
    <h2>Lista de Noticias:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nueva Noticia", "Create") %></h3>
    </div>

    <div id="tableWrapper">
    <table id="indTable">
        <tr>
            <th></th>
            <th>
                Titulo
            </th>
            <th>
                Fecha
            </th>
            <th>
                Autor
            </th>
            <th>
                Tipo de Noticia
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
            <div class="opcionCrud">
                <%: Html.ActionLink("Editar Noticia", "Edit", new { id=item.idNoticia}) %>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Detalles del Noticia", "Details", new { id=item.idNoticia })%>
            </div>
            <div class="opcionCrud">
                <%: Html.ActionLink("Eliminar este Noticia", "Delete", new { id=item.idNoticia })%>
            </div>

            </td>
           
            <td>
                <%: item.titulo %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.fecha) %>
            </td>
            <td>
                <%: item.usuario.nombre + " " + item.usuario.apellido %>
            </td>
            <td>
                <%: item.tiponoticia.nombre%>
            </td>
        </tr>
    
    <% } %>

    </table>
    </div>


</asp:Content>

