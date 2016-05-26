<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="Administration.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView runat="server" ID="Published_Comments" ItemType="Administration.ServiceReference1.Comment" OnPreRender="DataPagerPublished_PreRender">
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td>No news was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>            
            <tr>
                <td><%#: Item.Text %></td>
                <td><%#: Item.Author %></td>
                <td><%#: Item.Date_published %></td>
                <td>
                    <asp:LinkButton runat="server" OnClick="Unpublish_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-lg btn-warning"><span title="Unpublish this comment" class="glyphicon glyphicon-remove-circle"></span></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            
            <table id="itemPlaceholderContainer" class="table table-hover" runat="server">
                <thead>
                    <tr>
                        <th>Text</th>
                        <th>Author</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="itemPlaceholder" runat="server"> </tr>
                </tbody>
            </table>
            <asp:DataPager ID="DataPagerPublished" runat="server" PagedControlID="Published_Comments" PageSize="15" OnPreRender="DataPagerPublished_PreRender">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowNextPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowLastPageButton="True" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
    </asp:ListView>

    <asp:ListView runat="server" ID="Unpublished_Comments" ItemType="Administration.ServiceReference1.Comment" OnPreRender="DataPagerUnpublished_PreRender">
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td>No news was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>            
            <tr>
                <td><%#: Item.Text %></td>
                <td><%#: Item.Author %></td>
                <td><%#: Item.Date_published %></td>
                <td>
                    <asp:LinkButton runat="server" OnClick="Publish_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-lg btn-success"><span title="Publish this comment" class="glyphicon glyphicon-remove-circle"></span></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            
            <table id="itemPlaceholderContainer" class="table table-hover" runat="server">
                <thead>
                    <tr>
                        <th>Text</th>
                        <th>Author</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="itemPlaceholder" runat="server"> </tr>
                </tbody>
            </table>
            <asp:DataPager ID="DataPagerUnpublished" runat="server" PagedControlID="Unpublished_Comments" PageSize="15" OnPreRender="DataPagerUnpublished_PreRender">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowNextPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowLastPageButton="True" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
