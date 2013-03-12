<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.CalendarioCampeonatoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar</h2>

    <form id="validateForm" action= '<%:Url.Action("Edit","Calendario")%>' method="post">
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
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
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    </form>

    <div>
        <%: Html.ActionLink("Volver a la Lista", "Index") %>
    </div>

</asp:Content>

