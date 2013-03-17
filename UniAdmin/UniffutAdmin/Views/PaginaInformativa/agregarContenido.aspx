<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.pagina_informativa>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Agregar Contenido
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Agregar Contenido</h2>

    <form id="validateForm" action= '<%:Url.Action("agregarContenido","PaginaInformativa")%>' method="post">

        <div id="createWrapper">

             <div class="editor-label">
                 <h3>Contenido</h3>
            </div>

            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.contenido, new { @id = "xxx" })%>
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
