<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Astudes._Default" %>

<asp:Content runat="server" ID="MainContent" ContentPlaceHolderID="MainContent">
<link rel="stylesheet" href="/Content/firstPage.css" />

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <style>
     #iconHomeAbout1 .icon11 .imgDescription{
          visibility:hidden;
     }
     #iconHomeAbout1 .icon11:hover .imgDescription{
         visibility:visible;
     }
    #iconHomeAbout2 .icon22 .imgDescription2{
          visibility:hidden;
     }
     #iconHomeAbout2 .icon22:hover .imgDescription2{
         visibility:visible;
     }
     #iconHomeAbout3 .icon33 .imgDescription3{
          visibility:hidden;
     }
     #iconHomeAbout3 .icon33:hover .imgDescription3{
         visibility:visible;
     }
  </style>
<div id="CarouselDiv"><!-- HOMEABOUT-->
<section>
<div class="containerSpecial2">
    <div class="carousel slide" id="myCarousel">
        <!--Indicator-->
            <ol class="carousel-indicators">
                <li class="active" data-target="#myCarousel" data-slide-to="0"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
        <!--Wrapper for slides-->
        <div class="carousel-inner">
            <div class="item active" id="slide1">
                    <div class="carousel-caption">
                        <div style="margin-top:20px">
                            <p style="float:left;margin-left: 350px"><img src="Images/imgSoftwareCompany1.png" style="max-height:220px" /></p>
                            <div style="float:left;text-align:left;margin-left:20px">
                                <h1><span>Astuteds </span>1</h1>
                                <p style="max-width: 250px;">Astuteds is here for jiuqhiudh sdioqoiqsd hddj lkdjlk sdnn dgddj ejdd g dkdme fhf rjufnr rlcpcc sdfsdfs</p>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="item" id="slide2" onclick="javascript:Show()" data-toggle="modal" data-target="#videoModal">
                    <div class="carousel-caption">
                         <div style="margin-top:20px">
                            <p style="float:left;margin-left: 350px"><img src="Images/img_play_1.png" style="max-height:220px" /></p>
                            <div style="float:left;text-align:left;margin-left:20px">
                                <h1><span>Astuteds </span>2</h1>
                                <p style="max-width: 250px;">Click here and play the video</p>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="item" id="slide3">
                    <div class="carousel-caption">
                        <div style="margin-top:20px">
                            <p style="float:left;margin-left: 350px"><img src="Images/imgSoftwareCompany2.png" style="max-height:220px" /></p>
                            <div style="float:left;text-align:left;margin-left:20px">
                                <h1><span>Astuteds </span>3</h1>
                                <p style="max-width: 250px;">Astuteds tdsh sdjkiso dsjjd cjjcjks kdkskdkz zdff hdfj dlsdkfsdf klf dlks dfjlksd fs dlkjsd flk</p>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        <!--Control-->
        <a class="left carousel-control" data-slide="prev" href="#myCarousel"><span class="icon-prev"></span></a>
        <a class="right carousel-control" data-slide="next" href="#myCarousel"><span class="icon-next"></span></a>
    </div>
<!-- END CAROUSEL-->
       </div>
</section>
</div>

<!-- video (a revoir?)-->
<div>
  <div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <iframe width='560' height='315' src="https://www.youtube.com/embed/ERuEmzVcTTg"></iframe>
        </div>
      </div>
    </div>
</div>
</div><!-- end video-->

<div id="HomeAbout"><!-- HOMEABOUT-->
    <section>
        <div class="containerSpecial">
            <div id="titreHomeAbout"class="titre">
                <h3>Welcome on Astuteds</h3>
                <hr id="titreLine" />
            </div>
            <div class="row">
                <div id="iconHomeAbout1" class="col-lg-4 col-sm-4">
                    <div class="icon11">
                        <div class="icon1">
                           <a href="#"><img src="/Images/parallax.png" /></a>  <!-- FOCUS ICON-->
                        </div>
                        <h5>BlaBla1</h5>
                        <p class="imgDescription">
                            Bla Bla blabla bla bal bzefj  zv vzkbvazi zdv bmzdvhb zev evzouzvobv zvze vhbov
                        </p>
                    </div>
                 </div>
                <div id="iconHomeAbout2" class="col-lg-4 col-sm-4">
                    <div class="icon22">
                        <div class="icon1">
                           <a href="#"><img src="/Images/parallax.png" /></a>  <!-- FOCUS ICON-->
                        </div>
                        <h5>BlaBla2</h5>
                        <p class="imgDescription2">
                            Bla Bla blabla bla bal bzefj  zv vzkbvazi zdv bmzdvhb zev evzouzvobv zvze vhbov
                        </p>
                    </div>
                 </div>
                <div id="iconHomeAbout3" class="col-lg-4 col-sm-4">
                    <div class="icon33">
                        <div class="icon1">
                           <a href="#"><img src="/Images/parallax.png" /></a>  <!-- FOCUS ICON-->
                        </div>
                        <h5>BlaBla3</h5>
                        <p class="imgDescription3">
                            Bla Bla blabla bla bal bzefj  zv vzkbvazi zdv bmzdvhb zev evzouzvobv zvze vhbov
                        </p>
                    </div>
                 </div>
            </div>
            <hr id="finArticle" />
         </div>
    </section>
</div>
   
    <div id="News"> 
        <section>
        <div class="containerSpecial">
            <div id="titreNews">
                <h5>WHAT'S NEW ?</h5>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-4">
                    <a href="#"><img src="/Images/robot-bike-3dprint.jpg" /></a>
                    <h6><span>Title latest News</span></h6>
                    <p>Something new i can't believe what i see omg sisi</p>
                </div>
                <div class="col-lg-4 col-sm-4">
                    <h6>Other News</h6>
                    <div id="fakeNews1">
                        <p>blabla bla news 1 bla bnjbdb djbsdjo sdvnlsdvk</p>
                        <p>bla bla bla news 2 hdhsd; shqbi sdvbg evnojdbvo d</p>
                        <p>news Bla bla 3 he ledhcf jv vjrkddn vgdjd</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-4">
                    <h6>Other bla</h6>
                    <div id="fakeNews2">
                        <p>bl bla bla news 1 jfjfj fjsyh azh bzv</p>
                        <p>blala bla news 2 dkd kdd  dfgdb</p>
                        <p>news Blabla 3 fgfh  shs xkxse</p>
                    </div>
                </div>
            </div>
          </div>
            </section>
        </div>


<script src="Scripts/carousel.js"></script>
<script src="Scripts/bootstrap.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
      <script>
          function Show() {
              var theModal = $(this).data("target"),
              videoSRC = $(this).attr("data-video"),
              videoSRCauto = videoSRC + "?modestbranding=1&rel=0&controls=0&showinfo=0&html5=1&autoplay=1";
              $(theModal + ' iframe').attr('src', videoSRCauto);
              $(theModal + ' button.close').click(function () {
                  $(theModal + ' iframe').attr('src', videoSRC);
              });
          }
          
  </script>
</asp:Content>
