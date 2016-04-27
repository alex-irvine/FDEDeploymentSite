<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Administration.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h1><%: NewsContent.title %></h1>
    <textarea class="editorEx" name="text"><h1><b><u><span style="color:rgb(56, 118, 29);font-size: 40px;">WYSIWYG</span></u></b></h1><div style="font-size:16px;">In computing, a <b><span style="font-size:16px;">WYSIWYG</span></b> editor is a system in which content (text and graphics) displayed onscreen during editing appears in a form closely corresponding to its appearance when printed or displayed as a finished product, which might be a printed document, web page, or slide presentation. <b><span style="font-size:16px;">WYSIWYG</span></b> is an acronym for "<i><b><span style="font-size:16px;">what you see is what you get</span></b></i>".</div><img src="http://jqueryte.com//img/sazova-park.jpg" style="float:left; margin:0 10px 10px 0" alt="Sazova Park, Eskisehir"><span style="font-size:16px;"><div style="font-size:16px; color: rgb(51, 51, 51);">WYSIWYG implies a user interface that allows the user to view something very similar to the end result while the document is being created. In general <b><span style="font-size:16px;">WYSIWYG</span></b> implies the ability to directly manipulate the layout of a document without having to type or remember names of layout commands The actual meaning depends on the user&#39;s perspective, e.g.</div><div style="font-size:16px;">Modern software does a good job of optimizing the screen display for a particular type of output. For example, a word processor is optimized for output to a typical printer. The software often emulates the resolution of the printer in order to get as close as possible to <b><span style="font-size:16px;">WYSIWYG</span></b>. However, that is not the main attraction of <b><span style="font-size:18px;">WYSIWYG</span></b>, which is the ability of the user to be able to visualize what he or she is producing.</div><div style="font-size:16px;"><p></div><div style="font-size:16px;"></p></div><div style="font-size:16px;"><span style="font-size:14px;color: rgb(102, 102, 102);"><a href="http://en.wikipedia.org/wiki/WYSIWYG">Source: wikipedia.org</a></span></div></span></textarea>

    
    <script src="Scripts/jquery-te-1.4.0.js"></script>
    <script>

        $(".editorEx").jqte({
            "css": "jqte",
            "source": false,
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
            button : "SEND",

        });

    </script>
</asp:Content>
