<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.pagina_informativa>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar página Live your goals
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar página Live your goals</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","LiveYourGoals")%>' method="post">
        
        <div id="detallesWrapper">


        <div class="nombrePropiedadDetalle"><h3>Titulo</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.titulo %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Autor</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.autor %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Fecha</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fecha %></h4></div>
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" />
        </div>
    </form>

</asp:Content>
