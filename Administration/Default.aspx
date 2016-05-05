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
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <%--<GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>--%>
        <ItemTemplate>
            <%--<td class="news_box" runat="server"><asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/News?id={0}", Item.Id) %>'>--%>
                <!--<img src="<%#: Item.picture %>" alt="" />-->
                <%--<h1 class="news_title"><%#: Item.title %></h1>--%>
                <%--<p class="news_description"><%#: Item.description %></p>--%>
            <td><%#: Item.title %></td>
            <td><%#: Item.description %></td>
            <td><asp:Button runat="server" Text="Edit"/></td>
            <td><asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/News?id={0}", Item.Id) %>'>See</asp:HyperLink></td>
            <%--</asp:HyperLink>
            </td>--%>
        </ItemTemplate>
        <LayoutTemplate>
            <table style="width:100%;">
                <tbody>
                    <tr>
                        <td>
                            <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                <tr id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr></tr>
                </tbody>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <style>
        .news_box{
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
        }

    </style>
</asp:Content>
