<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Multimedia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Multimedia</h2>
    <div>
        <ul>
            <li><%:Html.ActionLink("Multimedia de Jugadoras","Index", "JugadoraMultimedia") %></li>
            <li><%:Html.ActionLink("Multimedia de Equipos","Index", "EquipoMultimedia") %></li>
            <li><%:Html.ActionLink("Multimedia de Campeonatos","Index", "CampeonatoMultimedia") %></li>
            <li><%:Html.ActionLink("Multimedia de Divisiones","Index", "DivisionMultimedia") %></li>
        </ul>
    </div>

</asp:Content>
