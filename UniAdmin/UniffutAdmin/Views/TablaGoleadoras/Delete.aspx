<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.goleadoras>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <div id="headerContenido">
        <h1>Eliminar Tabla Goleadoras</h1>
        <h2><%:" "+Model.campeonato.nombre%></h2>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","TablaGoleadoras")%>' method="post">
        
        <div id="detallesWrapper">
        <div class="nombrePropiedadDetalle"><h3>Campeonato</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.campeonato.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Goleadora</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.jugadora.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Goles</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.goles %></h4></div>
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" data-confirm= "Esta seguro que desea eliminar este partido?" />
        </div>
    </form>
    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index", new { id = Model.idCampeonato })%></h3>
     </div>

</asp:Content>
