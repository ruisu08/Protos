<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.rol>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar rol
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar rol</h2>
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            
            <div class="editor-label">
                <h3>Descripción</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.descripcion)%>
                <%: Html.ValidationMessageFor(model => model.descripcion)%>
            </div>

            <p>
                <input type="submit" value="Actualizar" />
            </p>
        </fieldset>

         <% } %>

    <div>
        <%: Html.ActionLink("Volver a lista de roles", "Index") %>
    </div>

</asp:Content>
