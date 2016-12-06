<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Consumer.About" %>
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
            border: 2px solid #3288c1;
            margin-top: 30px;
            margin-bottom: 30px;
        }
          .ptext{
              text-align:center;
          }
          .ptext2{
              text-align:center;
              color:red;
          }
    </style>
    
 <section>
    <div class="titre">
        <h2>About</h2>
        <hr class="sep">
    </div>

     <div class="container-fluid">
	        <div class="row">
		        <div class="col-md-2">
		        </div>
		        <div class="col-md-8">
                             <p style="text-align:center;">Developed by the <a href="~/">CADES Research Centre</a>, the Antenna Design Explorer (ADE) 1.0 is a Graphics 
                                            User Interface (GUI)-based optimisation tool that runs in the MATLAB environment. The aim 
                                            of ADE 1.0 is to optimize antenna geometrical design parameters so as to satisfy the design
                                            specifications and optimize the selected performance(s) in an EFFICIENT manner. At present, 
                                            local optimization and global optimization methods are included in many existing antenna design 
                                            explorers or optimizers (e.g. CST optimizer, MATLAB optimization or global optimization toolbox
                                            and ADS optimization tool). Local optimization methods require a good initial design, which is 
                                            often not available; global optimization methods can often obtain a good design, but they cost
                                            very long or prohibitive time. ADE 1.0 is proposed to address this challenge. 
                                         </p>
                                         <p style="text-align:center;">
                                             To run the ADE 1.0, the user-defined inputs include the antenna simulation model or evaluation file, 
                                             antenna design variables and their design ranges, optimization goal(s) and constraints. Currently, 
                                             three optimisation algorithms are carefully selected in the ADE 1.0: the surrogate assisted 
                                             differential evolution algorithm (SADEA), the differential evolution (DE) algorithm and the 
                                             multi objective evolutionary algorithm based on decomposition (MOEA/D). ADE 1.0 also allows users
                                             to adopt customized algorithms or evaluation functions depending on what is most suitable for
                                             the antenna problem. The output of the ADE 1.0 is an antenna profile with optimal geometrical design
                                             parameters.
                                         </p>
                                        <br>
                                         <p style="text-align:center;color:red;">
                                             Please, click <a href="~/">‘ADE 1.0 Users’ Guide’</a> to download and view the full features of the ADE 1.0
                                         </p>
		        </div>
		        <div class="col-md-2">
		        </div>
	        </div>
    </div>







</section>
</asp:Content>
