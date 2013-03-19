<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.jugadora>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles de jugadora
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div id="detallesTitulo">
        <h1>Detalles de la jugadora:</h1>
        <h2><%:" "+Model.nombre +" "+Model.apellidos%></h2>
    </div>
    <div id="detallesWrapper">
        <div class="nombrePropiedadDetalle"><h3>Edad</h3></div>
        <div class="propiedadDetalle"><h4><%
                  
                        DateTime today = DateTime.Today;
                        int age = today.Year - Model.fechaNacimiento.Year;
                        if (Model.fechaNacimiento > today.AddYears(-age)) age--;

                        Response.Write(age); %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Identificación</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.identificacion %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Equipo al que pertenece</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.equipo.nombre %></h4></div>
        <div class="nombrePropiedadDetalle"><h3>Nacionalidad</h3></div>
        <div class="propiedadDetalle"><h4><%: Model.nacionalidad %></h4></div>
    </div>
    <div id="volverIndex">
        <h3><%:Html.ActionLink("Volver a la Lista", "Index") %></h3>
     </div>
</asp:Content>

