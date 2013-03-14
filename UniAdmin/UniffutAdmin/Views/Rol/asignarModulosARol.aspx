<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.RolModuloViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	asignarModulosARol
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>asignarModulosARol</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Rol.nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Rol.nombre)%>
                <%: Html.ValidationMessageFor(model => model.Rol.nombre)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Rol.modulo)%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.ModuloEspecifico.idModulo, new SelectList(Model.Modulos,"idModulo","nombre",Model.Modulos.First().idModulo)) %>
                <%: Html.ValidationMessageFor(model => model.ModuloEspecifico) %>
            </div>

            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

