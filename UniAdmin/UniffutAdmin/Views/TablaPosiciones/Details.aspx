<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.tabla_posiciones>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tabla de posiciones
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
                <h1 id="contenidoTitulo">Tabla Posiciones:</h1>
                <h4 id="contenidoDescripcion">Tabla de posiciones del campeonato  <%:" "+Model.campeonato.nombre %></h4>
            </div>
            <div id="contenedorCrear">
                <%:Html.ActionLink("Agregar Equipo", "agregarEquipo", new { id = Model.campeonato.idCampeonato })%><br /><br />
                <%:Html.ActionLink("Eliminar Equipo", "eliminarEquipo", new { id=Model.campeonato.idCampeonato})%><br /><br />
                <%: Html.ActionLink("Goleadoras", "Delete", new { id = Model.campeonato.idCampeonato })%>
            </div>
        </div>

    <div id="detallesWrapper">
        <%  
            
            var ordered = Model.tabla_equipo.OrderBy(ta => ta.puntos);
            var reversed = ordered.Reverse();
            for (int i = 0; i < Model.tabla_equipo.Count;i++)
           {
                
               var list = reversed.ToList();
               var t = list[i];%>
               <% if (i % 2 == 0)
                  {%>
                        <div class="nombrePropiedadDetalle"><h3>Equipo:<%:" " + t.equipo.nombre%> </h3><h3>Puntos:<%:" " + t.puntos%> </h3> 
                        <div class="opcionTabla">
                            <%: Html.ActionLink("Modificar Puntaje", "Edit", new { idEquipo=t.idEquipo, idTabla = t.idTabla}) %>
                        </div>                  
                        </div>
                        
               <% } %>
               <% else
                  { %>
                        <div class="propiedadDetalle"><h3>Equipo:<%:" " + t.equipo.nombre%> </h3><h3>Puntos:<%:" " + t.puntos%> </h3>  
                        <div class="opcionTabla">
                            <%: Html.ActionLink("Modificar Puntaje", "Edit", new { idEquipo = t.idEquipo, idTabla = t.idTabla })%>
                        </div>                      
                        </div>
                        

               <% } %>
          
        <%} %>
    </div>
    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver a la lista", "Index", "Campeonato") %></h3>
     </div>

</asp:Content>

