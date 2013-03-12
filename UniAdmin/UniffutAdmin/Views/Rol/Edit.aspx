<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.rol>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar rol
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar rol</h2>
   <form id="validateForm" action= '<%:Url.Action("Edit","Rol")%>' method="post">
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            
            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "100" })%>
                <%: Html.ValidationMessageFor(model => model.nombre)%>
            </div>

            <div class="editor-label">
                <h3>Descripción</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.descripcion, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "100" })%>
                <%: Html.ValidationMessageFor(model => model.descripcion)%>
            </div>

            <p>
                <input type="submit" value="Actualizar" />
            </p>
        </fieldset>

         </form>

    <div>
        <%: Html.ActionLink("Volver a lista de roles", "Index") %>
    </div>

</asp:Content>
