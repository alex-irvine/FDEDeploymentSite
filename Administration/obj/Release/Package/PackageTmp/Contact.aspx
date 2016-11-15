<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Administration.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        div.tab-content {
        margin: 0 auto;
        clear: both;
        width: 100%;
        table-layout: fixed;
    }
        .columnText {
             word-wrap: break-word;
        }
    </style>

      <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="contactpanel">
        <table id="contactTable" class="display" >
            <thead>
                <tr>
                    <th>Author</th>
                    <th>Email</th>
                    <th class="columnText">Text</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <asp:ListView runat="server" ID="contactlist" ItemType="Administration.ServiceReference1.Contact" OnPreRender="DataPagerContact_PreRender">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No contact was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>            
                    <tr>
                        <td><%#: Item.Author %></td>
                        <td><%#: Item.Email %></td>
                        <td><%#: Item.Text %></td>
                        <td><%#: Item.Date %></td>
                        <td>
                            <asp:LinkButton runat="server" OnClick="DeleteContact_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default btn-danger">Delete</asp:LinkButton>
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
        //$('#myTabs a').click(function (e) {
           // e.preventDefault()
         //   $(this).tab('show')
        //});
        $(document).ready(function () {
            $("#contactTable").DataTable();
        });
        //var table = $('#contactTable').DataTable();

        //$('#tab-content').css('display', 'block');
        //table.columns.adjust().draw();


</script>

</asp:Content>
