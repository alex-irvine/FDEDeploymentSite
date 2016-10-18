<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Software.aspx.cs" Inherits="Administration.Software" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FileUpload ID="FileInput" runat="server" />
    <asp:Button runat="server" OnClick="Upload_Click" Text="Send"/>
    <asp:Label runat="server" ID="Status" ></asp:Label>
   
    <asp:Image runat="server" ID="Bar" ImageUrl="~/ProgressBar.gif" Visible="false"/>
    
    <!--<progress id="pBar1" Visible="false"></progress>-->

</asp:Content>
