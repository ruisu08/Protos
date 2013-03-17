<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.Login>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="metrouicss" style="margin:5% 0 10% 0;"><h1 class="Heading1">HOME</h1></div>
    
    <div class="metrouicss" style="height:80%; width:100%;">
    <form action='<%:Url.Action("Create","Jugadora")%>' method="get">
        <button class="command-button" type="submit">Crear Nueva Jugadora</button>
    </form>
    <form action='<%:Url.Action("Create","Equipo")%>' method="get">
        <button class="command-button">Crear Nuevo Equipo</button>
    </form>
    <form action='<%:Url.Action("Create","Division")%>' method="get">
        <button class="command-button">Crear Nueva Division</button>
    </form>
    <form action='<%:Url.Action("Create","Campeonato")%>' method="get">
        <button class="command-button">Crear Nuevo Campeonato</button>
    </form>
    <form action='<%:Url.Action("Create","Noticia")%>' method="get">
        <button class="command-button">Crear Nueva Noticia</button>
    </form>
    <form action='<%:Url.Action("Create","PaginaInformativa")%>' method="get">
        <button class="command-button">Crear Nueva Pagina Informativa</button>
    </form>
    </div>

</asp:Content>
