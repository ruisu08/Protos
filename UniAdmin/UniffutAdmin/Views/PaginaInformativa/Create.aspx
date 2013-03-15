<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.pagina_informativa>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Pagina Informativa</h2>

    <form id="validateForm" action= '<%:Url.Action("Create","PaginaInformativa")%>' method="post">
        <%: Html.ValidationSummary(true) %>

            <div class="editor-label">
                <h3>Titulo</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.titulo, new { @required = "required", @maxlength = "30", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.titulo) %>
            </div>
            
            <div class="editor-label">
               <h3>Fecha</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.fecha, new { @required = "required", @maxlength = "30", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.fecha) %>
            </div>
            
            <div class="editor-label">
                <h3>Contenido</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.contenido, new { @required = "required", @maxlength = "50", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.contenido) %>
            </div>
           
            <div class="editor-label">
               <h3>Autor</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.autor, new { @required = "required", @maxlength = "30", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.autor) %>
            </div>
            
            <p>
                <input type="submit" value="Create" id="opcionCrud"/>
            </p>
    
        </form>
    <div>
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </div>

</asp:Content>

