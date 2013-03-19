<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.rol>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar rol
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Editar Roles</h1>
    </div>
   <form id="validateForm" action= '<%:Url.Action("Edit","Rol")%>' method="post">
        <div id="createWrapper">
            
            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre, new { @required = "required", @maxlength = "100", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.nombre)%>
            </div>

            <div class="editor-label">
                <h3>Descripción</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.descripcion, new { @required = "required", @maxlength = "100", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.descripcion)%>
            </div>

        </div>

            <div>
                <input type="submit" value="Guardar" class="opcionCrud" />
            </div>

         </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>
