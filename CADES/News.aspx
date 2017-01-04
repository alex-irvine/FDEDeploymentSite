<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="CADES.News" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <link rel="stylesheet" href="/Content/firstPageCades.css" />

<section style="margin-top:100px">
     <div class="containerSpecial">
            <h2><span>News</span></h2>
            <hr class="light-sep">


            <div style="text-align:left">
                <table id="news1" style="width:100%;border-collapse: collapse;border-spacing: 5px 30px;">
                  <tr style="width:auto">
                    <td style="width:auto;border:2px solid #1879ba;">
                        <p><span style="color:#1879ba">[01/01/2017]:</span> ADE 2.0 is being planned by the CADES EM team. One of the key features is to support multi-fidelity efficient antenna design optimization for antenna problems involving very computationally expensive EM simulations. </p>
                    </td>
                  </tr>
                </table>
                <table id="news2" style="margin-top:30px;width:100%;border-collapse: collapse;border-spacing: 5px 30px;">
                   <tr style="width:auto">
                    <td style="width:auto;border:2px solid #1879ba;">
                        <p><span style="color:#1879ba">[15/01/2017]: </span> CADES IC team is expected to release HSPICE COMPANION around summer 2017. This GUI-based software tool aims to highly improve the usability of Synopsys HSPICE and provide substantial support for analog IC design exploration researchers and engineers. </p>
                    </td>
                  </tr>
                </table>
                <table id="news3" style="margin-top:30px;width:100%;border-collapse: collapse;border-spacing: 5px 30px;">
                   <tr style="width:auto">
                    <td style="width:auto;border:2px solid #1879ba;">
                        <p><span style="color:#1879ba">[04/01/2017]: </span> Microwave Filter Efficient Global Optimizer is being developed by the CADES EM team. It aims at providing highly optimal filter designs when the initial design is poor and when local optimization cannot solve the problem. The software tool is expected to be released in Spring, 2017. </p>
                    </td>
                  </tr>
                </table>
            </div>
    </div>
</section>
</asp:Content>
