<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Consumer._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Home</h1>
    <!-- news -->
    <asp:ListView ID="LVNews" runat="server" ItemType="Consumer.ServiceReference1.NewsItem" OnPreRender="DataPagerNews_PreRender">
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
                        <h2 class="newsTitle"><%#: Item.Title %></h2>
                        <em class="newsDate"><%#: Item.Date_modified %></em>
                    </div> 
                    <div class="newsText"><%# Item.Text %></div>
                </div>
            </td>

        </ItemTemplate>
        <LayoutTemplate>
            
            <table id="groupPlaceholderContainer" runat="server" style="width: 100%" class="table">
                <tr id="groupPlaceholder"></tr>
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
</asp:Content>
