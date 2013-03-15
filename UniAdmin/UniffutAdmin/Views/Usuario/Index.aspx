<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.usuario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Usuarios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="headerContenido">
    <div id="tituloContenido">
    <h1>Usuarios</h1>
    <h6 id="descripcionController">Aquí puedes ver los usuarios existentes, además de crear, editar o eliminar los existentes</h6>
    </div>

    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","Usuario")%>' method="post">
            <p>Buscar por nombre</p>
            <input type="text" name="identificacion" />
            <input type="submit" value="buscar" id="opcionCrud"/>
        </form>
    </div>
</div>

    <div>
    <h2>Lista de Usuarios:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nuevo Usuario", "Create") %></h3>
    </div>

    <div id="indexWrapper">

    <% foreach (var item in Model) { %>
            <div class="itemWrapper">
                <div class="indexData">
                    <h3>Nombre:</h3>
                    <h4><%:item.nombre %></h4>
                </div>
                <div class="indexData">
                    <h3>Apellido:</h3>
                    <h4><%:item.apellido %></h4>
                </div>
                <div class="indexData">
                    <h3>Identificación:</h3>
                    <h4><%:item.identificacion %></h4>
                </div>
                <div id="opcionWrapper">
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Editar Usuario", "Edit", new { id=item.idUsuario}) %>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Detalles del Usuario", "Details", new { id=item.idUsuario })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Eliminar este Usuario", "Delete", new { id=item.idUsuario })%>
                    </div>
                </div>
            </div>
    <% } %>

    </div>

</asp:Content>

