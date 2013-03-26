﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.pagina_informativa>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva página de programas de desarrollo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Crear una nueva página de programas de desarrollo</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Create","PaginasDesarrollo")%>' method="post">

        <div id="createWrapper">
            
            <div class="editor-label">
                <h2>Titulo</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.titulo, new { @required = "required", @maxlength = "45", @class = "infofield" })%>
            </div>
        </div>
            
            <div>
                <input type="submit" value="Crear nueva pagina de programas de desarrollo" class="opcionCrud" />
            </div>
        

    </form>

    <div id="Div1">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>
