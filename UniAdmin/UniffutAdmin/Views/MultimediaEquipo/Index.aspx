<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UniffutAdmin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<UniffutAdmin.Models.multimedia>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <%foreach (var m in Model)
      { %>
           <div class="multiPreview">
            <%:new HtmlString (HttpUtility.HtmlDecode(m.fuenteGrafica))%>
           </div>

    <%} %>

</asp:Content>
