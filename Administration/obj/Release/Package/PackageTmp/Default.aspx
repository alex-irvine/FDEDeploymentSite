<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Administration._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Home page -->
    <h2>News</h2>
    <!-- Add news -->
    <% if(isAdmin){ %>
        <asp:Button runat="server" Text="Add a news" OnClick="NewNews_Click" CssClass="btn btn-default"/>
    <% } %>
    <!-- Display the news -->
    <div>
        <asp:Label ID="ErreurMessage" runat="server" > </asp:Label>
    </div>

    <table id="NewsTable" class="table table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Content</th>
                        <th>Last Modification</th>
                        <th>Action</th>
                        <th>Publish</th>
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
                            <asp:LinkButton runat="server" OnClick="PublishNewClick"  CommandArgument="<%#: Item._id %>" Cssclass="btn btn-default btnpublish">Publish</asp:LinkButton>
                            <asp:LinkButton runat="server" OnClick="UnPublishNewClick" CommandArgument="<%#: Item._id %>" class="btn btn-default btnunpublish">Unpublish</asp:LinkButton>
                            <asp:LinkButton runat="server" OnClick="DeleteNewClick" CommandArgument="<%#: Item._id %>" class="btn btn-default btndelete">Delete</asp:LinkButton>
                        <% } %>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "~/News?id="+Item._id %>' CssClass="btn btn-default">See</asp:HyperLink>
                    </td>
                    <td class="published<%#: Item.Published %>"><%#: Item.Published %></td>

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
        .btnunpublish{
            background-color:#e5b209;
            color:#333333;

        }
         .btnpublish{
            background-color:#0fbc37;
            color:#333333;
        }
        .btndelete{
            background-color:#db1406;
            color:#333333;
        }

    </style>

    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function () {
            $("#NewsTable").DataTable();
        });
    </script>

     <div class="ytb_input">
         <h4>Youtube Video on Consumer Home page : </h4>
         <asp:TextBox runat="server" ID="UrlYtb"/>
        <asp:Button ID="BtnYtb" runat="server" OnClick="Ytb_URL_Save_Click" Text="Save" CssClass="btnlogin" />
        <h4>Link already in memory :
         </h4>
         <asp:Button ID="ButtonShowUrl" runat="server" OnClick="Bouton_Show_Url_Click" Text="Show Video Url in memory" CssClass="btnlogin" />
         <asp:TextBox ID="TextBoxUrl" runat="server"></asp:TextBox>   
    </div>

</asp:Content>
