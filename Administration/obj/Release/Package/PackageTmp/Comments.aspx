<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="Administration.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <!-- Nav tabs -->
  <ul class="nav nav-tabs nav-justified" role="tablist">
    <li role="presentation" class="active"><a href="#NotApproved" aria-controls="NotApproved" role="tab" data-toggle="tab">New comments</a></li>
    <li role="presentation"><a href="#Approved" aria-controls="Approved" role="tab" data-toggle="tab">Approved Comments</a></li>
  </ul>
    <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="NotApproved">
        <table id="NotApprovedTable" class="display" >
            <thead>
                <tr>
                    <th>Text</th>
                    <th>Author</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Text</th>
                    <th>Author</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </tfoot>
            <asp:ListView runat="server" ID="Unpublished_Comments" ItemType="Administration.ServiceReference1.Comment" OnPreRender="DataPagerUnpublished_PreRender">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No news was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>            
                    <tr>
                        <td><%#: Item.Text %></td>
                        <td><%#: Item.Author %></td>
                        <td><%#: Item.Date_published %></td>
                        <td>
                            <asp:LinkButton runat="server" OnClick="Publish_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-lg btn-success">Publish</asp:LinkButton>
                            <asp:LinkButton runat="server" OnClick="DeleteComment_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default btn-danger">Delete</asp:LinkButton>
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
    </div>
    <div role="tabpanel" class="tab-pane" id="Approved">
        <table id="ApprovedTable" class="display" >
            <thead>
                <tr>
                    <th>Text</th>
                    <th>Author</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Text</th>
                    <th>Author</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </tfoot>
            <asp:ListView runat="server" ID="Published_Comments" ItemType="Administration.ServiceReference1.Comment" OnPreRender="DataPagerPublished_PreRender">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No news was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>            
                    <tr>
                        <td><%#: Item.Text %></td>
                        <td><%#: Item.Author %></td>
                        <td><%#: Item.Date_published %></td>
                        <td>
                            <asp:LinkButton runat="server" OnClick="Unpublish_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-lg btn-warning">Unpublish</asp:LinkButton>
                            <asp:LinkButton runat="server" OnClick="DeleteComment_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default btn-danger">Delete</asp:LinkButton>
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
    </div>
</div>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script>
        $('#myTabs a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $(document).ready(function () {
            $("#ApprovedTable").DataTable();
        });
        $(document).ready(function () {
            $("#NotApprovedTable").DataTable();
        });
</script>

    
</asp:Content>
