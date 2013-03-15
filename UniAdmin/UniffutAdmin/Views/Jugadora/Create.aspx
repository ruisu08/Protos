<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.JugadoraEquipoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva Jugadora
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Crea un nueva jugadora</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Create","Jugadora")%>' method="post">
        
        <div id="createWrapper">
            
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
                <%: Html.TextBoxFor(model => model.Jugadora.nombre, new { @required = "required", @pattern = "[a-zA-Z]{1,}", @maxlength = "45", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.nombre)%>
            </div>
            
            <div class="editor-label">
                <h3>Apellidos</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.apellidos, new { @required = "required", @pattern = "[a-zA-Z]{1,}", @maxlength = "45", @class = "infofield" })%>
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
                <%: Html.TextBoxFor(model => model.Jugadora.nacionalidad, new { @required = "required", @pattern = "[a-zA-Z]{1,}", @maxlength = "45", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Jugadora.nacionalidad)%>
            </div>
            
        </div>

            <div>
                <input type="submit" value="Crear nueva jugadora" class="opcionCrud" />
            </div>

    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>

