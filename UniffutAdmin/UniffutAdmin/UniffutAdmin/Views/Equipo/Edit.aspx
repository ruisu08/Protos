﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.EquipoDivisionesViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Actualizar Datos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Actualizar Datos</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Informacion</legend>
            
            <div class="editor-label">
                 <h3>Abreviatura</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.equipo.abreviatura) %>
                <%: Html.ValidationMessageFor(model => model.equipo.abreviatura) %>
            </div>
            
            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.equipo.nombre) %>
                <%: Html.ValidationMessageFor(model => model.equipo.nombre) %>
            </div>
            
            <div class="editor-label">
                 <h3>Historia</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.equipo.historia) %>
                <%: Html.ValidationMessageFor(model => model.equipo.historia) %>
            </div>
            
            <div class="editor-label">
                 <h3>Campeonatos Ganados</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.equipo.campeonatosGanados) %>
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
                <input type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </div>

</asp:Content>
