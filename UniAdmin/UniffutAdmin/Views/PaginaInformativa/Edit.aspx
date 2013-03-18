<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.PaginaInformativaUsuarioViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Editar Pagina Informativa</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Edit","PaginaInformativa")%>' method="post">
        <div id="createWrapper">            
            
            <div class="editor-label">
               <h3>Titulo</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Pagina.titulo, new { @required = "required", @maxlength = "45", @class = "infofield" })%>
            </div>
            
            <div class="editor-label">
                <h3>Fecha</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Pagina.fecha, new { @class = "datepicker infofield" })%>
                
            </div>
            
            <div class="editor-label">
                <h3>Autor</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Pagina.autor, new SelectList(Model.Usuario, "idUsuario", "nombre", Model.Usuario.First().idUsuario), new { @class="infofield" })%>
                
            </div>
            
        </div>
            
            <div>
                <input type="submit" value="Guardar" class="opcionCrud" />
            </div>

    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>

