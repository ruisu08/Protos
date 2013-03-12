<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Campeonatos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Campeonatos</h2>
    <div>
        <ul>
            <li><%:Html.ActionLink("Campeonatos","Index","Campeonato") %></li>
            <li><%:Html.ActionLink("Calendarios","Index","Calendario") %></li>
            <li><%:Html.ActionLink("Tabla de Posiciones","Index","TablaPosiciones") %></li>
        </ul>
    </div>

</asp:Content>
