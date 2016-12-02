<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Videos.aspx.cs" Inherits="Astudes.Videos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="/Content/firstPage.css" />

<div id="firstDiv">
    <section>
        <div class="containerSpecial2" style="width:1000px !important">
            <div id="titrePage">
                <h5>Resources</h5>
                <h4>Videos</h4>
            </div>
            <div>
                <table style="width:100%;border-collapse: collapse;border-spacing: 0;">
                  <tr style="width:800px;vertical-align:top">
                    <td style="width:150px">
                        <p>video search here ?</p>
                    </td>
                    <td style="width:20px">
                    </td>
                    <td style="width:650px;vertical-align:top">
                        <div style="margin-left:10px;margin-top:10px;">
                            <p>videos here</p>
                        </div>
                    </td>
                    <td style="width:20px">
                    </td>
                    <td style="width:160px;vertical-align:top">
                        <div style="text-align:center"><img src="Images/parallax.png" style="margin-top:15px;margin-bottom:20px"/></div>
                        <p>Additional Links</p>
                        <div style="margin-bottom:20px;border-left:2px solid #b2adad;padding-left:5px"> 
                            <div><a runat="server" href="/Videos">Videos</a></div>
                            <div><a runat="server" href="/CaseStudies">Case Studies</a></div>
                            <div><a runat="server" href="/Presentations">Presentations</a></div>
                        </div>
                        <p>Discover Astute</p>
                        <div style="margin-bottom:20px;border-left:2px solid #b2adad;padding-left:5px">
                            <div><a href="/Product">Product</a></div>
                            <div><a href="/People">People</a></div>
                            <div><a href="/Service">Service</a></div>
                        </div>
                    </td> 
                  </tr>
                </table>
            </div>
            <hr id="finArticle2" />

            </div>
    </section>
</div>
</asp:Content>
