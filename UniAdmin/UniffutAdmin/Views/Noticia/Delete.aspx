﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar noticia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar Noticia</h1>
        <h3>Solo pasara a inactivo</h3>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","Noticia")%>' method="post">
        
        <div id="detallesWrapper">

        <div class="nombrePropiedadDetalle"><h3>ID (en la base de datos)</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.idNoticia %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Titulo</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.titulo %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Tipo de Noticia</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.tiponoticia %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Fecha</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.fecha %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Autor</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.autor %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Resumen</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.resumen %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Estado</h3></div>
        <div class="propiedadDetalle"><h4><%: (bool)Model.estado ? "Activo":"Inactivo" %></h4></div>
        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" />
        </div>
    </form>

</asp:Content>

