<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.goleadoras>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Modificar Goles</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Edit","TablaGoleadoras")%>' method="post">
       <div id="createWrapper">
            
            <div class="editor-label">
                <h3>Goles actuales</h3>
            </div>
            <div class="editor-field">
                <%:Model.goles%>
            </div>
            
            <div class="editor-label">
                 <h3>Goles nuevos</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model=>model.goles)%>
            </div>

        </div>
            <div>
                <input type="submit" value="Guardar" class="opcionCrud" />
            </div>

    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la tabla", "Index", new {id = Model.campeonato.idCampeonato})%></h3>
    </div>
</asp:Content>
