<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.TablaPosicionesEquipoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Actualizar Datos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Actualizar Datos</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Informacion</legend>

            <div class="editor-label">
                <h3>Puntos</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.tablaPosiciones.puntos)%>
                <%: Html.ValidationMessageFor(model => model.tablaPosiciones.puntos) %>
                
            </div>
            

            <p>
                <input type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </div>

</asp:Content>

