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
                    <a href="TutorialEditor?id=<%#: Item.Id %>&page=<%#: Item.page %>" class="btn btn-lg btn-default"><span class="glyphicon glyphicon-wrench"></span></a>
                </div>
            <% } %>
    
            
            <asp:Label ID="TutorialText" runat="server" CssClass="editorEx"><%#: Item.text %></asp:Label>
            <script>
                /*var e = document.createElement('div');
                e.innerHTML = $.parseHTML("");
                $(".editorEx").append(e.toString());*/
                //alert(e.innerHTML);
                //$(".editorEx").innerHTML = $(".content").innerHTML;
            </script>
            <div class="NewsData">
                <asp:Label runat="server" ID="Author" ><%#: Item.userId %></asp:Label>
                <br />
                <asp:Label runat="server" ID="Published" ><%#: Item.date_published %></asp:Label>
                <br />
                <asp:Label runat="server" ID="Modified" ><%#: Item.date_modified %></asp:Label>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            
            <table runat="server" style="width: 100%" class="table table-hover">
                <tbody>
                    <tr id="itemPlaceholderContainer"  runat="server">
                        <td id="itemPlaceholder" runat="server"> </td>
                    </tr>
                </tbody>
            </table>
            <asp:DataPager ID="DataPagerProducts" runat="server" PagedControlID="LVTutorials" PageSize="1" OnPreRender="DataPagerProducts_PreRender">
            <Fields>
                <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" />
            </Fields>
        </asp:DataPager>
        </LayoutTemplate>
    </asp:ListView>

</asp:Content>
