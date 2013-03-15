<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.EquipoAlbumMultimedia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Agregar multimedia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Agregar multimedia al album</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
           
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Multimedia.comentario) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Multimedia.comentario)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Multimedia.fuenteGrafica) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Multimedia.fuenteGrafica, new {@id="multimediaAdder"})%>
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

