<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.anuncio>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar anuncio
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar Anuncio</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","Anuncio")%>' method="post">
        
        <div id="detallesWrapper">

        <div class="nombrePropiedadDetalle"><h3>Nombre</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Fecha Ingreso</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fechaInicio %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Fecha Salida</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fechaFinal %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Imagen</h3></div>
        <div class="propiedadDetalle"><h4><%:new HtmlString (HttpUtility.HtmlDecode(Model.fuenteGrafica))%></h4></div>  
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" />
        </div>
    </form>
</asp:Content>