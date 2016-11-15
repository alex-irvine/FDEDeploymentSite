<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TutorialEditor.aspx.cs" Inherits="Administration.TutorialEditor" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:TextBox runat="server" ID="TutorialID" Style="display:none;" Text=""/>
    
    <div class="News_option">
        <button runat="server" OnClick="Remove_Tutorial" class="btn btn-default" ><span class="glyphicon glyphicon-remove-circle"></span></button>
    </div>
    
    <div class="dropdownPDF">
        <p> Add a PDF ?</p>
        <asp:DropDownList ID="DropDownListID"  runat="server"></asp:DropDownList>
        <asp:Button ID="btnGet" runat="server" Text="Show URL"></asp:Button>
        <%--<p id="urlPDFdisplay" runat="server"></p>--%>

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
                <asp:TextBox runat="server" placeholder="Video Youtube Link"  CssClass="VideoTextBox form-control" Text="<%#: Item.Video %>"/>

                <iframe  class="VideoFrame" src="<%#: Item.Video %>" id="caseVideo" ></iframe>
                

                <asp:TextBox runat="server" ID="TutorialText" CssClass="editorEx" Text="<%#: Item.Text %>"/>

                <asp:LinkButton runat="server" OnClick="DeletePage" CssClass="btn btn-lg btn-danger" CommandArgument="<%#: Item.PageNumber %>">Remove page </asp:LinkButton>
                <asp:LinkButton runat="server" OnClick="RankDown" CssClass="btn btn-lg" CommandArgument="<%#: Item.PageNumber %>">-1 </asp:LinkButton>
                <asp:LinkButton runat="server" OnClick="RankUp" CssClass="btn btn-lg" CommandArgument="<%#: Item.PageNumber %>">+1 </asp:LinkButton>
                <hr class="separate">
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
    <style>
        .separate{
            max-width: 300px;
            border: 2px solid #0d0d0d;
        }
        
    .dropdownPDF {
        float: right;
        position: relative;
        display: inline-block;
    
    }
        </style>
    <script src="Scripts/jquery-te-1.4.0.js"></script>
    <script>
        //$(document).ready(function () {
        //    //$('.VideoFrame[src=""]').hide();
        //    $('.VideoFrame:not([src=""])').show();
        //});

        $(".VideoTextBox").keyup(function () {
            //alert("test");
            // Get Url
            var url = $(this).val();
            var video;
            if(!url){
                video = "is empty";
            }
             //Check link style
            var v = url.indexOf("?v=");
            if (v > 0) {
                v += 3;
                video = url.substring(v);
            } else {
                video = url;
            }
            
            // if Url is not complete            
            if ((!url.contains("/embed/"))&&(url.length==11)) {
                video = "http://www.youtube.com/embed/" + video;
            } else if ((url.contains("/embed/")) && (url.length == 41)) {
                video = url;
            }else{
                video = "";
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
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=btnGet]").click(function () {
                var ddlpdf = $("[id*=DropDownListID]");
                var selectedText = ddlpdf.find("option:selected").text();
                var selectedValue = ddlpdf.val();
                alert("PDF name Selected : " + selectedText + "\n\n You can copy and paste this url : \n" +window.location.host+ selectedValue);
                return false;
            });
        });
    </script>

</asp:Content>
