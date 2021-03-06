﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.anuncio>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar anuncio
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Editar anuncio</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Edit","Anuncio")%>' method="post">
        <div id="createWrapper">            
            
            <div class="editor-label">
               <h3>Nombre</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nombre, new { @required = "required", @maxlength = "45", @class = "infofield" })%>
            </div>
            
            <div class="editor-label">
                <h3>Fecha Ingreso</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.fechaInicio, new {@class = "infofield datepicker" })%>     
            </div>
            
            <div class="editor-label">
                <h3>Fecha Salida</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.fechaFinal, new {@class = "infofield datepicker" })%> 
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