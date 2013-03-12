<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Noticias</h2>
    <div>
        <ul>
            <li><%:Html.ActionLink("Noticias","Index","Noticia") %></li>
            <li><%:Html.ActionLink("Páginas Informativas","Index","PaginaInformativa") %></li>
        </ul>
    </div>

</asp:Content>
