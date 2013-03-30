<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Uniffut.Master" Inherits="System.Web.Mvc.ViewPage<UniffutAdmin.Models.ViewModels.UniffutWebSite.HomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Uniffut
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link  type="text/css" rel="Stylesheet" href="../../Content/UniffutWebSite/Home.css"/>
    <link  type="text/css" rel="Stylesheet" href="../../Content/UniffutWebSite/slider.css"/>
    <script type="text/javascript" src="../../Scripts/UniffutWebSite/s3Slider.js"></script>
    <script type="text/javascript" src="../../Scripts/UniffutWebSite/Home.js"></script>
        <div id="topContainer">
            <div id="sliderContainer">
                <div id="s3slider">
                    <ul id="s3sliderContent">
                        <%if (Model.Noticias != null)
                          {
                              foreach (var item in Model.Noticias)
                              { %>
                        <li class="s3sliderImage">
                            <a href="#"><%:new HtmlString(HttpUtility.HtmlDecode(item.imagenPrincipal))%></a>
                            <span><strong><%: item.titulo%></strong><br />consectetur adipisicing elit</span>
                        </li>
                        <%}
                          } %>
                        <div class="clear s3sliderImage"></div>
                    </ul>
                </div>
            </div>
            <div id="worldCupLink">
                <a href = "#">
                <p>Campeonato Mundial <br />
                Femenino <br />
                U-17 <br />
                Costa Rica 2014</p>
                </a>
            </div>
         </div>

         <div id="middleContainer">
            <a href="#" class="middleBoxThree">
                <div class="middleBoxImageContainer">
                    <img class="mbImage" src="../../Content/UniffutWebSite/Images/lyg_promo.jpg"/>
                </div>
                <div id="middelBoxGrayLine"></div>
                <div id="middleBoxThreeText">
                    <p>Live your goals:</p>
                    <br />
                    <p>Quieres jugar?. Aquí encontraras toda la <br />información que necesitas.</p>
                </div>
            </a>
            <a href="#" class="middleBoxOne">
                <div class="middleBoxImageContainer">
                    <img class="mbImage" src="../../Content/UniffutWebSite/Images/0,,12814~10411264,00.jpg"/>
                </div>
                <div id="middelBoxPinkLine"></div>
                <div id="middleBoxOneText">
                    <p>Galería multimedia:</p>
                    <br />
                    <p>Fotografías y videos de tus equipos<br /> y jugadoras favoritas.</p>
                </div>
            </a>
            <a href="#" class="middleBoxTwo">
                <div class="middleBoxImageContainer">
                    <img class="mbImage" src="../../Content/UniffutWebSite/Images/Futbol_femenino-Juegos_Centroamericanos-San_Jose_2013_ALDIMA20130306_0051_4.jpg"/>
                </div>
                <div id="middelBoxBlueLine"></div>
                <div id="middleBoxTwoText">
                    <p>Noticias:</p>
                    <br />
                    <p>Los mas recientes acontecimientos del futbol <br />femenino.</p>
                </div>
            </a>
         </div>
         
         <div id="bottomContainer">
            <div id="sponsorSpace">
            
            </div>
            <a href="#" id="donationSpace">
                <div id="greenDonationLine"></div>
                <div id="donationsText">
                    <h3>Danos una mano:</h3>
                    <br />
                    <p>La Uniffut necesita tu ayuda para crecer,<br />haz click aquí para colaborar con <br /> una donación.</p>
                </div>
            </a>
         </div>

         <div id="advertisementContainer">
            <div id="nextGames">
            
            </div>
            <div id="advertisementSpaceOne">
            
            </div>
            <div id="advertisementSpaceTwo">
            
            </div>
         </div>

</asp:Content>
