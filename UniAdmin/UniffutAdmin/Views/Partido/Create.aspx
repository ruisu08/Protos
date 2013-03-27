<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.partido>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Partido
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Crea un nuevo Partido</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Create","Partido")%>' method="post">
   
          <div id="createWrapper">

            <div class="editor-label">
                <h3>Fecha</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.fecha, new { @required = "required", @maxlength = "10", @class = "datepicker" })%>
            </div>

            <div class="editor-label">
                <h3>Hora</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.hora, new { @required = "required", @maxlength = "45", @class = "infofield" })%>
            </div>
            
            <div class="editor-label">
                <h3>Estadio</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.estadio, new { @required = "required", @maxlength = "45", @class = "infofield" })%>
            </div>
            <div class="editor-label">
                <h3>Equipo uno</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.equipoUno, new SelectList(Model.campeonato.equipo, "idEquipo", "nombre", Model.campeonato.equipo.First().idEquipo), new { @class = "infofield" })%>
            </div>
            <div class="editor-label">
                <h3>Equipo dos</h3>
            </div>
            <div class="editor-field">
                 <%: Html.DropDownListFor(model => model.equipoDos, new SelectList(Model.campeonato.equipo, "idEquipo", "nombre", Model.campeonato.equipo.First().idEquipo), new { @class = "infofield" })%>
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

