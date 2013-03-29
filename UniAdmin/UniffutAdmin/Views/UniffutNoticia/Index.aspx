<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Uniffut.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.noticia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<link rel="Stylesheet" type="text/css" href="../../Content/UniffutWebSite/Noticia-Style.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />

<script type="text/javascript">
    $(function () {
        $("#accordion").accordion({
            heightStyle: "content"
        });
    });

</script>

    
    <div class=Content-Noticias>
    <h1 id="titleNotice" style=" color:#818B85; font-size:36px; font-family:Century Gothic;">Noticias sobre Jugadoras</h1>


    <div id="accordion">
    
    <% foreach (var item in Model)
       { %>
        
        <h2 style=" color:#D45354; font-size:100%;">Titulo: <%:item.titulo%></h2>
        <div>
              <p id="imagenNoticia"><%:new HtmlString(HttpUtility.HtmlDecode(item.imagenPrincipal))%></p>
              <p id="textInside" style="color:#D45354; font-size:100%;"><%:new HtmlString(HttpUtility.HtmlDecode(item.contenido))%></p>                
        
        </div>
     <%} %>
    
    </div>


    </div>

    
 

</asp:Content>
