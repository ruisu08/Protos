<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.division>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Editar Division</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Edit","Division")%>' method="post">
        <div id="createWrapper">
             <div class="editor-label">
                <h3>Abreviatura</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.abreviatura, new { @required = "required", @name = "abrev", @pattern = "[a-zA-Z ]{2,}", @maxlength = "10", @class = "infofield" })%>
                
            </div>

            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "30", @class = "infofield" })%>
                
            </div>
            
            <div class="editor-label">
                <h3>Descripcion</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.descripcion, new { @required = "required", @pattern = "[a-zA-Z]{2,}", @maxlength = "150", @class = "infofield" })%>
                
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

