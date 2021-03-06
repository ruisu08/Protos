﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	agregarImagenPrincipal
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Agregar Imagen principal a la noticia</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("agregarImagenPrincipal","Noticia")%>' method="post">
          
          <div id="createWrapper">  
            <div class="editor-label">
                <%: Html.LabelFor(model => model.imagenPrincipal) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.imagenPrincipal, new { @id = "multimediaAdder", @class = "infofield" })%>
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
