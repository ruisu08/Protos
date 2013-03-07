<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.division>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar Division</h2>

    <form id="validateForm" action= '<%:Url.Action("Edit","Division")%>' method="post">
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Información</legend>
             <div class="editor-label">
                <h3>Abreviatura</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.abreviatura,new { @required = "required", @name = "abrev", @pattern = "[a-zA-Z ]{2,}", @maxlength = "10" })%>
                <%: Html.ValidationMessageFor(model => model.abreviatura) %>
            </div>

            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "30" }) %>
                <%: Html.ValidationMessageFor(model => model.nombre) %>
            </div>
            
            <div class="editor-label">
                <h3>Descripcion</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.descripcion, new { @required = "required", @pattern = "[a-zA-Z0-9 ]{2,}", @maxlength = "150" }) %>
                <%: Html.ValidationMessageFor(model => model.descripcion) %>
            </div>

            <p>
                <input type="submit" value="Actualizar" />
            </p>
        </fieldset>

    </form>

    <div>
        <%: Html.ActionLink("Regresar a la lista", "Index") %>
    </div>

</asp:Content>

