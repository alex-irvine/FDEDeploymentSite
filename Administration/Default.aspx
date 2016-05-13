<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Administration._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Home page -->
    <h2>News</h2>
    <!-- Add news -->
    <% if(isAdmin){ %>
        <asp:Button runat="server" Text="Add a news" OnClick="NewNews_Click" CssClass="btn btn-default"/>
    <% } %>
    <!-- Display the news -->

    <asp:ListView ID="LVNews" runat="server" ItemType="NewsItem">
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td>No news was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <h1>Test</h1>
            <%--<td class="published<%#: Item.Published %>"><h4><%#: Item.Title %></h4></td>
            <td class="published<%#: Item.Published %>"><%#: Regex.Replace(Item.Text, "<.*?>", " ").Substring(0,140) %></td>
            <td class="published<%#: Item.Published %>"><%#: Item.Date_modified %></td>
            <td class="published<%#: Item.Published %>">
                <% if(isAdmin){ %>
                    <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/NewsEditor?id={0}", Item._id) %>' CssClass="btn btn-default">Edit</asp:HyperLink>
                <% } %>
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/News?id={0}", Item._id) %>' CssClass="btn btn-default">See</asp:HyperLink>
            </td>--%>
            
        </ItemTemplate>
        <LayoutTemplate>
            
            <table id="itemPlaceholderContainer" runat="server" style="width: 100%" class="table table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Content</th>
                        <th>Last Modification</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="itemPlaceholder"></tr>
                </tbody>
            </table>
            
           
            <asp:DataPager ID="DataPagerNews" runat="server" PagedControlID="LVNews" PageSize="5" OnPreRender="DataPagerNews_PreRender">
            <Fields>
                <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowNextPageButton="False" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowLastPageButton="True" ShowPreviousPageButton="False" />
            </Fields>
        </asp:DataPager>
        </LayoutTemplate>
    </asp:ListView>
    <style>
        .publishedFalse{
            background : #f68181;
        }
        
    </style>
</asp:Content>
