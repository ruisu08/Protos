<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administración
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Administración</h2>
    <div>
        <ul>
            <li><%:Html.ActionLink("Usuarios","Index","Usuario")%></li>
            <li><%:Html.ActionLink("Roles", "Index", "Rol")%></li>
        </ul>
    </div>

</asp:Content>
