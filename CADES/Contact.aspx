<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CADES.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link rel="stylesheet" href="/Content/firstPageCades.css" />
    <style>
          .btnSend{
            text-align:center;
             background: #fff;
             border-radius: 3px;
             color: #24242a;
             border: 3px solid #1879ba;
             text-transform: uppercase;
             width:150px;
             height:35px;
             font-weight: 700;
             letter-spacing: 0.05em;
             margin-top:20px;
             margin-bottom:50px;
         }
         .btnSend:hover{
             background: #1879ba;
             border-radius: 0;
             color: #fff;
             border: 3px solid #1879ba;
             text-transform: uppercase;
         }
         .boutonbox{
             text-align:center;
         }

         .form-controlmessage{
                  border-radius: 3px;
                  border: 2px solid #1879ba;
                  color: #0d0d0d;
                  min-height: 45px;
                  background-color: #fff;
                  background-image: none;
                  display: block;
                  width: 100%;
                  height: 140px;
                  padding: 6px 12px;
                  font-size: 14px;
                  vertical-align: middle;
            }
            .form-controlmessage:focus {
                border: 3px solid #1879ba;
            }
            
            .form-control{
                  border-radius: 3px;
                  width: 100%;
                  border: 2px solid #1879ba;
                  color: #0d0d0d;
                  margin-bottom:30px;
                  background-color: #fff;
                  background-image: none;
                  display: block;
                  padding: 6px 12px;
                  font-size: 14px;
                  vertical-align: middle;
                  max-height:40px;
            }
            .form-control:focus {
                border: 3px solid #1879ba;
            }
    </style>
<section style="margin-top:100px">
     <div class="containerSpecial">
            <h2><span>Contact Us</span></h2>
            <hr class="light-sep">
           <div class="row">
               <div class="col-md-6 col-md-offset-3" >
                    <div class="form-group" style="text-align:center">
                         <textarea id="namebox" name="namebox" class="form-control" placeholder="Name"  ></textarea>
                    </div>
                    <div class="form-group" style="text-align:center">
                         <textarea id="emailbox" name="emailbox" class="form-control"  placeholder="Email (Official)"  ></textarea>
                    </div>
                    <div class="form-group" style="text-align:center">
                         <textarea id="organizationbox" name="organizationbox" class="form-control"  placeholder="Affiliation / Organization"  ></textarea>
                    </div>
                    <div class="form-group" style="text-align:center">
                         <textarea id="disciplinebox" name="disciplinebox" class="form-control"  placeholder="Discipline"  ></textarea>
                    </div>
                    <div class="form-group">
                         <textarea id="messagebox" name="messagebox" class="form-controlmessage" rows="5" placeholder="Message"></textarea>
                    </div>
                    <div class="boutonbox">
                        <asp:Button id="btnSend" runat="server" text="Send" OnClick="btnSend_Click" CssClass="btnSend"/>
                    </div>
                </div>
               </div>
         </div>
</section>
</asp:Content>