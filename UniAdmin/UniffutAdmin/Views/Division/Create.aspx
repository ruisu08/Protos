<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.division>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Division
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Crea una nueva Division</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Create","Division")%>' method="post">
   
          <div id="createWrapper">

            <div class="editor-label">
                <h3>Abreviatura</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.abreviatura, new { @required = "required", @pattern = "[a-zA-Z ]{1,}", @maxlength = "10", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.abreviatura) %>
            </div>

            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{1,}", @maxlength = "40", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.nombre) %>
            </div>
            
            <div class="editor-label">
                <h3>Descripcion</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.descripcion, new { @required = "required", @pattern = "[a-zA-Z ]{1,}", @maxlength = "140", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.descripcion) %>
            </div>
           </div>

            <div>
                <input type="submit" value="Crear nueva Division" class="opcionCrud" />
            </div>
    </form>
    

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>

