<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Astudes.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link rel="stylesheet" href="/Content/firstPage.css" />

<div id="firstDiv">
    <section>
        <div class="containerSpecial2">
            <div id="titrePage">
                <h5>Company</h5>
                <h4>Contact Us</h4>
            </div>
            <div>
                <table style="width:100%;border-collapse: collapse;border-spacing: 0;margin-bottom:50px">
                  <tr style="width:800px">
                    <td style="width:650px;vertical-align:top;">
                     <div style="font-size:14px;color:red">
                        <asp:Literal runat="server" ID="FailureText" />
                    </div>
                    <div class="form-group" style="text-align:center">
                         <textarea id="namebox" name="namebox" class="form-control" rows="1"  placeholder="Name"  ></textarea>
                    </div>
                    <div class="form-group" style="text-align:center">
                         <textarea id="emailbox" name="emailbox" class="form-control" rows="1"  placeholder="Email (Official)"  ></textarea>
                    </div>
                    <div class="form-group" style="text-align:center">
                         <textarea id="organizationbox" name="organizationbox" class="form-control" rows="1"   placeholder="Affiliation / Organization"  ></textarea>
                    </div>
                    <div class="form-group" style="text-align:center">
                         <textarea id="disciplinebox" name="disciplinebox" class="form-control" rows="1"  placeholder="Discipline"  ></textarea>
                    </div>
                    <div class="form-group">
                         <textarea id="messagebox" name="messagebox" class="form-control" rows="5" placeholder="Message"></textarea>
                    </div>
                    <div class="boutonbox">
                        <asp:Button id="btnSend" runat="server" text="Send" CssClass="btnSend"/>
                    </div>
                    </td>
                    <td style="width:40px">
                    </td>
                    <td style="width:140px;vertical-align:top">
                        <div style="text-align:center"><img src="Images/parallax.png" style="margin-top:15px;margin-bottom:20px"/></div>
                        <p>Additional Links</p>
                        <div style="margin-bottom:20px;border-left:2px solid #b2adad;padding-left:5px"> 
                            <div><a href="/About">About Astute</a></div>
                            <div><a href="/News">News</a></div>
                            <div><a href="/Events">Events</a></div>
                            <div><a href="/FollowUs">Follow Us</a></div>
                            <div><a href="/CommunityOutreach">Community Outreach</a></div>
                            <div><a href="/Partners">Partners</a></div>
                            <div><a href="/GlobalLocation">Global Locations</a></div>
                            <div><a href="/Contact">Contact Us</a></div>
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