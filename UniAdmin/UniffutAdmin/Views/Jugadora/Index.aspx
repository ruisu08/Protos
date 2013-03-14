<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.jugadora>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Jugadoras
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="headerContenido">
    <div id="tituloContenido">
    <h1>Jugadoras</h1>
    <h4 id="descripcionController">Aqui es donde puedes ver,editar,agregar y eliminar la información de las jugadoras así con sus fotos y videos</h4>
    </div>
    <div id="busqueda">
        <form id="validateForm" action= '<%:Url.Action("Search","Jugadora")%>' method="post">
            <p>Buscar por identificación</p>
            <input type="text" name="identificacion" />
            <input id="botonBusqueda" type=submit value="buscar"/>
        </form>
    </div>
</div>
<div id="tableWrapper">
    <div>
        <h3><%: Html.ActionLink("Añadir jugadora", "Create") %></h3>
        <h2>Lista de jugadoras:</h2>
    </div>
    <table id="indTable">
        <tr>
            <th></th>
            <th>
                Identificacion
            </th>
            <th>
                Nombre
            </th>
            <th>
                Apellidos
            </th>
            <th>
                Edad
            </th>
            <th>
                Equipo
            </th>
            <th>
                Nacionalidad
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
            <div class="opcionCrud">
                <h5><%: Html.ActionLink("Actualizar datos", "Edit", new { id=item.idJugadora }) %></h5>
            </div>
            <div class="opcionCrud">
                <h5><%: Html.ActionLink("Datos en detalle", "Details", new { id=item.idJugadora })%></h5>
            </div>
            <div class="opcionCrud">
                <h5><%: Html.ActionLink("Eliminar", "Delete", new { id=item.idJugadora })%></h5>
            </div>

            </td>
            <td>
                <%: item.identificacion %>
            </td>
            <td>
                <%: item.nombre %>
            </td>
            <td>
                <%: item.apellidos %>
            </td>

            <td>
            <!---String.Format("{0:g}", item.fechaNacimiento)-->
                <% DateTime dob = Convert.ToDateTime(item.fechaNacimiento);
                   DateTime hoy = DateTime.Now;
                   int edad = hoy.Year - dob.Year;
                   if (hoy.Month < dob.Month || (hoy.Month == dob.Month && hoy.Day < dob.Day)) { edad--; };
                   Response.Write(edad);
                   %>
            </td>
            <td>
                <%:item.equipo.nombre%>
            </td>
            <td>
                <%:item.nacionalidad%>
            </td>
        </tr>
    
    <% } %>

    </table>
</div>

 
</asp:Content>

