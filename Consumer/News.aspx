<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Consumer.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Content/carousel.css" />
    <link rel="stylesheet" href="Content/Site.css" />
    <link rel="stylesheet" href="fonts/style.css" />
    <style>
     .btnnews{
         background: #fff;
         border-radius: 0;
         color: #1879ba;
         border: 3px solid #1879ba;
         text-transform: uppercase;
     }
     .btnnews:hover{
         background: #1879ba;
         border-radius: 0;
         color: #fff;
         border: 3px solid #1879ba;
         text-transform: uppercase;
     }
     #newspartie .news .newsHeader:hover{
        background-color: #1879ba;
        border-bottom: 1px solid #1879ba;
        color:#fff;
    }
    .grpbtnnews{
        text-align:center;
        margin-bottom:100px;
    }
    </style>
        <!-- news -->
    <section id="newspartie">
    <div class="newstitre">
        <h2>News</h2>
        <hr class="sep">
    </div>
    <div class="containerSpecial" style="width:1000px !important">
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
            
                <td style="border:none">
                    <div class="news">
                        <div class="newsHeader">
                            <h4 class="newsTitle"><%#: Item.Title %></h4>
                            <em class="newsDate"><%#: Item.Date_modified %></em>
                        </div> 
                        <div class="newsText" style="text-align:left"><%# Item.Text %></div>
                    </div>
                </td>

            </ItemTemplate>
            <LayoutTemplate>
            
                <table id="groupPlaceholderContainer" runat="server" style="width: 100%;margin-bottom:40px" class="table">
                    <tr id="groupPlaceholder"></tr>
                </table>
                <div class="grpbtnnews">
                <asp:DataPager ID="DataPagerNews" runat="server" PagedControlID="LVNews" PageSize="5" OnPreRender="DataPagerNews_PreRender">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btnnews" ShowFirstPageButton="True" ShowNextPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btnnews" ShowLastPageButton="True" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
               </div>
            </LayoutTemplate>
        </asp:ListView>
    </div>
    <script type="text/javascript" src="News.js"></script>
        </section>


</asp:Content>
