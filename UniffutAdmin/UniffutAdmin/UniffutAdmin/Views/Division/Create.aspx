<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.division>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Division
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Division</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Informacion</legend>
            <div class="editor-label">
                <h3>Abreviatura</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.abreviatura, new { @maxlength = "10" })%>
                <%: Html.ValidationMessageFor(model => model.abreviatura) %>
            </div>

            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre, new { @maxlength = "45" })%>
                <%: Html.ValidationMessageFor(model => model.nombre) %>
            </div>
            
            <div class="editor-label">
                <h3>Descripcion</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.descripcion, new { @maxlength = "45" })%>
                <%: Html.ValidationMessageFor(model => model.descripcion) %>
            </div>
            
            <p>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Regresar a la lista", "Index") %>
    </div>

</asp:Content>

