<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.EquipoAlbumMultimedia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Agregar multimedia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Agregar multimedia al album</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("agregarMultimedia","AlbumEquipo")%>' method="post">
          
          <div id="createWrapper">  
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Multimedia.comentario) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Multimedia.comentario, new { @class="infofield"})%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Multimedia.fuenteGrafica) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Multimedia.fuenteGrafica, new { @id = "multimediaAdder", @class = "infofield" })%>
            </div>
        </div>
            <div>
                <input type="submit" value="Guardar" class="opcionCrud" />
            </div>
     </form>

    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver a la Lista", "Index") %></h3>
     </div>

</asp:Content>

