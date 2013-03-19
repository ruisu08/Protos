<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.tabla_posiciones>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tabla de posiciones
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="detallesTitulo">
        <h1>Tabla de posiciones de campeonato:</h1>
        <h2><%:" "+Model.campeonato.nombre%></h2>
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
        <h3><%:Html.ActionLink("Volver a la lista", "Index") %></h3>
     </div>

</asp:Content>

