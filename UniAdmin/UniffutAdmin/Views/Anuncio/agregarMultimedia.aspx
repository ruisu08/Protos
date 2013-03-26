<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.anuncio>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Agregar multimedia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Agregar multimedia a anuncio</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("agregarMultimedia","Anuncio")%>' method="post">
          
          <div id="createWrapper">  
            
            <div class="editor-label">
                <h2>Imagen</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.fuenteGrafica, new { @id = "multimediaAdder", @class = "infofield" })%>
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
