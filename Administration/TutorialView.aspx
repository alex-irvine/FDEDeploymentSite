<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TutorialView.aspx.cs" Inherits="Administration.TutorialView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <asp:ListView ID="LVTutorials" runat="server" ItemType="Administration.ServiceReferenceNews.Tutorial" OnPreRender="DataPagerProducts_PreRender">
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td>No news was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <asp:TextBox runat="server" ID="TutorialID" style="display:none;" CssClass="form-control" Text="<%#: Item.Id %>"/>
            <asp:TextBox runat="server" ID="TutorialPage" style="display:none;" CssClass="form-control" Text="<%#: Item.page %>"/>
            <h1><%#: Item.title %></h1>

            <% if(isAdmin){ %>
                <div class="News_option">
                    <asp:HyperLink runat="server" NavigateUrl="~/News/Publish_News" CssClass="btn btn-lg btn-success" ><span title="Publish" class="glyphicon glyphicon-remove-circle"></span></asp:HyperLink>
                    <asp:HyperLink runat="server" NavigateUrl="~/News/Remove_News" CssClass="btn btn-lg btn-danger" ><span class="glyphicon glyphicon-remove-circle"></span></asp:HyperLink>
                    <a href="TutorialEditor?id=<%#: Item.Id %>&amp;page=<%#: Item.page %>" class="btn btn-lg btn-default"><span class="glyphicon glyphicon-wrench"></span></a>
                </div>
            <% } %>
            
            <iframe id="VideoFrame<%#: Item.video %>" width="560" height="315" src="<%#: Item.video %>"  allowfullscreen="true"></iframe>
            <style>
                #VideoFrame{
                    display : none;
                }
            </style>
            <div ID="TutorialText" class="editorEx" value="<%#: Item.text%>" >
            </div>

            <script>
                $('.editorEx').html($('.editorEx').attr("value"));
            </script>
        </ItemTemplate>
        <LayoutTemplate>
            
            <div runat="server" style="width: 100%" class="table table-hover">
                
                    <div id="itemPlaceholderContainer"  runat="server">
                        <div id="itemPlaceholder" runat="server"> </div>
                    </div>
                
            </div>
            
           
            <asp:DataPager ID="DataPagerProducts" runat="server" PagedControlID="LVTutorials" PageSize="1" OnPreRender="DataPagerProducts_PreRender">
                <Fields>
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowNextPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowLastPageButton="True" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
    </asp:ListView>
    <asp:Label runat="server" ID="Author" ></asp:Label>
    <br />
    <asp:Label runat="server" ID="Published" ></asp:Label>
    <br />
    <asp:Label runat="server" ID="Modified" ></asp:Label>
</asp:Content>
