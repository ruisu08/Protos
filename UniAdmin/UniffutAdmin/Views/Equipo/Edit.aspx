<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.EquipoDivisionesViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Actualizar Datos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Actualizar Datos</h2>

    <form id="validateForm" action= '<%:Url.Action("Edit","Equipo")%>' method="post">
        <%: Html.ValidationSummary(true) %>
        
            
            <div class="editor-label">
                 <h3>Abreviatura</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.equipo.abreviatura, new { @required = "required", @name = "Abrev", @pattern = "[a-zA-Z ]{2,}", @maxlength = "10" })%>
                <%: Html.ValidationMessageFor(model => model.equipo.abreviatura) %>
            </div>
            
            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.equipo.nombre, new { @required = "required", @name = "name", @pattern = "[a-zA-Z ]{5,}", @maxlength = "40" })%>
                <%: Html.ValidationMessageFor(model => model.equipo.nombre) %>
            </div>
            
            <div class="editor-label">
                 <h3>Historia</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.equipo.historia, new {@encoding="xml"}) %>
                <%: Html.ValidationMessageFor(model => model.equipo.historia) %>
            </div>
            
            <div class="editor-label">
                 <h3>Campeonatos Ganados</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.equipo.campeonatosGanados, new { @required = "required", @name = "champs", @size = "4" })%>
                <%: Html.ValidationMessageFor(model => model.equipo.campeonatosGanados) %>
            </div>
            
            <div class="editor-label">
                 <h3>Divisiones</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.equipo.idDivision, new SelectList(Model.divisiones, "idDivisiones","nombre", Model.divisiones.First().idDivisiones)) %>
                <%: Html.ValidationMessageFor(model => model.equipo.idDivision) %>
            </div>
            
            <p>
                <input type="submit" value="Guardar" id="submitBTN" />
            </p>

    </form>

    <div>
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </div>

</asp:Content>

