<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tutorials.aspx.cs" Inherits="Administration.Tutorials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<!-- Home page -->
    <h2>Tutorials</h2>
    <!-- Add news -->
    <% if(isAdmin){ %>
        <asp:Button runat="server" Text="Add a tutorial" OnClick="New_Tutorial" CssClass="btn btn-default"/>
    <% } %>
    
    <table id="TutorialTable"  style="width: 100%" class="table table-hover">
        <thead>
            <tr>
                <th>Title</th>
                <th>Last Modification</th>
                <th>Action</th>
            </tr>
        </thead>
        <asp:ListView ID="LVTuto" runat="server" ItemType="Administration.ServiceReference1.TutorialItem" OnPreRender="LVTuto_PreRender">
            <EmptyDataTemplate>
                <tbody>
                    <tr>
                        <td>No news was returned.</td>
                    </tr>
                </tbody>
            </EmptyDataTemplate>
            <%--<GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"> </td>
                </tr>
            </GroupTemplate>--%>
            <ItemTemplate>
                <tr>
                    <td class="published<%#: Item.Published %>"><h4><%#: Item.Title %></h4></td>
                    <td class="published<%#: Item.Published %>"><%#: Item.DateModified %></td>
                    <td class="published<%#: Item.Published %>">
                        <% if(isAdmin){ %>
                            <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/TutorialEditor?id={0}", Item._id) %>' CssClass="btn btn-default">Edit</asp:HyperLink>
                        <% } %>
                        <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/TutorialView?id={0}", Item._id) %>' CssClass="btn btn-default">See</asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <tbody id="itemPlaceholderContainer" runat="server">
                    <tr id="itemPlaceholder" runat="server"> </tr>
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
            $("#TutorialTable").DataTable();
        });
</script>
</asp:Content>
