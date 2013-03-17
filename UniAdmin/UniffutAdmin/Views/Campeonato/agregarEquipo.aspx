<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.CampeonatoDivisionViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	agregarEquipo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div id="headerContenido">
        <h1>Agrega un equipo al campeonato</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("agregarEquipo","Campeonato")%>' method="post">
        <div id="createWrapper">            
            
            <div class="editor-label">
                <h3>Selecciona el equipo</h3>
                <h6>Solo se permiten equipos de una misma división</h6>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.EquipoEspecifico.idEquipo, new SelectList(Model.Campeonato.division.equipo, "idEquipo", "nombre", Model.Campeonato.division.equipo.First().idEquipo), new { @class = "infofield" })%>
            </div>
            
        </div>
            <div>
                <input type="submit" value="Agregar equipo" class="opcionCrud" />
            </div>

    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>
