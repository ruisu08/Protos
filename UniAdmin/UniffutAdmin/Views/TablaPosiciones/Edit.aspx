<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.tabla_equipo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Modificar puntaje
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div id="headerContenido">
        <h1>Modificar puntaje</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Edit","TablaPosiciones")%>' method="post">
       <div id="createWrapper">
            
            
           
            <div class="editor-label">
                 <h3>Equipo:</h3>
            </div>
            <div class="editor-field">
                <%:Model.equipo.nombre %>
            </div>
            
            <div class="editor-label">
                <h3>Puntos actuales</h3>
            </div>
            <div class="editor-field">
                <%:Model.puntos%>
            </div>
            
            <div class="editor-label">
                 <h3>Nuevo puntaje</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model=>model.puntos)%>
            </div>

        </div>
            <div>   
                <input type="hidden" name="idEquipo" value= "<%:Model.idEquipo%>" />
                <input type="hidden" name="idTabla" value = "<%:Model.idTabla%>" />
                <input type="submit" value="Guardar" class="opcionCrud" />
            </div>

    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la tabla", "Details", new {id = Model.tabla_posiciones.campeonato.idCampeonato})%></h3>
    </div>

</asp:Content>

