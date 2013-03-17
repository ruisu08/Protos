<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.EquipoDivisionesViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Actualizar Datos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Editar Equipo</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Edit","Equipo")%>' method="post">
       <div id="createWrapper">
            
            <div class="editor-label">
                 <h3>Abreviatura</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.equipo.abreviatura, new { @required = "required", @name = "Abrev", @pattern = "[a-zA-Z ]{2,}", @maxlength = "10", @class = "infofield" })%>
            </div>
            
            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.equipo.nombre, new { @required = "required", @name = "name", @pattern = "[a-zA-Z ]{5,}", @maxlength = "40", @class = "infofield" })%>
            </div>
            
            <div class="editor-label">
                 <h3>Divisiones</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.equipo.idDivision, new SelectList(Model.divisiones, "idDivisiones", "nombre", Model.divisiones.First().idDivisiones), new { @class = "infofield" })%>
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

