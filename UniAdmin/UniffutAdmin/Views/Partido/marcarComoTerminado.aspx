<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.partido>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Marcar como terminado
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Marcar partido como terminado:</h1>
        <h3><%:Model.equipo.nombre+" VS "+Model.equipo1.nombre+ " Fecha: "+Model.fecha%></h3>
    </div>

    <form id="validateForm" action= '<%:Url.Action("marcarComoTerminado","Partido")%>' method="post">
   
          <div id="createWrapper">

            <div class="editor-label">
                <h3>Goles de <%:" "+Model.equipo.nombre%> </h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.golesEquipoUno, new { @required = "required", @maxlength = "10", @class = "infofield" })%>
            </div>

            <div class="editor-label">
                <h3>Goles de <%:" "+Model.equipo1.nombre%> </h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.golesEquipoDos, new { @required = "required", @maxlength = "10", @class = "infofield" })%>
            </div>

           </div>

            <div>
                <input type="submit" value="Marcar como terminado" class="opcionCrud" />
            </div>
    </form>
    

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index", new { id = Model.idCampeonato })%></h3>
    </div>

</asp:Content>
