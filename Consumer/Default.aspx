<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Consumer._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Home</h1>
    <!-- news -->
    <asp:ListView ID="LVNews" runat="server" ItemType="Consumer.ServiceReferenceNews.News" SelectMethod="GetNews"
        GroupItemCount="1" >
        <EmptyDataTemplate>
            <table>
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
            
            <td>
                <div class="news">
                    <div class="newsHeader">
                        <h2 class="newsTitle"><%#: Item.title %></h2>
                        <em class="newsDate"><%#: Item.date_modified %></em>
                    </div> 
                    <div class="newsText"><%# Item.text %></div>
                </div>
            </td>

        </ItemTemplate>
        <LayoutTemplate>
            
            <table id="groupPlaceholderContainer" runat="server" style="width: 100%" class="table">
                <tr id="groupPlaceholder"></tr>
            </table>
                        
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
