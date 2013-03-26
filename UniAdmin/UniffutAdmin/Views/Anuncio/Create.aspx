<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.anuncio>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nuevo anuncio
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Crea un nuevo anuncio</h1>
    </div>

     <form id="validateForm" action= '<%:Url.Action("Create","Anuncio")%>' method="post">

        <div id="createWrapper">
            
            <div class="editor-label">
                <h2>Nombre</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre, new { @required = "required", @maxlength = "45", @class = "infofield" })%>
            </div>
            
            
            <div class="editor-label">
                <h2>Fecha Ingreso</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.fechaInicio, new { @class = "datepicker infofield" })%>
            </div>
            
            <div class="editor-label">
                <h2>Fecha Salida</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.fechaFinal, new { @class = "datepicker infofield" })%>
            </div>
        </div>
            
           <div>
                <input type="submit" value="Crear nuevo anuncio" class="opcionCrud" />
            </div>
        

    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>
