<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.JugadoraEquipoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

     <form id="validateForm" action= '<%:Url.Action("Edit","Jugadora")%>' method="post">
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Informacion</legend>
            <div class="editor-label">
                <h3>Identificacion</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.identificacion, new { @required = "required", @type="number", @size = "20" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.identificacion)%>
            </div>

            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "45" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.nombre)%>
            </div>
            
            <div class="editor-label">
                <h3>Apellidos</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.apellidos, new { @required = "required",  @pattern = "[a-zA-Z ]{2,}", @maxlength = "45" })%>
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
                <%: Html.DropDownListFor(model => model.Jugadora.Equipo_idEquipo, new SelectList(Model.Equipos,"idEquipo","nombre",Model.Equipos.First().idEquipo))%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.Equipo_idEquipo)%>
            </div>

            <div class="editor-label">
                <h3>Nacionalidad</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "45" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.nacionalidad)%>
            </div>
            
            <p>
                <input type="submit" value="Actualizar" />
            </p>
        </fieldset>

    </form>

    <div>
        <%: Html.ActionLink("Volver a lista", "Index") %>
    </div>

</asp:Content>

