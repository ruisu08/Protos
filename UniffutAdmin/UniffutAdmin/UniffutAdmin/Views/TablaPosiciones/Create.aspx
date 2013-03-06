<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.TablaPosicionesEquipoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear tabla de posiciones</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Informacion</legend>
            
            <div class="editor-label">
                <h3>Equipo</h3>
            </div>
            <div class="editor-field">
                <%:Html.DropDownListFor(model => model.tablaPosiciones.Equipo_idEquipo, new SelectList(Model.equipos, "idEquipo", "nombre", Model.equipos.First().idEquipo)) %>
                <%: Html.ValidationMessageFor(model => model.tablaPosiciones.Equipo_idEquipo) %>
            </div>
            
            <div class="editor-label">
                <h3>Campeonato</h3>
            </div>
            <div class="editor-field">
                <% if (Model.campeonatos.Count == 0)
                   {
                       Response.Write("No hay campeonatos disponibles");
                       return;
                   }%>
                <%: Html.DropDownListFor(model => model.tablaPosiciones.Campeonato_idCampeonato, new SelectList(Model.campeonatos, "idCampeonato", "nombre", Model.campeonatos.First().idCampeonato))%>     
                <%: Html.ValidationMessageFor(model => model.tablaPosiciones.Campeonato_idCampeonato) %>
            </div>
            
            <div class="editor-label">
                <h3>Puntos</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.tablaPosiciones.puntos) %>
                <%: Html.ValidationMessageFor(model => model.tablaPosiciones.puntos) %>
            </div>
            
            <p>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </div>

</asp:Content>

