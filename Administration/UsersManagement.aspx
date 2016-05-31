<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsersManagement.aspx.cs" Inherits="Administration.UsersManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Nav tabs -->
  <ul class="nav nav-tabs nav-justified" role="tablist">
    <li role="presentation" class="active"><a href="#NotApproved" aria-controls="NotApproved" role="tab" data-toggle="tab">Not Approved Users</a></li>
    <li role="presentation"><a href="#Approved" aria-controls="Approved" role="tab" data-toggle="tab">Approved Users</a></li>
    <li role="presentation"><a href="#Admin" aria-controls="Admin" role="tab" data-toggle="tab">Administrator</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="NotApproved">
        <asp:ListView runat="server" ID="NotApprovedUsers" ItemType="Administration.ServiceReference1.Person" OnPreRender="Users_PreRender">
            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td>No news was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>            
                <tr>
                    <td><%#: Item.Username %></td>
                    <td><%#: Item.IsAdmin %></td>
                    <td><%#: Item.Company %></td>
                    <td><asp:LinkButton runat="server" OnClick="Approve_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default">Approve</asp:LinkButton></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
            
                <table id="itemPlaceholderContainer" class="table table-hover" runat="server">
                    <thead>
                        <tr>
                            <th>Text</th>
                            <th>Author</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server"> </tr>
                    </tbody>
                </table>
                <asp:DataPager ID="DataPagerUsers" runat="server" PagedControlID="NotApprovedUsers" PageSize="15" OnPreRender="Users_PreRender">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowNextPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowLastPageButton="True" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </LayoutTemplate>
        </asp:ListView>
    </div>
    <div role="tabpanel" class="tab-pane" id="Approved">
        <asp:ListView runat="server" ID="ApprovedUsers" ItemType="Administration.ServiceReference1.Person" OnPreRender="ApprovedUsers_PreRender">
            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td>No news was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>            
                <tr>
                    <td><%#: Item.Username %></td>
                    <td><%#: Item.IsAdmin %></td>
                    <td><%#: Item.Company %></td>
                    <td><asp:LinkButton runat="server" OnClick="NotApprove_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default">Don't approve</asp:LinkButton></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
            
                <table id="itemPlaceholderContainer" class="table table-hover" runat="server">
                    <thead>
                        <tr>
                            <th>Text</th>
                            <th>Author</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server"></tr>
                    </tbody>
                </table>
                <asp:DataPager ID="DataPagerApprovedUsers" runat="server" PagedControlID="ApprovedUsers" PageSize="15" OnPreRender="ApprovedUsers_PreRender">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowNextPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ShowLastPageButton="True" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </LayoutTemplate>
        </asp:ListView>
    </div>
    <div role="tabpanel" class="tab-pane" id="Admin">

    </div>
  </div>
    
    <script>
        $('#myTabs a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        })
    </script>
</asp:Content>
