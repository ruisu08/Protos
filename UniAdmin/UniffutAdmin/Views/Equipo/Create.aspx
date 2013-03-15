<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.EquipoDivisionesViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Equipo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="headerContenido">
        <h1>Crea un nuevo equipo</h1>
    </div>
    

    <form id="validateForm" action= '<%:Url.Action("Create","Equipo")%>' method="post">
        <%: Html.ValidationSummary(true) %>
            <div id="createWrapper">
                <div class="editor-label">
                    <h2>Abreviatura</h2>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.equipo.abreviatura, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "10", @class = "infofield" })%>
                    <%: Html.ValidationMessageFor(model => model.equipo.abreviatura) %>
                </div>
            
                <div class="editor-label">
                    <h2>Nombre</h2>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.equipo.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{5,}", @maxlength = "40", @class = "infofield" })%>
                    <%: Html.ValidationMessageFor(model => model.equipo.nombre) %>
                </div>
            
                <div class="editor-label">
                    <h2>División</h2>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownListFor(model => model.equipo.idDivision, new SelectList(Model.divisiones, "idDivisiones", "nombre", Model.divisiones.First().idDivisiones), new {@class="infofield" })%>
                    <%: Html.ValidationMessageFor(model => model.equipo.idDivision) %>
                </div>
            </div>
            <div>
                <input type="submit" value="Crear nuevo equipo" class="opcionCrud" />
            </div>
                

    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>

