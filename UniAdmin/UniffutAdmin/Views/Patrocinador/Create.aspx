<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.patrocinador>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nuevo patrocinador
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Crea un nuevo patrocinador</h1>
    </div>

     <form id="validateForm" action= '<%:Url.Action("Create","Patrocinador")%>' method="post">

        <div id="createWrapper">
            
            <div class="editor-label">
                <h2>Nombre</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre, new { @required = "required", @maxlength = "45", @class = "infofield" })%>
            </div>
            
            <div class="editor-label">
                <h2>Descripcion</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.descripcion, new { @required = "required", @maxlength = "45", @class = "infofield" })%>
            </div>
            
            <div class="editor-label">
                <h2>Fecha Ingreso</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.fechaIngreso, new { @class = "datepicker infofield" })%>
                <%: Html.ValidationMessageFor(model => model.fechaIngreso) %>
            </div>
            
            <div class="editor-label">
                <h2>Fecha Salida</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.fechaSalida, new { @class = "datepicker infofield" })%>
                <%: Html.ValidationMessageFor(model => model.fechaSalida) %>
            </div>
        </div>
            
           <div>
                <input type="submit" value="Crear nuevo patrocinador" class="opcionCrud" />
            </div>
        

    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>

