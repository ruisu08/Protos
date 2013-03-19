<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.patrocinador>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Patrocinadores
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div id="headerContenido">
    <div id="tituloContenido">
    <h1>Patrocinadores</h1>
    <h6 id="descripcionController">Aquí puedes ver todas las patrocinadores creados hasta el momento</h6>
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
    <h2>Lista de Patrocinadores:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nuevo Patrocinador", "Create") %></h3>
    </div>

 <div id="indexWrapper">

    <% foreach (var item in Model) { %>
            <div class="itemWrapper">
                <div class="indexData">
                    <h3>Nombre:</h3>
                    <h4><%:item.nombre %></h4>
                </div>
                <div class="indexData">
                    <h3>Fecha de ingreso:</h3>
                    <h4><%:item.fechaIngreso%></h4>
                </div>
                <div class="indexData">
                    <h3>Fecha de salida:</h3>
                    <h4><%:item.fechaSalida%></h4>
                </div>
                <div id="opcionWrapper">
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Editar", "Edit", new { id=item.idPatrocinador}) %>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Detalles", "Details", new { id=item.idPatrocinador })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Eliminar", "Delete", new { id=item.idPatrocinador })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Asignar multimedia", "agregarMultimedia", new { id=item.idPatrocinador })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Ver multimedia", "verMultimedia", new { id=item.idPatrocinador })%>
                    </div>
                </div>
            </div>
    <% } %>

    </div>

</asp:Content>
