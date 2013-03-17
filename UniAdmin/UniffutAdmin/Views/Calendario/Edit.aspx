<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.CalendarioCampeonatoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Editar Calendario</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Edit","Calendario")%>' method="post">
        <div id="createWrapper">
            
            <div class="editor-label">
                <h3>Fecha de Inicio</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Calendario.fechaInicio, new { @class = "datepicker infofield" })%>
               
            </div>
            
            <div class="editor-label">
                <h3>Fecha Final</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Calendario.fechaFinal, new { @class = "datepicker infofield" })%>
                
            </div>
            
            <div class="editor-label">
                <h3>Campeonato</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Calendario.idCampeonato, new SelectList(Model.Campeonato, "idCampeonato", "nombre", Model.Campeonato.First().idCampeonato), new { @class="infofield"})%>
                
            </div>
            
        </div>
            <div>
                <input type="submit" value="Guardar" class="opcionCrud" />
            </div>

    </form>

    <div>
        <%: Html.ActionLink("Volver a la Lista", "Index") %>
    </div>

</asp:Content>

