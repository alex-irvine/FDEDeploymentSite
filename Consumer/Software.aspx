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
         .titre .btndownload{
             background: #fff;
             border-radius: 0;
             color: #24242a;
             border: 3px solid #24242a;
             text-transform: uppercase;
             width:300px;
             height:50px;
             font-weight: 700;
             letter-spacing: 0.05em;
             margin-top:20px;
         }
         .titre .btndownload:hover{
             background: #24242a;
             border-radius: 0;
             color: #fff;
             border: 3px solid #24242a;
             text-transform: uppercase;
         }

    </style>
    <div class="titre">
        <h2>Downloads</h2>
        <hr class="sep">


    <!-- test download -->
    <asp:Button ID="btnDownload" runat="server" Text="Download File"  OnClick="btnDownload_Click" class="btndownload"/>
    </div>
</asp:Content>
