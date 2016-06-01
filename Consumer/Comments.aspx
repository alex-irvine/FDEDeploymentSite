<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="Consumer.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Comments</h1>
    <label for="comment">Add a new comment/suggestion :</label>
    <textarea runat="server" class="form-control" rows="5" id="comment"></textarea>
    <asp:Button id="btnAddComment" runat="server" text="Add"  OnClick="btnAddComment_Click" CssClass="btn btn-success btn-addcomment"/>

    <ul class="list_comments">
        <asp:ListView ID="LVComments" runat="server" ItemType="Consumer.ServiceReference1.Comment" SelectMethod="GetComments" GroupItemCount="1" >
            <ItemTemplate>            
                <li><strong><%#: Item.Author %></strong> : <%#: Item.Text %></li>
            </ItemTemplate>
        </asp:ListView>
    </ul>
</asp:Content>
