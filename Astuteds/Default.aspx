<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Astuteds._Default" %>

<asp:Content runat="server" ID="MainContent" ContentPlaceHolderID="MainContent">
    <link rel="stylesheet" href="~/Content/style.css" />
    <link rel="stylesheet" href="~/Content/style2.css" />
    <link rel="stylesheet" href="~/Content/bootstrap.css" />
    

    <style>
        .custom-background {
            background-image: url('../Images/electronic-circuit-design.jpg');
            background-repeat: repeat;
            background-position: top left;
            background-attachment: scroll;
        }
        .custom-background {
            background-position: top center !important;
            background-attachment: fixed !important;
        }
        .contact-us{
            background-image: url('../Images/electronic-circuit-design.jpg');
            background-repeat: repeat;
            background-position: top left;
            background-attachment: scroll;
            background-position: top center !important;
            background-attachment: fixed !important;
        }
        
        html { margin-top: 0px !important; }
        * html body { margin-top: 0px !important; }
        @media screen and ( max-width: 782px ) {
		    html { margin-top: 0px !important; }
		    * html body { margin-top: 0px !important; }
	    }

        .container.body-content {
            width: inherit;
        }
</style>
   

<div class="custom-background" >
    <section>
        <div class="home-header-wrap">
            <div class="header-content-wrap">
                <div class="container">
                    <h1 class="intro-text">SITE UNDER CONSTRUCTION   Please contact us @        info@astuteds.co.uk</h1>
                    <div class="buttons">
                        <a href="~/" class="btn btn-primary custom-button red-btn">Features</a>
                        <a href="~/" class="btn btn-primary custom-button green-btn">What's inside</a>
                    </div>
                 </div>

            </div><!-- .header-content-wrap -->
            <div class="clear"></div>
        </div>
    </section>
</div>

    <section class="focus" id="focus">
	    <div class="container">
		    <!-- SECTION HEADER -->
		    <div class="section-header">
			    <!-- SECTION TITLE AND SUBTITLE -->
			    <h2 class="dark-text">Features</h2>
                <div class="section-legend">What makes this single-page WordPress theme unique.</div>
		    </div>
		    <div class="row">	
            <div class="col-lg-3 col-sm-3 focus-box">	
				    <div class="service-icon">			
						    <a href="#"><i class="pixeden" style="background:url('../Images/parallax.png') no-repeat center;width:100%; height:100%;"></i> <!-- FOCUS ICON--></a>
				    </div>
                <h3 class="red-border-bottom">PARALLAX EFFECT</h3>
                <!-- FOCUS HEADING -->
			    <p>Create memorable pages with smooth parallax effects that everyone loves. Also, use our lightweight content slider offering you smooth and great-looking animations.</p>	
            </div>
            <div class="col-lg-3 col-sm-3 focus-box">		
				    <div class="service-icon">				
						    <a href="#"><i class="pixeden" style="background:url('../Images/woo.png') no-repeat center;width:100%; height:100%;"></i> <!-- FOCUS ICON--></a>
				    </div>
                <h3 class="red-border-bottom">WOOCOMMERCE</h3>
                <!-- FOCUS HEADING -->
			    <p>Build a front page for your WooCommerce store in a matter of minutes. The neat and clean presentation will help your sales and make your store accessible to everyone.</p>	
            </div>
            <div class="col-lg-3 col-sm-3 focus-box">		
				    <div class="service-icon">		
						    <a href="#"><i class="pixeden" style="background:url('../Images/ccc.png') no-repeat center;width:100%; height:100%;"></i> <!-- FOCUS ICON--></a>	
				    </div>
                <h3 class="red-border-bottom">CUSTOM CONTENT BLOCKS</h3>
                <!-- FOCUS HEADING -->
			    <p>Showcase your team, products, clients, about info, testimonials, latest posts from the blog, contact form, additional calls to action. Everything translation ready.</p>	
            </div>
            <div class="col-lg-3 col-sm-3 focus-box" data-scrollreveal="enter left after 0.15s over 1s">	
				    <div class="service-icon">			
						    <a href="#"><i class="pixeden" style="background:url('../Images/ti-logo.png') no-repeat center;width:100%; height:100%;"></i> <!-- FOCUS ICON--></a>
				    </div>
                <h3 class="red-border-bottom">GO PRO FOR MORE FEATURES</h3>
                <!-- FOCUS HEADING -->
			    <p>Get new content blocks: pricing table, Google Maps, and more. Change the sections order, display each block exactly where you need it, customize the blocks with whatever colors you wish.</p>	
            </div>
		    </div>
	    </div> <!-- / END CONTAINER -->
    </section>  <!-- / END FOCUS SECTION -->



    <section class="about-us" id="aboutus">
	    <div class="container">
		    <!-- SECTION HEADER -->
		    <div class="section-header">

			    <h2 class="white-text">About</h2><div class="white-text section-legend">Use this section to showcase important details about your business.</div>
		    </div><!-- / END SECTION HEADER -->
		    <!-- 3 COLUMNS OF ABOUT US-->
		    <div class="row">
			    <!-- COLUMN 1 - BIG MESSAGE ABOUT THE COMPANY-->
		    <div class="col-lg-4 col-md-4 column zerif-rtl-big-title">
                <div class="big-intro" data-scrollreveal="enter left after 0s over 1s">Everything you see here is responsive and mobile-friendly.</div>
		    </div>
            <div class="col-lg-4 col-md-4 column zerif_about_us_center text_and_skills" data-scrollreveal="enter bottom after 0s over 1s">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec massa enim. Aliquam viverra at est ullamcorper sollicitudin. Proin a leo sit amet nunc malesuada 
                   imperdiet pharetra ut eros.<br><br> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec massa enim. Aliquam viverra at est ullamcorper sollicitudin.
                   Proin a leo sit amet nunc malesuada imperdiet pharetra ut eros. <br><br>Mauris vel nunc at ipsum fermentum pellentesque quis ut massa. Cum sociis natoque penatibus
                   et magnis dis parturient montes, nascetur ridiculus mus. Maecenas non adipiscing massa. Sed ut fringilla sapien. Cras sollicitudin, lectus sed tincidunt cursus, 
                   magna lectus vehicula augue, a lobortis dui orci et est.</p>
            </div>		
            <div class="col-lg-4 col-md-4 column zerif-rtl-skills ">
			    <ul class="skills" data-scrollreveal="enter right after 0s over 1s">
				    <!-- SKILL ONE -->
				    <li class="skill skill_1">
					    <div class="skill-count">
                            <input type="text" value="80" data-thickness=".2" class="skill1" tabindex="-1">
					    </div>
                        <div class="section-legend">YOUR SKILL #1</div>
				    </li>
				    <!-- SKILL TWO -->
				    <li class="skill skill_2">
					    <div class="skill-count">
                            <input type="text" value="91" data-thickness=".2" class="skill2" tabindex="-1">
					    </div>
                        <div class="section-legend">YOUR SKILL #2</div>
				    </li>
				    <!-- SKILL THREE -->
				    <li class="skill skill_3">
					    <div class="skill-count">
                            <input type="text" value="88" data-thickness=".2" class="skill3" tabindex="-1">
					    </div>
                        <div class="section-legend">YOUR SKILL #3</div>
				    </li>
				    <!-- SKILL FOUR -->
				    <li class="skill skill_4">
					    <div class="skill-count">
                            <input type="text" value="95" data-thickness=".2" class="skill4" tabindex="-1">
					    </div>
                        <div class="section-legend">YOUR SKILL #4</div>
				    </li>	
			    </ul>
		    </div> <!-- / END SKILLS COLUMN-->
	    </div> <!-- / END 3 COLUMNS OF ABOUT US-->
	    <!-- CLIENTS -->
	    </div> <!-- / END CONTAINER -->
    </section> <!-- END ABOUT US SECTION -->



    <section class="latest-news" id="latestnews">
        <div class="container">
            <div class="section-header">
                <h2 class="dark-text">Latest news</h2>
            </div><!-- END .section-header -->
            <div class="clear"></div>
            <div id="carousel-homepage-latestnews" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <div class="col-sm-3 latestnews-box">
                            <div class="latestnews-img">
                                <a class="latestnews-img-a" href="http://astuteds.co.uk/index.php/2016/09/11/this-website-under-construction/" title="This Website Under-Construction   For any inquiries please contact us at     info@astuteds.co.uk">
                                    <img src="http://astuteds.co.uk/wp-content/themes/zerif-lite/images/blank-latestposts.png" alt="This Website Under-Construction     For any inquiries please contact us at              info@astuteds.co.uk" />
                                </a>
                            </div>
                            <div class="latesnews-content">
                                <h3 class="latestnews-title">
                                    <a href="http://astuteds.co.uk/index.php/2016/09/11/this-website-under-construction/" title="This Website Under-Construction    For any inquiries please contact us at      info@astuteds.co.uk">This Website Under-Construction For any inquiries please contact us at info@astuteds.co.uk</a>
                                </h3>
                            </div>
                        </div><!-- .latestnews-box"> -->
                        <div class="clear"></div>
                    </div>
                </div><!-- .carousel-inner -->
                <a class="left carousel-control" href="#carousel-homepage-latestnews" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
			    </a>
                <a class="right carousel-control" href="#carousel-homepage-latestnews" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
			    </a>
           </div><!-- #carousel-homepage-latestnews -->
        </div><!-- .container -->
    </section>


    <section class="contact-us" id="contact">
        <div class="container">
	        <!-- SECTION HEADER -->
            <div class="section-header">
                <h2 class="white-text">Get in touch</h2>					
            </div>
		    <!-- / END SECTION HEADER -->
            <!-- CONTACT FORM-->
		    <div class="row">
                <form role="form" method="POST" action="" onSubmit="this.scrollPosition.value=(document.body.scrollTop || document.documentElement.scrollTop)" class="contact-form">
                    <input type="hidden" name="scrollPosition">
                    <input type="hidden" name="submitted" id="submitted" value="true" />
                    <div class="col-lg-4 col-sm-4 zerif-rtl-contact-name" data-scrollreveal="enter left after 0s over 1s">
                        <label for="myname" class="screen-reader-text">Your Name</label>
                        <input required="required" type="text" name="myname" id="myname" placeholder="Your Name" class="form-control input-box" value="">
                    </div>
                    <div class="col-lg-4 col-sm-4 zerif-rtl-contact-email" data-scrollreveal="enter left after 0s over 1s">
                        <label for="myemail" class="screen-reader-text">Your Email</label>
                        <input required="required" type="email" name="myemail" id="myemail" placeholder="Your Email" class="form-control input-box" value="">
				    </div>
                    <div class="col-lg-4 col-sm-4 zerif-rtl-contact-subject" data-scrollreveal="enter left after 0s over 1s">
                        <label for="mysubject" class="screen-reader-text">Subject</label>
                        <input required="required" type="text" name="mysubject" id="mysubject" placeholder="Subject" class="form-control input-box" value="">
				    </div>
                    <div class="col-lg-12 col-sm-12" data-scrollreveal="enter right after 0s over 1s">
                        <label for="mymessage" class="screen-reader-text">Your Message</label>
                        <textarea name="mymessage" id="mymessage" class="form-control textarea-box" placeholder="Your Message"></textarea>
				    </div>
                    <button class="btn btn-primary custom-button red-btn" type="submit" data-scrollreveal="enter left after 0s over 1s">Send Message</button>
                </form>
		    </div><!-- / END CONTACT FORM-->
        </div> <!-- / END CONTAINER -->
            
    </section> <!-- / END CONTACT US SECTION-->

 
<%--    <script type='text/javascript' src="Scripts/Animation/bootstrap.min.js"></script>--%>
<%--    <script type='text/javascript' src="Scripts/Animation/scrollReveals.js"></script>
    <script type='text/javascript' src="Scripts/Animation/smoothscrolls.js"></script>--%>
<%--    circle of skills--%>
    <script type='text/javascript' src="Scripts/Animation/jquery.knob.js"></script>
    <script type='text/javascript' src="Scripts/Animation/zerif.js"></script>
    <script src="Scripts/Animation/scroll.js"></script>

</asp:Content>
