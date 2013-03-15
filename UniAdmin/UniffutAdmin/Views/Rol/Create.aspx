<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.rol>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Rol
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div id="headerContenido">
        <h1>Crea un nuevo rol</h1>
    </div>
        <form id="validateForm" action= '<%:Url.Action("Create","Rol")%>' method="post">
              <div id="createWrapper">
                <div class="editor-label">
                    <h2>Nombre</h2>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{1,}", @maxlength = "25", @class = "infofield" })%>
                </div>
            
                <div class="editor-label">
                    <h2>Descripción</h2>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.descripcion, new { @required = "required", @pattern = "[a-zA-Z ]{1,}", @maxlength = "45", @class = "infofield" })%>
                </div>
            </div>

            <div>
                <input type="submit" value="Crear nuevo rol" class="opcionCrud" />
            </div>
        </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>
</asp:Content>
