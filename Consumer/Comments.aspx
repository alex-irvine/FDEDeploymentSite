<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="Consumer.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Comments</h1>
    <label for="comment">Add a new comment/suggestion :</label>
    <textarea runat="server" class="form-control" rows="5" id="comment"></textarea>
    <asp:Button id="btnAddComment" runat="server" text="Add"  OnClick="btnAddComment_Click" CssClass="btn btn-success btn-addcomment"/>

    <ul class="list_comments">
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet</li>
        <li>Lorem ipsum dolor sit amet</li>
    </ul>
</asp:Content>
