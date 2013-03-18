<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.patrocinador>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	eliminarMultimedia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Eliminacion</h2>

    <form id="validateForm" action= '<%:Url.Action("eliminarMultimedia","Patrocinador")%>' method="post">
    <div id="detallesWrapper">

        <h1>Esta seguro que desea eliminar la multimedia del patrocinador</h1>

    </div>

        <div>
              <input type="submit" value="Eliminar Multimedia" class="opcionCrud" />
        </div>

        <div id="volverIndex">

            <h3><%:Html.ActionLink("Volver a la Lista", "Index") %></h3>
        
        </div>

    </form>

    

</asp:Content>
