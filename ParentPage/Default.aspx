<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ParentPage.Default" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="/Content/bootstrap.css" rel="stylesheet"/>
<link href="/Content/Site.css" rel="stylesheet"/>
<link href="/Content/ParentCss.css" rel="stylesheet"/>

    <title></title>
    <style>
.navbar {
    margin-bottom: 0;
    background-color: #000000;
    z-index: 9999;
    border: 0;
    font-size: 15px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 2px;
    border-radius: 0;
    text-align: center;
}

.navbar li a, .navbar .navbar-brand {
    color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
    color: #808080 !important;
    background-color: #000000 !important;
}

.navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
}
.navbar-nav{
    text-align:center;
}
.navbar-brand{
    margin-top:5px;
    padding:0px 0px;
}
.logomenu{
    margin:0;
    padding:0;
    width: auto;
    height: 35px;
}
.imagelogo{
    margin-bottom: 30px;
    width:300px;
    height:auto;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                     
                      <a class="navbar-brand" runat="server" href="~/"><img src="/Content/logo2navbar.png" alt="LogoCades" class="logomenu" /> </a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                            <li><a href="~/Consumer/Default" class="page-scroll">EM Design Explorer</a></li>
                        </ul>
                    </div>
                </div>
          
        </nav>

    <section id="corps">
        <div class="container">
            <h2>The <br /><span>CADES TEAM</span> Page </h2>
            <hr class="sep" />
            <p>Machine Learning Computer Aided Design Software</p>
            <br />
            <div style="text-align:center">
            <img src="/Content/logoCADES1.png" alt="LogoCades" class="imagelogo" />
            <img src="/Content/logo2_2.png" alt="LogoCades" class="imagelogo" />
            <img src="/Content/logo2_3.png" alt="LogoCades" class="imagelogo" />
            <img src="/Content/logo2_4.png" alt="LogoCades" class="imagelogo" />
            <img src="/Content/logo2_5.png" alt="LogoCades" class="imagelogo" />
            <img src="/Content/logo2_6.png" alt="LogoCades" class="imagelogo" />
            <img src="/Content/logo2_7.png" alt="LogoCades" class="imagelogo" />
            </div>
            <br />
            <p>You can find here all the CADES Team Software</p>
        </div>
    </section>
    </form>
   
</body>
</html>
