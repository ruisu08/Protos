<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ErrorModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ErrorSesion
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>La operacion no pudo ser realizada!!</h2>
    <p><%: Model.mensaje %></p>
    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver al Login","Index","Login")%></h3>
    </div>

</asp:Content>
