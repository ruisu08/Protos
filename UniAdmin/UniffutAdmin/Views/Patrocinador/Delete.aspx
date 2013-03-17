<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.patrocinador>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar Patrocinador</h1>
        <h3>Solo pasara a inactivo</h3>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","Patrocinador")%>' method="post">
        
        <div id="detallesWrapper">

        <div class="nombrePropiedadDetalle"><h3>ID (en la base de datos)</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.idPatrocinador %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Nombre</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Fecha Ingreso</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fechaIngreso %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Fecha Salida</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fechaSalida %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Descripcion</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.descripcion %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Imagen</h3></div>
        <div class="propiedadDetalle"><h4><%:new HtmlString (HttpUtility.HtmlDecode(Model.fuenteGrafica))%></h4></div>  
        <div class="nombrePropiedadDetalle"><h3>Estado</h3></div>
        <div class="propiedadDetalle"><h4><%: (bool)Model.estado ? "Activo":"Inactivo" %></h4></div>
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" />
        </div>
    </form>
</asp:Content>

