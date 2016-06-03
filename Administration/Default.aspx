<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Administration._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Home page -->
    <h2>News</h2>
    <!-- Add news -->
    <% if(isAdmin){ %>
        <asp:Button runat="server" Text="Add a news" OnClick="NewNews_Click" CssClass="btn btn-default"/>
    <% } %>
    <!-- Display the news -->
    <table id="NewsTable" class="table table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Content</th>
                        <th>Last Modification</th>
                        <th>Action</th>
                    </tr>
                </thead>
        <asp:ListView ID="LVNews" runat="server" ItemType="Administration.ServiceReference1.NewsItem" OnPreRender="DataPagerNews_PreRender">
            <EmptyDataTemplate>
                <tbody>
                    <tr>
                        <td>No news was returned.</td>
                    </tr>
                </tbody>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr>
                    <td class="published<%#: Item.Published %>"><h4><%#: Item.Title %></h4></td>
                    <td class="published<%#: Item.Published %>"><%#: Regex.Replace(Item.Text, "<.*?>", " ") %></td>
                    <td class="published<%#: Item.Published %>"><%#: Item.Date_modified %></td>
                    <td class="published<%#: Item.Published %>">
                        <% if(isAdmin){ %>
                            <asp:HyperLink runat="server" NavigateUrl='<%# "~/NewsEditor?id="+Item._id %>' CssClass="btn btn-default">Edit</asp:HyperLink>
                        <% } %>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "~/News?id="+Item._id %>' CssClass="btn btn-default">See</asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                    <tbody id="itemPlaceholderContainer" runat="server">
                        <tr id="itemPlaceholder" runat="server"></tr>
                    </tbody>
            </LayoutTemplate>
        </asp:ListView>
    </table>
    <style>
        .publishedFalse{
            background : #f68181;
        }
        
    </style>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function () {
            $("#NewsTable").DataTable();
        });
    </script>
</asp:Content>
