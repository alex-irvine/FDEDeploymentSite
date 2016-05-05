<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewsEditor.aspx.cs" Inherits="Administration.NewsEditor" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <asp:TextBox runat="server" ID="NewsID" Style="display:none;" Text=""/>
    
    <div class="News_option">
        <button runat="server" OnClick="Remove_News" class="btn btn-default" ><span class="glyphicon glyphicon-remove-circle"></span></button>
    </div>
    
    <asp:Label runat="server">News title</asp:Label>
    <asp:TextBox runat="server" ID="NewsTitle" CssClass="form-control" Text=""/>

    
    <asp:TextBox runat="server" ID="NewsText" CssClass="editorEx" Text=""/>
    
    <!--<asp:Label runat="server" ID="NewsFinal" CssClass="news"></asp:Label>-->
    <br />
    <asp:Button runat="server" OnClick="Edit_News" Text="Submit" CssClass="btn btn-default" />

    <script src="Scripts/jquery-te-1.4.0.js"></script>
    <script>

        $(".editorEx").jqte({
            "css": "jqte",
            "source": true,
            "titletext": [
                { title: "Text Format" },
                { title: "Font Size" },
                { title: "Select Color" },
                { title: "Bold", hotkey: "B" },
                { title: "Italic", hotkey: "I" },
                { title: "Underline", hotkey: "U" },
                { title: "Ordered List", hotkey: "." },
                { title: "Unordered List", hotkey: "," },
                { title: "Subscript", hotkey: "down arrow" },
                { title: "Superscript", hotkey: "up arrow" },
                { title: "Outdent", hotkey: "left arrow" },
                { title: "Indent", hotkey: "right arrow" },
                { title: "Justify Left" },
                { title: "Justify Center" },
                { title: "Justify Right" },
                { title: "Strike Through", hotkey: "K" },
                { title: "Add Link", hotkey: "L" },
                { title: "Remove Link", hotkey: "" },
                { title: "Cleaner Style", hotkey: "Delete" },
                { title: "Horizontal Rule", hotkey: "H" },
                { title: "Source", hotkey: "" }
            ],
            button: "SEND",

        });


    </script>
    
</asp:Content>
