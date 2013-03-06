<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.CampeonatoDivisionViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear nuevo Campeonato
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear nuevo Campeonato</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Informacion</legend>
            
            <div class="editor-label">
                <h3>ID del Campeonato</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Campeonato.idCampeonato, new { @maxlength = "10" })%>
                <%: Html.ValidationMessageFor(model => model.Campeonato.idCampeonato)%>
            </div>
            
            <div class="editor-label">
                <h3>Nombre del Campeonato</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Campeonato.nombre, new { @maxlength = "45" })%>
                <%: Html.ValidationMessageFor(model => model.Campeonato.nombre)%>
            </div>
            
            <div class="editor-label">
                <h3>Descripcion</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Campeonato.descripcion, new { @maxlength = "140" })%>
                <%: Html.ValidationMessageFor(model => model.Campeonato.descripcion)%>
            </div>
            
            <div class="editor-label">
                <h3>Division en la que se encuentra</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Campeonato.idDivision, new SelectList(Model.Divisiones, "idDivisiones", "nombre", Model.Divisiones.First().idDivisiones))%>
                <%: Html.ValidationMessageFor(model => model.Campeonato.idDivision)%>
            </div>
            
            <p>
                <input type="submit" value="Añadir Campeonato" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Regresar a la lista", "Index") %>
    </div>

</asp:Content>

