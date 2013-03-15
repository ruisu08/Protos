<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.equipo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	agregarHistoria
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>agregarHistoria</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            

            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre) %>
                <%: Html.ValidationMessageFor(model => model.nombre) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.historia) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.historia) %>
                <%: Html.ValidationMessageFor(model => model.historia) %>
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

