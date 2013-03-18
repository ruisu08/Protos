<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.CampeonatoDivisionViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	eliminarEquipo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

         <div id="headerContenido">
        <h1>Elimina un equipo del campeonato</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("eliminarEquipo","Campeonato")%>' method="post">
        <div id="createWrapper">            
            
            <div class="editor-label">
                <h3>Selecciona el equipo que deseas eliminar</h3>
            </div>
            <div class="editor-field">
            <%if (Model.Campeonato.equipo.Count > 0)
              { %>
                <%: Html.DropDownListFor(model => model.EquipoEspecifico.idEquipo, new SelectList(Model.Campeonato.equipo, "idEquipo", "nombre", Model.Campeonato.equipo.First().idEquipo), new { @class = "infofield" })%>
            <% } %>
            <% else
              {%>
                <h4>El campeonato no tiene equipos</h4>
            <% } %>
            </div>
            
        </div>
        <%if (Model.Campeonato.equipo.Count > 0)
              { %>
            <div>
                <input type="submit" value="Eliminar equipo" class="opcionCrud" />
            </div>
            <% } %>
    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>
