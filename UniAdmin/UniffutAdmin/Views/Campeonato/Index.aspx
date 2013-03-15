<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.campeonato>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Campeonatos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="headerContenido">
    <div id="tituloContenido">
    <h1>Campeonatos</h1>
    <h6 id="descripcionController">Aquí puedes los campeonatos creados, además de poder editarlos, eliminarlos o crearlos</h6>
    </div>

    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","Campeonato")%>' method="post">
            <p>Buscar por nombre</p>
            <input type="text" name="identificacion" />
            <input type="submit" value="buscar" id="opcionCrud"/>
        </form>
    </div>
</div>

    <h2>Lista de Campeonatos:</h2>
    <h3 id="crearLink"><%:Html.ActionLink("Crear nuevo Campeonato", "Create") %></h3>

        <div id="indexWrapper">

    <% foreach (var item in Model) { %>
            <div class="itemWrapper">
                <div class="indexData">
                    <h3>Nombre:</h3>
                    <h4><%:item.nombre %></h4>
                </div>
                <div class="indexData">
                    <h3>División:</h3>
                    <h4><%:item.division.nombre %></h4>
                </div>
                <div id="opcionWrapper">
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Editar Campeonato", "Edit", new { id=item.idCampeonato}) %>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Detalles del Campeonato", "Details", new { id=item.idCampeonato })%>
                    </div>
                    <div class="opcionCrud">
                    <%: Html.ActionLink("Eliminar este Campeonato", "Delete", new { id=item.idCampeonato })%>
                    </div>
                </div>
            </div>
    <% } %>

    </div>

</asp:Content>

