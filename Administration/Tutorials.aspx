<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tutorials.aspx.cs" Inherits="Administration.Tutorials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<!-- Home page -->
    <h2>Tutorials</h2>
    <!-- Add news -->
    <% if(isAdmin){ %>
        <asp:Button runat="server" Text="Add a tutorial" OnClick="New_Tutorial" CssClass="btn btn-default"/>
    <% } %>
    <!-- Display the news -->
    <div class="form-inline" >
        <asp:TextBox runat="server" ID="SearchBox" placeholder="Search ..." CssClass="form-control"></asp:TextBox>
        <asp:Button runat="server" OnClick="Search_Click" Text="Search" CssClass="btn btn-default" />
    </div>
    <asp:ListView ID="LVTuto" runat="server" ItemType="Administration.ServiceReference1.TutorialItem" OnPreRender="LVTuto_PreRender"
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
            
            
            <td class="published<%#: Item.Published %>"><h4><%#: Item.Title %></h4></td>
            <%--<td class="published<%#: Item.Published %>"><%#: Regex.Replace(Item.Pages[0].Text, "<.*?>", " ").Substring(0,140) %></td>--%>
            <td class="published<%#: Item.Published %>"><%#: Item.DateModified %></td>
            <%--<td><asp:Button runat="server" Text="Edit" CssClass="btn btn-default"/></td>--%>
            <td class="published<%#: Item.Published %>">
                <% if(isAdmin){ %>
                    <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/TutorialEditor?id={0}", Item._id) %>' CssClass="btn btn-default">Edit</asp:HyperLink>
                <% } %>
                <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/TutorialView?id={0}", Item._id) %>' CssClass="btn btn-default">See</asp:HyperLink>
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
