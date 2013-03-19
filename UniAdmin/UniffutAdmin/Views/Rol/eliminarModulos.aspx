<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.RolModuloViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eliminar permisos de rol
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Eliminar permisos de rol</h1>
    </div>
     <div id="createWrapper">
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
            <div class="editor-label">
                <h3>Rol: <%: Model.Rol.nombre %></h3>
            </div>
            
            <div class="editor-label">
                <h3>Selecciona el modulo que deseas eliminar de este rol</h3>
            </div>
            <div class="editor-field">
            <%if (Model.Modulos.Count > 0)
              {%>
                <%: Html.DropDownListFor(model => model.ModuloEspecifico.idModulo, new SelectList(Model.Modulos, "idModulo", "nombre", Model.Modulos.First().idModulo), new { @class = "infofield" })%>
            <%} %>
            <%else
              { %>
                <h3>Este rol no tienen nungun modulo</h3>
            <%} %>
            </div>
        </div>
            <%if (Model.Modulos.Count > 0)
              {%>
             <div>
                <input type="submit" value="Guardar" class="opcionCrud" data-confirm= "Si elimina este modulo del rol sus usuarios no tendran acceso como tal" />
            </div>
            <%} %>

    <% } %>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>


</asp:Content>
