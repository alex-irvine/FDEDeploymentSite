﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Software.aspx.cs" Inherits="Consumer.Downloads" %>
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
            color: #24242a;
            text-align: center;
          }
         .btndownload{
             background: #fff;
             border-radius: 2px;
             color: #24242a;
             border: 3px solid #3288c1;
             text-transform: uppercase;
             width:300px;
             height:50px;
             font-weight: 700;
             letter-spacing: 0.05em;
             margin-top:20px;
         }
         .btndownload:hover{
             background: #3288c1;
             border-radius: 2px;
             color: #fff;
             border: 3px solid #3288c1;
             text-transform: uppercase;
         }
         .boxThings{
            text-align: left;
            margin-top: 10px;
            margin-left: 20px;
            margin-right: 20px;
            background: #f2f2f2;
            padding-bottom: 10px;
            padding-top: 5px;
            padding-left: 10px;
            padding-right: 10px;
         }
    </style>

<section>
    <div class="containerSpecial" style="width:1000px !important;margin-top:50px;">
        <div class="titre">
            <h2>Downloads</h2>
            <hr class="sep">
        </div>
        <div style="font-size:16px;color:red">
              <asp:Literal runat="server" ID="FailureText" />
        </div>
        <div style="margin-bottom:50px">
        <table style="width:100%;border-collapse: collapse;border-spacing: 0;margin-bottom:20px">
           <tr>
                <td style="width:800px;vertical-align:top">
<%--                    <div>
			            <img src="../img/imgSoftware.png" style="max-width:150px"/>
		            </div>--%>
                    <div class="boxThings">
                        <h5><b>Terms & Conditions</b></h5>
                        <p>PDF : <a onclick="openTerms()">Please read and accept by checking the box below</a></p>
                        <asp:CheckBox ID="checkbox1" runat="server"  clientidmode="static" /> I acknowledge that I have read and agree to the above Terms and Conditions<br>
                    </div>
                    <div class="boxThings">
                        <b>Users of the FDE tool should cite:</b>
                        <p>
                            B. Liu, H. Yang, M. Lancaster, “Global Optimization of Microwave Filters Based on a Surrogate Model Assisted Evolutionary Algorithm”, 
                            IEEE Transactions on Microwave Theory and Techniques, 2017 (In press).
                        </p>
                    </div>
                    <div class="boxThings">
                       <h5>Need a tutorial?</h5>
                       <a href="Tutorials">Tutorials</a>
                   </div>
                </td>
               <td style="width:400px;vertical-align:top">
                    <div class="boxThings">
                        <h5><b>Feedback</b></h5>
                        <p>Please fill in this questionnaire once you have used the software. This will help us improve current tools and create new
                            and useful tools.
                        </p>
                        <a href="https://goo.gl/forms/nQmwj5KUq4OvXJ9N2" target="_blank"><p><b>FEEDBACK</b></p></a>
                    </div>
                   <div>
                       <asp:Button ID="btnDownload" runat="server" Text="Download"  OnClick="btnDownload_Click" class="btndownload"/>
                   </div>
                </td>
            </tr>
        </table>
            </div>
    </div>
</section>

<script>
    function openTerms() {
        var url = 'http://' + window.location.host + '/img/NON_commercial_agreement.pdf';
        window.open(url, '_blank');
    }
</script>
</asp:Content>

