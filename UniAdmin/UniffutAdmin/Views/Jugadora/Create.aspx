<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.JugadoraEquipoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva Jugadora
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Nueva Jugadora</h2>

    <form id="validateForm" action= '<%:Url.Action("Create","Jugadora")%>' method="post">
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Información</legend>
            
            <div class="editor-label">
                <h3>Identificacion</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.identificacion, new { @required = "required", @type = "number", @size = "20", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.identificacion)%>
            </div>
            
            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{5,}", @maxlength = "45", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.nombre)%>
            </div>
            
            <div class="editor-label">
                <h3>Apellidos</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.apellidos, new { @required = "required", @pattern = "[a-zA-Z ]{5,}", @maxlength = "45", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.apellidos)%>
            </div>
            
            <div class="editor-label">
                <h3>Fecha de nacimiento</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.fechaNacimiento, new { @class = "datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.fechaNacimiento)%>
            </div>
            
            <div class="editor-label">
                <h3>Historia</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Jugadora.historia, new { @maxlength = "500" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.historia)%>
            </div>
            
            <div class="editor-label">
                <h3>Equipo</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Jugadora.Equipo_idEquipo, new SelectList(Model.Equipos, "idEquipo", "nombre", Model.Equipos.First().idEquipo), new { @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.Equipo_idEquipo)%>
            </div>

            <div class="editor-label">
                <h3>Nacionalidad</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.nacionalidad, new { @required = "required", @pattern = "[a-zA-Z ]{5,}", @maxlength = "45", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.nacionalidad)%>
            </div>
            
            <p>
                <input type="submit" value="Añadir Jugadora" />
            </p>
        </fieldset>

    </form>

    <div>
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </div>

</asp:Content>

