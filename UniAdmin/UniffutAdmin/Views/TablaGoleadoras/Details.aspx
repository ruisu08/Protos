<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.goleadoras>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="topBar">
            <div id="searchBar"> 
                
            </div>
            <div id="logOut" class="opcionLogOut">
                <%:Html.ActionLink("Cerrar sesión","LogOut","Login") %>
            </div>
        </div>
        <div id="contenidoHeader">
            <div id="contenedorContenidoTitulo">
                <h1 id="contenidoTitulo">Tabla de Goleadoras:</h1>
            </div>
            <div id="contenedorCrear">
                <%:Html.ActionLink("Agregar Goleadora", "Create", new { id = Model.idCampeonato })%><br /><br />
                <%:Html.ActionLink("Eliminar Goleadora", "Delete", new { id=Model.idCampeonato})%>
            </div>
        </div>

    <div id="detallesWrapper">
        <%  
            
            var ordered = Model.campeonato.goleadoras.OrderBy(ta => ta.goles);
            var reversed = ordered.Reverse();
            for (int i = 0; i < Model.campeonato.goleadoras.Count; i++)
           {
                
               var list = reversed.ToList();
               var t = list[i];%>
               <% if (i % 2 == 0)
                  {%>
                        <div class="nombrePropiedadDetalle"><h3>Jugadora:<%:" " + t.jugadora.nombre%> </h3><h3>Goles:<%:" " + t.goles%> </h3> 
                        <div class="opcionTabla">
                            <%: Html.ActionLink("Modificar Goles", "Edit", new { id=t.idCampeonato, goleadoras = t.campeonato.goleadoras}) %>
                        </div>                  
                        </div>
                        
               <% } %>
               <% else
                  { %>
                        <div class="propiedadDetalle"><h3>Jugadora:<%:" " + t.jugadora.nombre%> </h3><h3>Goles:<%:" " + t.goles%> </h3> 
                        <div class="opcionTabla">
                             <%: Html.ActionLink("Modificar Goles", "Edit", new { id=t.idCampeonato, goleadoras = t.campeonato.goleadoras}) %>
                        </div>                      
                        </div>
                        

               <% } %>
          
        <%} %>
    </div>
    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver a la lista", "Index", "Campeonato") %></h3>
     </div>

</asp:Content>

