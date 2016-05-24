<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Software.aspx.cs" Inherits="Consumer.Downloads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Downloads</h1>
    <!-- test download -->
    <asp:Button ID="btnDownload" runat="server" Text="Download File"  OnClick="btnDownload_Click"/>
</asp:Content>
