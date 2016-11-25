<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Software.aspx.cs" Inherits="Administration.Software" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="text-align:center"> Upload Page</h1>
    <div>
        <asp:Label ID="ErreurMessage" runat="server" > </asp:Label>
    </div>
    <br />
    <br />
    <div style="text-align:center">
    <asp:FileUpload ID="FileInput" runat="server" />

    <br />
    <asp:Label runat="server" ID="Status" ></asp:Label>
    <asp:Label ID="EndMessage" runat="server" > </asp:Label>
    <br />
   
    <div runat="server" ID="theProgressBar" style="text-align:center;margin:auto">
        <img src="ProgressBar.gif" id="gifbar" style="display:none" />
        <h5 id="messageload" style="display:none">Uploading...</h5>
    </div>

       <asp:Button runat="server" OnClick="Upload_Click" Text="Send" OnClientClick="ShowProgressBar();"/>
    </div>


    <script>
        function ShowProgressBar() {
            document.getElementById('gifbar').style.display = "block";
            document.getElementById('gifbar').style.margin = "auto";
            document.getElementById('messageload').style.display = "block";
    }

    </script>



</asp:Content>
