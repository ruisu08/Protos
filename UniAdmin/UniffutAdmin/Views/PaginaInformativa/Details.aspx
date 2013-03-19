<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.pagina_informativa>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="detallesTitulo">
        <h1>Detalles de la página informativa:</h1>
        <h2><%:" "+Model.titulo%></h2>
    </div>
    <div id="detallesWrapper">
        <div class="nombrePropiedadDetalle"><h3>Fecha/h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fecha %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Autor</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.usuario.identificacion %></h4></div>
    </div>
    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver a la Lista", "Index") %></h3>
     </div>

</asp:Content>

