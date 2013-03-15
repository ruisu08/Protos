﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.NoticiaViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva noticia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerContenido">
        <h1>Crea una nueva noticia</h1>
    </div>

    <form id="validateForm" action= '<%:Url.Action("Create","Noticia")%>' method="post">
        <div id="createWrapper">
            
          
            <div class="editor-label">
                <h3>Titulo</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Noticia.titulo, new { @required = "required", @pattern = "[a-zA-Z ]{1,}", @maxlength = "50", @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Noticia.titulo)%>
            </div>
            
            <div class="editor-label">
                <h3>Fecha</h3>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Noticia.fecha, new { @class = "datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.Noticia.fecha)%>
            </div>
            
            <div class="editor-label">
                <h3>Autor</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Noticia.autor, new SelectList(Model.Usuarios, "idUsuario", "idUsuario", Model.Usuarios.First().idUsuario), new { @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Noticia.autor)%>
            </div>
            
            <div class="editor-label">
                <h3>Tipo de noticia</h3>
            </div>
            <div class="editor-field">
                <%: Html.DropDownListFor(model => model.Noticia.TipoNoticia_idTipoNoticia, new SelectList(Model.Tipos, "idTipoNoticia", "nombre", Model.Tipos.First().idTipoNoticia), new { @class = "infofield" })%>
                <%: Html.ValidationMessageFor(model => model.Noticia.TipoNoticia_idTipoNoticia)%>
            </div>
            </div>
            
            <div>
                <input type="submit" value="Crear nueva noticia" class="opcionCrud" />
            </div>

    </form>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>

