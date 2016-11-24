<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Consumer._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Content/carousel.css" />
    <link rel="stylesheet" href="Content/Site.css" />
    <link rel="stylesheet" href="fonts/style.css" />
    <script src="carousel.js"></script>

 <style>
     .btn-transparent {
         background: transparent;
         border: 3px solid #fff;
         padding: 15px 30px;
         font-size: 14px;
         border-radius: 0;
         color: #fff;
         font-weight: 700;
         letter-spacing: 0.05em;
         text-transform: uppercase;
     }
     .btnnews{
         background: #fff;
         border-radius: 0;
         color: #24242a;
         border: 3px solid #24242a;
         text-transform: uppercase;
     }
     .btnnews:hover{
         background: #24242a;
         border-radius: 0;
         color: #fff;
         border: 3px solid #24242a;
         text-transform: uppercase;
     }
     #newspartie .news .newsHeader:hover{
        background-color: rgba(36, 36, 42, 1);
        border-bottom: 1px solid #24242a;
        color:#fff;
    }
    .grpbtnnews{
        text-align:center;
        margin-bottom:100px;
    }
    .btnDownloadDefault {
        -webkit-appearance: none;
        -moz-appearance: none;
        outline: none;
        border: 0;
        background: transparent;
    }

	</style>
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
                            <h4></h4>
                            <h1><span>ADE </span>1.0</h1>
                            <h3>Antenna Design Explorer</h3>
                            <br />
                            <a class="btn btn-transparent" href="/Software">Download</a>
                        </div>
                </div>
                <div class="item" id="slide2">
                        <div class="carousel-caption">
                            <h4>Free documentation / Tutorials</h4>
                            <h1><span>ADE </span>1.0</h1>
                            <h3>Antenna Design Explorer</h3>
                            <br />
                            <a class="btn btn-transparent" href="/Tutorials">Tutorials</a>
                        </div>
                </div>
                <div class="item" id="slide3">
                        <div class="carousel-caption">
                            <h4>Contact us / Comments</h4>
                            <h1><span>ADE </span>1.0</h1>
                            <h3>Antenna Design Explorer</h3>
                            <br />
                            <a class="btn btn-transparent" href="/Comments">Comments</a>
                        </div>
                </div>
            </div>
            <!--Control-->
            <a class="left carousel-control" data-slide="prev" href="#myCarousel"><span class="icon-prev"></span></a>
            <a class="right carousel-control" data-slide="next" href="#myCarousel"><span class="icon-next"></span></a>
        </div>
    <!-- END CAROUSEL-->
    <!--ABOUT-->
        <section id="services">
        <div class="container">
            <h2><span>ADE </span>1.0</h2>
            <h2>Antenna Design Explorer</h2>
            <hr class="light-sep">
            <div id="videoYtb">
                <iframe runat="server" id="ifYt" class='tutovideo' width='560' height='315' ClientIDMode="static"></iframe>
            </div>

 <div class="services-box">
                <div class="row wow fadeInUp" >
                    <div class="col-md-4">
                        <div class="media-left"><a href="/About"><span class="icon-uniE030"></span></a></div>
                        <div class="media-body">
                            <h3 >About</h3>
                            <p>You can find informations about the ADE 1.0 here</p>
                        </div>
                    </div>
                        <div class="col-md-4">
                            <div class="media-left">
                           <% if (!isApproved) { %>
                                <a href="/Account/Login"><span class="icon-uniE04D"></span></a>
                            <% } else { %>
                                <asp:LinkButton ID="LinkButton1" 
                                    runat="server"   
                                    OnClick="btnDownload_Click">
                                    <span aria-hidden="true" class="icon-uniE04D" style="cursor:pointer" ></span>
                                </asp:LinkButton>
                            <% } %>
                            </div>
                            <div class="media-body">
                                <h3>Download now</h3>
                                <p>Download the ADE 1.0</p>
                            </div>

                    </div>
                    <div class="col-md-4">
                        <div class="media-left"><a href="/Comments"><span class="icon-connection"></span></a></div>
                        <div class="media-body">
                            <h3>Comment</h3>
                            <p>Leave a comment about the ADE 1.0</p>
                        </div>
                    </div>
                </div>
                <div class="row wow fadeInUp" >
                        <div class="col-md-4">
                            <div class="media-left"><a href="/KeyFeatures"><span class="icon-uniE00E"></span></a></div>
                            <div class="media-body">
                                <h3>Key Features</h3>
                                <p>You can find key features of the ADE 1.0</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="media-left"><a href="/Tutorials"><span class="icon-uniE02B"></span></a></div>
                            <div class="media-body">
                                <h3>Tutorials</h3>
                                <p>Get access and view the ADE 1.0 tutorials</p>
                            </div>

                        </div>
                    <div class="col-md-4">
                        <div class="media-left"><a href="/Contact"><span class="icon-uniE049"></span></a></div>
                        <div class="media-body">
                            <h3>Contact us</h3>
                            <p>You can contact us here</p>
                        </div>

                    </div>
                    </div>
                </div>
            </div>
    </section>
   
    <!-- news -->
    <section id="newspartie">
    <div class="newstitre">
        <h2>News</h2>
        <hr class="sep">
    </div>
    <asp:ListView ID="LVNews" runat="server" ItemType="Consumer.ServiceReference1.NewsItem" OnPreRender="DataPagerNews_PreRender">
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td>No news was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"> </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>           
            
            <td>
                <div class="news">
                    <div class="newsHeader">
                        <h2 class="newsTitle"><%#: Item.Title %></h2>
                        <em class="newsDate"><%#: Item.Date_modified %></em>
                    </div> 
                    <div class="newsText"><%# Item.Text %></div>
                </div>
            </td>

        </ItemTemplate>
        <LayoutTemplate>
            
            <table id="groupPlaceholderContainer" runat="server" style="width: 100%" class="table">
                <tr id="groupPlaceholder"></tr>
            </table>
            <div class="grpbtnnews">
            <asp:DataPager ID="DataPagerNews" runat="server" PagedControlID="LVNews" PageSize="5" OnPreRender="DataPagerNews_PreRender">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btnnews" ShowFirstPageButton="True" ShowNextPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btnnews" ShowLastPageButton="True" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
           </div>
        </LayoutTemplate>
    </asp:ListView>
    <script type="text/javascript" src="News.js"></script>
        </section>


</asp:Content>

