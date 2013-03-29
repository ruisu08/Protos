<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Uniffut.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.noticia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Noticias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<link rel="Stylesheet" type="text/css" href="../../Content/UniffutWebSite/Noticia-Style.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />

<script type="text/javascript">
   

</script>

    
    <div class=Content-Noticias>
    <h1 id="titleNotice" style=" color:#818B85; font-size:36px; font-family:Century Gothic;">Noticias sobre Jugadoras</h1>
    
    <% foreach (var item in Model)
       { %>
        
        <div id="cuadro-Noticia">        
              <div id="noticeImage"><%:new HtmlString(HttpUtility.HtmlDecode(item.imagenPrincipal))%></div>
              <h2>Titulo: <%:item.titulo%></h2>
              <div id="textInside"><%:new HtmlString(HttpUtility.HtmlDecode(item.contenido))%></div>             
        
        </div>

        <div style="height:1px; background-color:#000; width:80%; margin-left:5%;"></div>
     <%} %>
     

    </div>

    
 

</asp:Content>
