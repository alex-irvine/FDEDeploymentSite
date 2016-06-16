<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TutorialEditor.aspx.cs" Inherits="Administration.TutorialEditor" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:TextBox runat="server" ID="TutorialID" Style="display:none;" Text=""/>
    
    <div class="News_option">
        <button runat="server" OnClick="Remove_Tutorial" class="btn btn-default" ><span class="glyphicon glyphicon-remove-circle"></span></button>
    </div>
    
    <asp:Label runat="server">Tutorial title</asp:Label>
    <asp:TextBox runat="server" ID="TutorialTitle" CssClass="form-control" Text=""/>

    <asp:ListView ID="LVTuto" runat="server" ItemType="Administration.ServiceReference1.TutorialPage" OnPreRender="LVTuto_PreRender" >
        <EmptyDataTemplate>
            <table >
                <tr>
                    <td>No news was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        
        <ItemTemplate>
            <div>
                <asp:TextBox runat="server" CssClass="form-control" Text="<%#: Item.PageNumber %>" style="display:none"/>
                <asp:TextBox runat="server" placeholder="Youtube video url" CssClass="VideoTextBox form-control" Text="<%#: Item.Video %>"/>

                <iframe class="VideoFrame" src="<%#: Item.Video %>"  allowfullscreen></iframe>
    

                <asp:TextBox runat="server" ID="TutorialText" CssClass="editorEx" Text="<%#: Item.Text %>"/>

                <asp:LinkButton runat="server" OnClick="DeletePage" CssClass="btn btn-lg btn-danger" CommandArgument="<%#: Item.PageNumber %>">Remove page </asp:LinkButton>
                <asp:LinkButton runat="server" OnClick="RankDown" CssClass="btn btn-lg" CommandArgument="<%#: Item.PageNumber %>">-1 </asp:LinkButton>
                <asp:LinkButton runat="server" OnClick="RankUp" CssClass="btn btn-lg" CommandArgument="<%#: Item.PageNumber %>">+1 </asp:LinkButton>

            </div>
        </ItemTemplate>
        <LayoutTemplate>
            
            <div id="itemPlaceholderContainer" class="LV_Tuto_Edit" runat="server">
                <div id="itemPlaceholder" runat="server"> </div>
            </div>
                        
        </LayoutTemplate>
    </asp:ListView>


    <br />
    <div class="NewsData">
        <asp:Label runat="server" ID="Author" ></asp:Label>
    </div>
    <asp:Button runat="server" OnClick="NewPage" Text="Create new Page" CssClass="btn btn-default" />
    <asp:Button runat="server" OnClick="Edit_Tutorial" Text="Submit" CssClass="btn btn-default" />

    <script src="Scripts/jquery-te-1.4.0.js"></script>
    <script>

        $(".VideoTextBox").keyup(function () {
            //alert("test");
            // Get Url
            var url = $(this).val();
            var video = url;
            
            // Check link style
            var v = url.indexOf("?v=");
            if (v > 0) {
                v += 3;
                video = url.substring(v);
            }
            
            // if Url is not complete            
            if (!video.contains("/embed/")) {
                video = "http://www.youtube.com/embed/" + video;
            }
            
            $(this).parent().children(".VideoFrame").attr("src", video);
        });

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
