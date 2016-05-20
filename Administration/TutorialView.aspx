<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TutorialView.aspx.cs" Inherits="Administration.TutorialView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:TextBox runat="server" ID="TutorialID" style="display:none;" CssClass="form-control" Text="<%#: TutorialContent._id %>"/>
    <%--<asp:TextBox runat="server" ID="TutorialPage" style="display:none;" CssClass="form-control" Text="<%#: Item.page %>"/>--%>

    <asp:ListView ID="LVTuto" runat="server" ItemType="Administration.ServiceReference1.TutorialPage" OnPreRender="DataPagerProducts_PreRender">
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td>No news was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            
            <div>
                <iframe id="VideoFrame<%#: Item.Video %>" width="560" height="315" src="<%#: Item.Video %>"  allowfullscreen="true"></iframe>
                <style>
                    #VideoFrame{
                        display : none;
                    }
                </style>
                <div  class="editorEx" value="<%#: Item.Text %>"><%#: Item.Text%>
                </div>


                <script>
                    $('.editorEx').html($('.editorEx').attr("value"));
                </script>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            
            <div runat="server" style="width: 100%" class="table table-hover">
                    <h1><%: TutorialContent.Title %></h1>
                
                    <div class="News_option">
                        <asp:LinkButton runat="server" OnClick="PublishClick" CssClass="btn btn-lg btn-success"><span title="Publish" class="glyphicon glyphicon-remove-circle"></span></asp:LinkButton>
                        <asp:LinkButton runat="server" OnClick="UnPublishClick" CssClass="btn btn-lg btn-warning"><span title="unpublish" class="glyphicon glyphicon-remove-circle"></span></asp:LinkButton>
                        <asp:LinkButton runat="server" OnClick="DeleteClick" CssClass="btn btn-lg btn-danger"><span title="Delete" class="glyphicon glyphicon-remove-circle"></span></asp:LinkButton>
                        <a href="TutorialEditor?id=<%: TutorialContent._id %>" class="btn btn-lg btn-default"><span class="glyphicon glyphicon-wrench"></span></a>
                    </div>
                
                    <div id="itemPlaceholderContainer"  runat="server">
                        <div id="itemPlaceholder" runat="server"> </div>
                    </div>
                
            </div>
            
           
            <asp:DataPager ID="DataPagerProducts" runat="server" PagedControlID="LVTuto" PageSize="1" OnPreRender="DataPagerProducts_PreRender">
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
