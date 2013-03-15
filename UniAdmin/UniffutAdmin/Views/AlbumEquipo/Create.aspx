<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.EquipoAlbumMultimedia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nuevo Album
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div id="headerContenido">
        <h1>Crea un nuevo Album</h1>
    </div>
    

    <form id="validateForm" action= '<%:Url.Action("Create","AlbumEquipo")%>' method="post">
            <div id="createWrapper">
                <div class="editor-label">
                    <h2>Nombre</h2>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model=>model.Album.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{1,}", @maxlength = "10", @class = "infofield" })%>
                </div>
           
            </div>
            <div>
                <input type="submit" value="Crear nuevo Album" class="opcionCrud" />
            </div>
    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>

