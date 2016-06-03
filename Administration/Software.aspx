<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Software.aspx.cs" Inherits="Administration.Software" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FileUpload ID="FileInput" runat="server" />
    <asp:Button runat="server" OnClick="Upload_Click" Text="Send"/>
</asp:Content>
