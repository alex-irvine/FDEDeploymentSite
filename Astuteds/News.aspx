<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Astuteds.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .entry-title{
            text-align: left;
        }
    </style>
<div id="content" class="site-content">
	<div class="container">
        <div class="content-left-wrap col-md-9">
            <div id="primary" class="content-area">
                <header class="entry-header">
                    <h1 class="entry-title" itemprop="headline">News</h1>
                </header><!-- .entry-header -->
                <div class="entry-content">
                    <p>Bla bla Bla</p>
                </div><!-- .entry-content -->
            </div>
        </div>
	</div>
</div>
</asp:Content>
