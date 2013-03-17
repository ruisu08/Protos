<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.TablaPosicionesEquipoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Actualizar Datos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Editar Tabla de Posiciones</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Edit","TablaPosiciones")%>' method="post">
        <div id="createWrapper">

            <div class="editor-label">
                <h3>Puntos</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.tablaPosiciones.puntos, new { @required = "required", @size = "10", @class = "infofield" })%>
                                
            </div>

          </div>
            
            <div>
                <input type="submit" value="Guardar" class="opcionCrud" />
            </div>

    </form>

    <div>
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </div>

</asp:Content>

