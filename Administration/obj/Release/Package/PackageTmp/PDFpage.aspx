<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PDFpage.aspx.cs" Inherits="Administration.PDFpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="text-align:center">PDF Page</h1>
    <br />
    <br />
    <div style="text-align:center">
    <asp:FileUpload ID="PdfInput" runat="server" />

     <asp:Button runat="server" OnClick="PDF_Upload_Click" Text="Send" />
    </div>


   <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="pdfpanel">
        <table id="pdfTable" class="display" >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Link</th>
                    <th>Action</th>
                </tr>
            </thead>
            <asp:ListView runat="server" ID="pdflist" ItemType="Administration.ServiceReference1.PDF" OnPreRender="DataPagerPDF_PreRender">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No contact was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>            
                    <tr>
                        <td><%#: Item._id %></td>
                        <td><%#: Item.PdfName %></td>
                        <td><%#: Item.Pdflink %></td>
                        <td>
                            <asp:LinkButton runat="server" OnClick="DeletePdf_Click" CommandArgument="<%#: Item._id %>" CssClass="btn btn-default btn-danger">Delete</asp:LinkButton>
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
</asp:Content>
