<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KeyFeatures.aspx.cs" Inherits="Consumer.KeyFeatures" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link rel="stylesheet" href="Content/carousel.css" />
    <link rel="stylesheet" href="Content/Site.css" />


<style>
        .titre{
            text-align:center;
        }
          .titre h2 {
            margin-top: 40px;
            text-transform: uppercase;
            color:  #24242a;
            text-align: center;
          }
        .sep {
            max-width: 80px;
            border: 2px solid #0d0d0d;
            margin-top: 30px;
            margin-bottom: 30px;
        }
       .ptext2{
              text-align:center;
              color:red;
          }
       .ptext{
           text-align:center;
       }
    </style>


     <section>
    <div class="titre">
        <h2>Key Features</h2>
        <hr class="sep">
    </div>

         <div class="container-fluid">
	        <div class="row">
		        <div class="col-md-2">
		        </div>
		        <div class="col-md-8">
                             <p class="ptext">Some of the key features of the ADE 1.0 include, but are not limited to:</p>
                             <ul class="listkey">
                                <li>Selection and integration of state-of-the-art antenna design exploration approaches and methods
                                    to tackle EFFICIENT antenna optimization over a very broad scope of antenna problems.</li>
                                <li>Enhanced usability developed by addressing Human-computer Interaction (HCI) issues peculiar
                                    to antenna design engineers who are not familiar with design automation and optimization.</li>
                                <li>Conjunctive operations with an existing parallel simulation and optimization tool through
                                    a seamless link: CST Microwave Studio.</li>
                            </ul>
                                        <br>
                                         <p class="ptext2">
                                             Please, click <a href="~/">‘ADE 1.0 Users’ Guide’</a> to download and view the full features of the ADE 1.0
                                         </p>
		        </div>
		        <div class="col-md-2">
		        </div>
	        </div>
    </div>
</section>
</asp:Content>
