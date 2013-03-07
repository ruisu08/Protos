<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.CalendarioCampeonatoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Nuevo Calendario</h2>

    <form id="validateForm" action= '<%:Url.Action("Create","Calendario")%>' method="post">
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Información</legend>
            
            <div class="editor-label">
                <h3>ID</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Calendario.idCalendario, new { @required = "required", @size = "4" })%>
                <%: Html.ValidationMessageFor(model => model.Calendario.idCalendario) %>
            </div>
            
            <div class="editor-label">
                <h3>Fecha de Inicio</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Calendario.fechaInicio, new { @class = "datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.Calendario.fechaInicio)%>
            </div>
            
            <div class="editor-label">
                <h3>Fecha Final</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Calendario.fechaFinal, new { @class = "datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.Calendario.fechaFinal)%>
            </div>
            
            <div class="editor-label">
                <h3>Campeonato</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Calendario.idCampeonato, new SelectList(Model.Campeonato, "idCampeonato", "nombre", Model.Campeonato.First().idCampeonato))%>
                <%: Html.ValidationMessageFor(model => model.Calendario.idCampeonato)%>
            </div>
            
            <p>
                <input type="submit" value="Crear calendario" />
            </p>
        </fieldset>

    </form>

    <div>
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </div>

</asp:Content>

