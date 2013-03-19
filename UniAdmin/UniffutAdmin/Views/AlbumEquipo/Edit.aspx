<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.album_equipo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar album
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Editar Album</h1>
    </div>
   <form id="validateForm" action= '<%:Url.Action("Edit","AlbumJugadora")%>' method="post">
        <div id="createWrapper">
            
            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre, new { @required = "required", @maxlength = "100", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.nombre)%>
            </div>

        </div>

            <div>
                <input type="submit" value="Guardar" class="opcionCrud" />
            </div>

         </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index", new {id = Model.idJugadora})%></h3>
    </div>

</asp:Content>
