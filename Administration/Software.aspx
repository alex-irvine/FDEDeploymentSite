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
    <p id="testing">Test</p>
    <asp:Button OnClientClick="seePercent();" runat="server" Text="See percent"/>
    <script>
        var doit = false;
        function seePercent() {
            $.get("./Software.aspx/GetPercent")
                .done(function (data) {
                    $("#testing").html("Done "+data.d);
                })
                .fail(alert("Fail"))
                .always(alert("Finish"));
        }


        
    </script>

<%--    
<div>
Your Name :
<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
<input id="btnGetTime" type="button" value="Show Current Time"
    onclick = "ShowCurrentTime()" />
</div>

    
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
    <%--<script type = "text/javascript">
        function ShowCurrentTime() {
            $.ajax({
                type: "POST",
                url: "Software.aspx/GetCurrentTime",
                data: '{name: "' + $("#<%=txtUserName.ClientID%>")[0].value + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert("Fail : "+response.d);
            }
        });
    }
        function OnSuccess(response) {
            $("#testing").html(response.d);
            alert("TEst " + response.d);
            for (prop in response) {
                alert(prop + " " + response[prop]);
            }
        }
    </script>--%>

</asp:Content>
