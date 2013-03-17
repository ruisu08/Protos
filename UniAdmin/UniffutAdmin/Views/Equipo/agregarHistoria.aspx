<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.equipo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	agregarHistoria
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Agregar Historia</h2>

    <form id="validateForm" action= '<%:Url.Action("agregarHistoria","Equipo")%>' method="post">

        <div id="createWrapper">
            
            <div class="editor-label">
                <h2>Historia</h2>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.historia) %>
                <%: Html.ValidationMessageFor(model => model.historia) %>
            </div>
           </div>
           <div>
           <input type="submit" value="Crear nuevo equipo" class="opcionCrud" />
        </div>

    <div id="volverIndex">
        <h3><%: Html.ActionLink("Volver a la Lista", "Index") %></h3>
    </div>

</asp:Content>

