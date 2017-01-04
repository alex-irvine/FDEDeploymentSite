<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CADES._Default" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<link rel="stylesheet" href="/Content/firstPageCades.css" />
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>



<section id="homeCades">
     <div class="containerSpecial">
            <h1 style="color:#1879ba"><span><b>CADES</b></span></h1>
            <h5>Computer-Aided Design and Engineering Software </h5>
            <hr class="light-sep">

           <div>
                <table style="width:100%;border-collapse: collapse;border-spacing: 0;">
                  <tr style="width:800px">
                    <td style="width:49%;vertical-align:top">
                        <div style="margin-left:10px;margin-top:10px;text-align: justify;">
                            <h4 style="color:#1879ba">CADES Research Center: </h4>
                            <p style="font-size: 14px;">Founded in October 2015, the Computer-aided Design and Engineering Software (CADES) 
                                research center is a multi-disciplinary intellectual hub focusing on the research and development of next generation 
                                computer-aided design techniques in the field of engineering, design and technology. With members from Europe, North America 
                                and Asia, the core interests of the CADES research team lies in Computational Intelligence Techniques for Engineering Design, 
                                Down-to-earth Intelligent Engineering Design Applications and Engineering Software Development. CADES Homepage aims at providing 
                                conceptual CAD tools for critical problems in engineering design that have not yet been addressed by available tools. <br /><br />
                                At present, research and development concentrations of CADES include: <br /></p>
                            <ul style="font-size: 14px;text-align:left;color:#1879ba">
                                <li><b>Machine Learning and Surrogate Modelling, Optimization, Numerical Analysis, Multi-physics Analytics and Verifications</b></li>
                                <li><b>Electromagnetic Device Design, Integrated Circuit Design and Mechanics Design </b></li>
                                <li><b>Human-Computer Interaction and Software Engineering </b>  </li>
                            </ul>
                            <p style="font-size: 14px;">The conceptual CAD tools produced by CADES do not aim at repeating functions of existing commercial tools, 
                                but aim at providing solutions for critical problems that have not yet been addressed by available tools. Registered users can download 
                                CAD software tools from this website and provide feedback for our further improvement. Free registration is opened to engineers, researchers and students. 
                                CADES welcomes collaborations (or membership) with CAD tool vendors, independent ventures focusing on engineering design as well as academic institutes and universities.  </p>
                        </div>
                    </td>
                    <td style="width:2%">
                    </td>
                    <td style="width:49%;vertical-align:central">
                        <div id="CarouselDiv"><!-- HOMEABOUT-->
        <div class="containerCarousel">
            <div class="carousel slide" id="myCarousel">
                <!--Indicator-->
                   <%-- <ol class="carousel-indicators">
                        <li class="active" data-target="#myCarousel" data-slide-to="0"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>--%>
                <!--Wrapper for slides-->
                <div class="carousel-inner">
                    <div class="item active" id="slide1">
                            <div class="carousel-caption">
                                <p style="text-align:center;font-size:18px;margin-top:170px;color:#000;">300-GHz waveguide filter (fabricated in Birmingham UK)</p>
                                <p style="text-align:center;font-size:18px;color:#000;">A Sample Product Synthesized by CADES Intelligent Design Automation Tools</p>
                            </div>
                    </div>
                    <div class="item" id="slide2">
                            <div class="carousel-caption">
                                <%--<p style="text-align:center">A CADES Design Explorer</p>--%>
                            </div>
                    </div>
                    <%--<div class="item" id="slide3">
                            <div class="carousel-caption">

                            </div>
                    </div>--%>
                </div>
                <!--Control-->
                <a class="left carousel-control" data-slide="prev" href="#myCarousel"><span class="icon-prev"></span></a>
                <a class="right carousel-control" data-slide="next" href="#myCarousel"><span class="icon-next"></span></a>
            </div>
        <!-- END CAROUSEL-->
        </div>
</div>
                        <div style="margin-top:20px">
                            <img src="Images/CADES_Block_Diagram.jpg" style="margin-top:15px;margin-bottom:20px;width: 250px;"/>
                        </div>
                    </td> 
                  </tr>
                </table>
            </div>
    </div>
</section>
</asp:Content>
