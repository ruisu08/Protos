<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.rol>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles</h2>
    <div>
    <ul>
    <li><h3>ID</h3></li>
    <li><%: Model.idRol %></li>
     <li><h3>Nombre</h3></li>
    <li><%: Model.nombre %></li>
    <li><h3>Descripción</h3></li>
    <li><%: Model.descripcion %></li>
    <li><h3>Estado</h3></li>
    <li><%: (bool)Model.estado ? "Activo" : "Inactivo"%></li>
    </ul>
    </div>
    <div><%:Html.ActionLink("Volver a la lista de roles", "Index") %></div>
</asp:Content>
