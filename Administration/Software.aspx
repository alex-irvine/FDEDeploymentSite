<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Software.aspx.cs" Inherits="Administration.Software" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FileUpload ID="FileInput" runat="server" />
    <asp:Button runat="server" OnClick="Upload_Click" Text="Send"/>
    <asp:Label runat="server" ID="Status" ></asp:Label>
    
    
    <div class="progress">
        <asp:Panel ID="Test" runat="server" CssClass="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width: 25%">
            <span class="sr-only">45% Complete</span>
        </asp:Panel>
    </div>
</asp:Content>
