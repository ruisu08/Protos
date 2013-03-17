<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/LoginMaster.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.Login>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Admin Uniffut
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LoginContent" runat="server">

    <form id="validateForm" action= '<%:Url.Action("Login","Login")%>' method="post" style="margin:8% 8% 0 0;">
        <div id="loginBox">
            <div style="margin:5% 0% 0% 0%">
                <h1>Login</h1>
            </div>
            <div style="margin:5% 0% 0% 0%">
            <h3>Correo:</h3>
            </div>
            <div style="margin:5% 0% 0% 0%">
            <%:Html.TextBoxFor(model=>model.Usuario.correo , new {@required = "required", @maxlength="45", @type="email", @name="email", @class="infofield", @style="width:75%"}) %>
            </div>
            <div style="margin:5% 0% 0% 0%">
            <h3>Contraseña:</h3>
            </div>
            <div style="margin:5% 0% 0% 0%">
            <%:Html.PasswordFor(model => model.Usuario.password, new { @required = "required", @pattern = "[a-zA-Z0-9]{2,}", @maxlength = "45", @class = "infofield", @style = "width:75%" })%>
            </div>
            <div style="margin:5% 15% 5% 25%">
                <input style="width:45%" id="submitBTN" type="submit" value="Login"/>
            </div>
        </div>

    </form>

</asp:Content>
