<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Uniffut.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.tiponoticia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <link rel="Stylesheet" type="text/css" href="../../Content/Noticia-Style.css" />

    <div id=Content-Noticias>
    
    <% foreach (var item in Model)
       { %>

        <div id="cuadro-Noticia">
                
                <h2 style=" color:#D45354; font-size:100%;">Noticias sobre <%:item.nombre%></h2>
                <p style="color:#D45354; font-size:100%;"><%: item.descripcion %></p>
                
        </div>
     <%} %>
    
    </div>

</asp:Content>
