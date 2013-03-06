<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles Noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles de noticias</h2>

    <fieldset>
        <legend>Informacion</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.idNoticia %></div>
        
        <div class="display-label">Titulo</div>
        <div class="display-field"><%: Model.titulo %></div>
        
        <div class="display-label">Fecha</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.fecha) %></div>
        
        <div class="display-label">Contenido</div>
        <div class="display-field"><%:Html.TextAreaFor(model => model.contenido) %></div>
        
        <div class="display-label">Estado</div>
        <div class="display-field"><%: (bool)Model.estado ? "Activa":"Inactiva"%></div>
        
        <div class="display-label">Autor</div>
        <div class="display-field"><%: Model.usuario.nombre %></div>
        
        <div class="display-label">Tipo de Noticia</div>
        <div class="display-field"><%: Model.tiponoticia.nombre %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Editar noticias", "Edit", new { id=Model.idNoticia }) %> |
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </p>

</asp:Content>

