<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Administration.News" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <asp:TextBox runat="server" ID="NewsID" style="display:none;" CssClass="form-control" Text=""/>
    <h1><%: NewsContent.title %></h1>

    <% if(isAdmin){ %>
        <asp:HyperLink runat="server" NavigateUrl="~/News/Publish_News" CssClass="btn btn-default" ><span class="glyphicon glyphicon-remove-circle"></span></asp:HyperLink>
        <asp:HyperLink runat="server" NavigateUrl="~/News/Remove_News" CssClass="btn btn-default" ><span class="glyphicon glyphicon-remove-circle"></span></asp:HyperLink>
        <a href="NewsEditor?id=<%: NewsContent.Id %>" class="btn btn-default"><span class="glyphicon glyphicon-wrench"></span></a>
    <% } %>
    
    <asp:Label runat="server" ID="NewsFinal" CssClass="news"></asp:Label>
    
    
</asp:Content>
