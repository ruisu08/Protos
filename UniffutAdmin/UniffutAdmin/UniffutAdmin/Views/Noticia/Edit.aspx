<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.NoticiaViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar noticia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar noticia</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Informacion</legend>
            
            
            <div class="editor-label">
               <h3>Titulo</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Noticia.titulo)%>
                <%: Html.ValidationMessageFor(model => model.Noticia.titulo)%>
            </div>
            
            <div class="editor-label">
                <h3>Fecha</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Noticia.fecha, new { @class = "datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.Noticia.fecha) %>
            </div>
            
            <div class="editor-label">
               <h3>Contenido</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Noticia.contenido)%>
                <%: Html.ValidationMessageFor(model => model.Noticia.contenido)%>
            </div>
            
            <div class="editor-label">
                <h3>Autor</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Noticia.autor, new SelectList(Model.Usuarios, "idUsuario", "idUsuario", Model.Usuarios.First().idUsuario))%>
                <%: Html.ValidationMessageFor(model => model.Noticia.autor)%>
            </div>
            
            <div class="editor-label">
                <h3>Tipo de noticia</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Noticia.TipoNoticia_idTipoNoticia, new SelectList(Model.Tipos, "idTipoNoticia", "nombre", Model.Tipos.First().idTipoNoticia))%>
                <%: Html.ValidationMessageFor(model => model.Noticia.TipoNoticia_idTipoNoticia)%>
            </div>
            
            <p>
                <input type="submit" value="Salvar cambios" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Volver a lista", "Index") %>
    </div>

</asp:Content>

