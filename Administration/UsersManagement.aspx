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
        <table id="NotApprovedTable" class="display" >
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Administrator</th>
                    <th>Approved</th>
                    <th>Company</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Username</th>
                    <th>Administrator</th>
                    <th>Approved</th>
                    <th>Company</th>
                    <th>Action</th>
                </tr>
            </tfoot>
            <asp:ListView runat="server" ID="NotApprovedUsers" ItemType="Administration.ServiceReference1.Person" OnPreRender="Users_PreRender">
                <EmptyDataTemplate>
                    <tbody>
                        <tr>
                            <td>No news was returned.</td>
                        </tr>
                    </tbody>
                </EmptyDataTemplate>
                <ItemTemplate>            
                    <tr>
                        <td><%#: Item.Username %></td>
                        <td><%#: Item.IsAdmin %></td>
                        <td><%#: Item.IsApproved %></td>
                        <td><%#: Item.Company %></td>
                        <td>
                            <asp:LinkButton runat="server" OnClick="Approve_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default btn-success">Approve</asp:LinkButton>
                            <asp:LinkButton runat="server" OnClick="Delete_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default btn-danger">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
            
                
                        <tbody id="itemPlaceholderContainer">
                            <tr id="itemPlaceholder" runat="server"></tr>
                        </tbody>
                
                </LayoutTemplate>
            </asp:ListView>
        </table>
    </div>
    <div role="tabpanel" class="tab-pane" id="Approved">
        <table id="ApprovedTable" class="display" >
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Administrator</th>
                    <th>Approved</th>
                    <th>Company</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Username</th>
                    <th>Administrator</th>
                    <th>Approved</th>
                    <th>Company</th>
                    <th>Action</th>
                </tr>
            </tfoot>
            <asp:ListView runat="server" ID="ApprovedUsers" ItemType="Administration.ServiceReference1.Person" OnPreRender="ApprovedUsers_PreRender">
                <EmptyDataTemplate>
                    <tbody>
                        <tr>
                            <td>No news was returned.</td>
                        </tr>
                    </tbody>
                </EmptyDataTemplate>
                <ItemTemplate>            
                    <tr>
                        <td><%#: Item.Username %></td>
                        <td><%#: Item.IsAdmin %></td>
                        <td><%#: Item.IsApproved %></td>
                        <td><%#: Item.Company %></td>
                        <td>
                            <asp:LinkButton runat="server" OnClick="NotApprove_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default btn-warning">Disapprove</asp:LinkButton>
                            <asp:LinkButton runat="server" OnClick="Delete_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default btn-danger">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
            
                
                        <tbody id="itemPlaceholderContainer">
                            <tr id="itemPlaceholder" runat="server"></tr>
                        </tbody>
                
                </LayoutTemplate>
            </asp:ListView>
        </table>
    </div>
    <div role="tabpanel" class="tab-pane" id="Admin">
        <table id="AdminTable" class="display" >
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Administrator</th>
                    <th>Approved</th>
                    <th>Company</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Username</th>
                    <th>Administrator</th>
                    <th>Approved</th>
                    <th>Company</th>
                    <th>Action</th>
                </tr>
            </tfoot>
            <asp:ListView runat="server" ID="AdminUsers" ItemType="Administration.ServiceReference1.Person" OnPreRender="Admin_PreRender">
                <EmptyDataTemplate>
                    <tbody>
                        <tr>
                            <td>No news was returned.</td>
                        </tr>
                    </tbody>
                </EmptyDataTemplate>
                <ItemTemplate>            
                    <tr>
                        <td><%#: Item.Username %></td>
                        <td><%#: Item.IsAdmin %></td>
                        <td><%#: Item.IsApproved %></td>
                        <td><%#: Item.Company %></td>
                        <td>
                            <asp:LinkButton runat="server" OnClick="Approve_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default btn-success">Approve</asp:LinkButton>
                            <asp:LinkButton runat="server" OnClick="Delete_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default btn-danger">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
            
                
                        <tbody id="itemPlaceholderContainer">
                            <tr id="itemPlaceholder" runat="server"></tr>
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
        $(document).ready(function () {
            $("#AdminTable").DataTable();
        });
    </script>
</asp:Content>
