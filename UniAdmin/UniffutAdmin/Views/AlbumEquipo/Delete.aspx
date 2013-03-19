<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.album_equipo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar Ablum
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar Ablum</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Delete","AlbumEquipo")%>' method="post">
        
        <div id="detallesWrapper">


        <div class="nombrePropiedadDetalle"><h3>Nombre</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nombre %></h4></div>

        </div>

        <div>
              <input type="submit" value="Eliminar Datos" class="opcionCrud" />
        </div>
    </form>

</asp:Content>

