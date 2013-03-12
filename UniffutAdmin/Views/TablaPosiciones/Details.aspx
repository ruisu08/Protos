<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.equipo_has_campeonato>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label" style="text-decoration:underline;">Equipo</div>
        <div class="display-field"><%: Model.equipo.nombre %></div>
        
        <div class="display-label" style="text-decoration:underline;">Campeonato</div>
        <div class="display-field"><%: Model.campeonato.nombre %></div>
        
        <div class="display-label" style="text-decoration:underline;">Puntos</div>
        <div class="display-field"><%: Model.puntos %></div>
        
        <div class="display-label" style="text-decoration:underline;">Estado</div>
        <div class="display-field"><%if (Model.estado == true)
                                          Response.Write("Activa");
                                      else
                                      {
                                          if (Model.estado == null)
                                          {
                                              Response.Write("Inactiva");
                                              Model.estado = false;
                                              return;
                                          }
                                          Response.Write("Inactiva");
                                      } %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Actualizar Datos", "Edit", new { id=Model.Equipo_idEquipo }) %> |
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </p>

</asp:Content>

