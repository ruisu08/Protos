<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.PaginaInformativaUsuarioViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Patrocinador
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Crear una nueva pagina informativa</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Create","PaginaInformativa")%>' method="post">

        <div id="createWrapper">
            
            <div class="editor-label">
                <h2>Titulo</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Pagina.titulo, new { @required = "required", @pattern = "[a-zA-Z ]{1,}", @maxlength = "20", @class = "infofield" })%>
            </div>
            
            <div class="editor-label">
               <h2>Fecha</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Pagina.fecha, new { @class = "datepicker infofield" })%>
            </div>
            
            <div class="editor-label">
                <h2>Autor</h2>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Pagina.autor, new SelectList(Model.Usuario, "idUsuario", "nombre", Model.Usuario.First().idUsuario), new { @class="infofield"})%>
            </div>
        </div>
            
            <div>
                <input type="submit" value="Crear nueva pagina informativa" class="opcionCrud" />
            </div>
        

    </form>

    <div id="Div1">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>

