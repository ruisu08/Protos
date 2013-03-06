<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar noticia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Eliminar</h2>

    <h4>Esto pondra el estado como inactivo, aun asi aparecera en la lista pero no en la pagina</h4>
    <fieldset>
        <legend>Informacion</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.idNoticia %></div>
        
        <div class="display-label">Titulo</div>
        <div class="display-field"><%: Model.titulo %></div>
        
        <div class="display-label">Fecha</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.fecha) %></div>
        
        <div class="display-label">Contenido</div>
        <div class="display-field"><%: Model.contenido %></div>
        
        <div class="display-label">Estado</div>
        <div class="display-field"><%: Model.estado %></div>
        
        <div class="display-label">Autor</div>
        <div class="display-field"><%: Model.autor %></div>
        
        <div class="display-label">TipoNoticia</div>
        <div class="display-field"><%: Model.tiponoticia.nombre %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Eliminar" /> |
		    <%: Html.ActionLink("Volver a lista", "Index") %>
        </p>
    <% } %>

</asp:Content>

