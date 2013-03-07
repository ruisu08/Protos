<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.CampeonatoDivisionViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

   <form id="validateForm" action= '<%:Url.Action("Edit","Campeonato")%>' method="post">
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
              
            <div class="editor-label">
                <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Campeonato.nombre, new { @required = "required", @pattern = "[a-zA-Z ]{2,}", @maxlength = "40" }) %>
                <%: Html.ValidationMessageFor(model => model.Campeonato.nombre) %>
            </div>
            
            <div class="editor-label">
                <h3>Descripcion</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Campeonato.descripcion, new { @required = "required", @pattern = "[a-zA-Z0-9]{2,}", @maxlength = "140" }) %>
                <%: Html.ValidationMessageFor(model => model.Campeonato.descripcion)%>
            </div>
            
            <div class="editor-label">
                Division
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Campeonato.idDivision, new SelectList(Model.Divisiones, "idDivisiones", "nombre", Model.Divisiones.First().idDivisiones))%>
                <%: Html.ValidationMessageFor(model => model.Campeonato.idDivision)%>
            </div>
            
            <p>
                <input type="submit" value="Actualizar" />
            </p>
        </fieldset>

    </form>

    <div>
        <%: Html.ActionLink("Regresar a la lista", "Index") %>
    </div>

</asp:Content>

