<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.Login>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Admin Uniffut
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="validateForm" action= '<%:Url.Action("Login","Home")%>' method="post">
        <div id="loginBox">
            <div>
                <h1>Login</h1>
            </div>
            <div>
            <h4>Correo:</h4>
            <%:Html.TextBoxFor(model=>model.Usuario.correo , new {@required = "required", @maxlength="45", @type="email", @name="email"}) %>
            <h4>Contraseña:</h4>
            <%:Html.PasswordFor(model => model.Usuario.password, new { @required = "required", @pattern = "[a-zA-Z0-9]{2,}", @maxlength = "45" })%>
            </div>
            <div style="margin:5% 0 5% 0">
                <input style="width:30%" id="submitBTN" type="submit" value="Login"/>
            </div>
        </div>

    </form>

</asp:Content>
