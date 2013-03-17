<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.NoticiaViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar noticia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Editar Noticia</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Edit","Noticia")%>' method="post">
        <div id="createWrapper">            
            
            <div class="editor-label">
               <h3>Titulo</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Noticia.titulo, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "30", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Noticia.titulo)%>
            </div>
            
            <div class="editor-label">
                <h3>Fecha</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Noticia.fecha, new { @class = "datepicker infofield" })%>
                
            </div>
            
            <div class="editor-label">
                <h3>Autor</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Noticia.autor, new SelectList(Model.Usuarios, "idUsuario", "idUsuario", Model.Usuarios.First().idUsuario), new { @class="infofield" })%>
                
            </div>
            
            <div class="editor-label">
                <h3>Tipo de noticia</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Noticia.TipoNoticia_idTipoNoticia, new SelectList(Model.Tipos, "idTipoNoticia", "nombre", Model.Tipos.First().idTipoNoticia), new { @class="infofield"})%>
                
            </div>

        </div>
            
            <div>
                <input type="submit" value="Guardar" class="opcionCrud" />
            </div>

    </form>

    <div>
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </div>

</asp:Content>

