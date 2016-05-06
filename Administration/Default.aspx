<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Administration._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Home page -->
    <h2>News</h2>
    <!-- Add news -->
    <% if(isAdmin){ %>
        <asp:Button runat="server" Text="Add a news" OnClick="NewNews_Click" CssClass="btn btn-default"/>
    <% } %>
    <!-- Display the news -->

    <asp:ListView ID="LVNews" runat="server" ItemType="Administration.ServiceReferenceNews.News" SelectMethod="GetNews"
        GroupItemCount="1" >
        <EmptyDataTemplate>
            <table >
                <tr>
                    <td>No news was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"> </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <%--<td class="news_box" runat="server"><asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/News?id={0}", Item.Id) %>'>--%>
                
                <%--<h1 class="news_title"><%#: Item.title %></h1>--%>
                <%--<p class="news_description"><%#: Item.description %></p>--%>
            
            
            <td class="published<%#: Item.published %>"><h4><%#: Item.title %></h4></td>
            <td class="published<%#: Item.published %>"><%#: Regex.Replace(Item.text, "<.*?>", " ").Substring(0,140) %></td>
            <td class="published<%#: Item.published %>"><%#: Item.date_modified %></td>
            <%--<td><asp:Button runat="server" Text="Edit" CssClass="btn btn-default"/></td>--%>
            <td class="published<%#: Item.published %>">
                <% if(isAdmin){ %>
                    <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/NewsEditor?id={0}", Item.Id) %>' CssClass="btn btn-default">Edit</asp:HyperLink>
                <% } %>
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/News?id={0}", Item.Id) %>' CssClass="btn btn-default">See</asp:HyperLink>
            </td>
            
            <%--</asp:HyperLink>
            </td>--%>
        </ItemTemplate>
        <LayoutTemplate>
            
            <table id="groupPlaceholderContainer" runat="server" style="width: 100%" class="table table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Content</th>
                        <th>Last Modification</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="groupPlaceholder"></tr>
                </tbody>
            </table>
                        
        </LayoutTemplate>
    </asp:ListView>
    <style>
        .publishedFalse{
            background : #f68181;
        }
        /*.news_box{
            vertical-align : top;
            text-align : center;
            max-width : 15%;
            max-height : 15%;
            margin : 10px;
        }
        .news_box img{
            width : 100%;
            height : 100%;
            padding : 10px;
        }
        .news_box:hover{
            box-shadow : 0px 0px 5px #CCC;
            cursor:pointer;
        }
        .news_title{
            font-size : 1.5em;
        }*/

    </style>
</asp:Content>
