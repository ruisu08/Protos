<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.JugadoraEquipoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Editar Jugadora</h1>
    </div>

     <form id="validateForm" action= '<%:Url.Action("Edit","Jugadora")%>' method="post">
       
        <div id="createWrapper">
            <div class="editor-label">
                <h3>Identificacion</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.identificacion, new { @required = "required", @type = "number", @size = "11", @class = "infofield" })%>
                
            </div>

            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "45", @class = "infofield" })%>
                
            </div>
            
            <div class="editor-label">
                <h3>Apellidos</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.apellidos, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "45", @class = "infofield" })%>
                
            </div>
            
            <div class="editor-label">
                <h3>Fecha de nacimiento</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.fechaNacimiento, new { @class = "datepicker infofield" })%>
               
            </div>

            <div class="editor-label">
                <h3>Equipo</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Jugadora.Equipo_idEquipo, new SelectList(Model.Equipos, "idEquipo", "nombre", Model.Equipos.First().idEquipo), new { @class="infofield"})%>
               
            </div>

            <div class="editor-label">
                <h3>Nacionalidad</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Jugadora.nacionalidad, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "45", @class = "infofield" })%>
                
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

