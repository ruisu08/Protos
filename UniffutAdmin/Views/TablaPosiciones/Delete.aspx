<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.equipo_has_campeonato>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Equipo</div>
        <div class="display-field"><%: Model.equipo.nombre %></div>
        
        <div class="display-label">Campeonato</div>
        <div class="display-field"><%: Model.campeonato.nombre %></div>
        
        <div class="display-label">Puntos</div>
        <div class="display-field"><%: Model.puntos %></div>
        
        <div class="display-label">Estado</div>
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
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Borrar" /> |
		    <%: Html.ActionLink("Volver a la lista", "Index") %>
        </p>
    <% } %>

</asp:Content>

