<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.EquipoAlbumMultimedia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	agregarMultimedia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>agregarMultimedia</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Equipo.nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Equipo.nombre)%>
                <%: Html.ValidationMessageFor(model => model.Equipo.nombre)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Equipo.album_equipo) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Album.idAlbum_Equipo, new SelectList(Model.Albumes,"idAlbum_Equipo","nombre",Model.Albumes.First().idAlbum_Equipo))%>
                <%: Html.ValidationMessageFor(model => model.Album.idAlbum_Equipo)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Multimedia) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Multimedia.fuenteGrafica, new { @id = "multimediaAdder", @maxlength = "0" })%>
                <%: Html.ValidationMessageFor(model => model.Multimedia.fuenteGrafica)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Multimedia.comentario) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Multimedia.comentario)%>
                <%: Html.ValidationMessageFor(model => model.Multimedia.comentario)%>
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

