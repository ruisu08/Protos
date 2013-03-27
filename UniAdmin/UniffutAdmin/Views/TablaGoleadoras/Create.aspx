<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.goleadoras>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <div id="headerContenido">
        <h1>Crear nueva tabla de goleadoras</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Create","TablaGoleadoras")%>' method="post">
   
          <div id="createWrapper">

            
            <div class="editor-label">
                <h3>Equipos</h3>
            </div>
            <div class="editor-field">
                <%var equipo = Html.DropDownListFor(model => model.campeonato.equipo, new SelectList(Model.campeonato.equipo, "idEquipo", "nombre", Model.campeonato.equipo.First().idEquipo), new { @required = "required", @class = "infofield" });%>
            </div>           

            <div class="editor-label">
                <h3>Jugadoras</h3>
            </div>            
            <div class="editor-field">
                <%:Html.DropDownListFor(model => model.idJugadora, new SelectList(Model.campeonato.equipo.Where(d=>d.idEquipo.Equals(equipo)).ToList(), "idJugadora", "nombre", Model.campeonato.equipo.First().jugadora), new { @required = "required", @class = "infofield" })%>
            </div>
                     
           </div>

            <div>
                <input type="submit" value="Crear nuevo partido" class="opcionCrud" />
            </div>
    </form>
    

    <div id="volverIndex">
        <%int ID = Convert.ToInt32(RouteData.Values["id"]);%>
        <h3><%: Html.ActionLink("Volver a la Lista", "Index", new { id = ID })%></h3>
    </div>

</asp:Content>

