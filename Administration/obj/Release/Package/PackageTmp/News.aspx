<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Administration.News" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <% if(isAdmin){ %>
    <asp:TextBox runat="server" ID="NewsID" style="display:none;" CssClass="form-control" Text=""/>
    <h1><%: NewsContent.Title %></h1>

    <div>
        <asp:Label ID="ErreurMessage" runat="server" > </asp:Label>
    </div>
    <div class="News_option">
        <asp:LinkButton runat="server" OnClick="PublishClick" CssClass="btn btn-lg btn-success"><span title="Publish" class="glyphicon glyphicon-remove-circle"></span></asp:LinkButton>
        <asp:LinkButton runat="server" OnClick="UnPublishClick" CssClass="btn btn-lg btn-warning"><span title="unpublish" class="glyphicon glyphicon-remove-circle"></span></asp:LinkButton>
        <asp:LinkButton runat="server" OnClick="DeleteClick" CssClass="btn btn-lg btn-danger"><span title="Delete" class="glyphicon glyphicon-remove-circle"></span></asp:LinkButton>
            <%--<asp:HyperLink runat="server" NavigateUrl="~/News/Publish_News" CssClass="btn btn-lg btn-success" ><span title="Publish" class="glyphicon glyphicon-remove-circle"></span></asp:HyperLink>
            <asp:HyperLink runat="server" NavigateUrl="~/News/Remove_News" CssClass="btn btn-lg btn-danger" ><span class="glyphicon glyphicon-remove-circle"></span></asp:HyperLink>--%>
        <a href="NewsEditor?id=<%: NewsContent._id %>" class="btn btn-lg btn-default"><span class="glyphicon glyphicon-wrench"></span></a>
    </div>
    
    
    <asp:Label runat="server" ID="NewsFinal" CssClass="news"></asp:Label>

    <div class="NewsData">
        <asp:Label runat="server" ID="Author" ></asp:Label>
        <br />
        <asp:Label runat="server" ID="Published" ></asp:Label>
        <br />
        <asp:Label runat="server" ID="Modified" ></asp:Label>
    </div>
    <% } %>
</asp:Content>
