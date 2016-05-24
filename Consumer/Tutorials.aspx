<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tutorials.aspx.cs" Inherits="Consumer.Tutorials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Tutorials</h1>
    <div class="col-md-3">
        <input type="text" class="form-control tuto_search" placeholder="Search">
        <ul id="list_tuto" class="list-unstyled">
        <asp:ListView ID="LVTuto" runat="server" ItemType="Consumer.ServiceReference1.TutorialItem" SelectMethod="GetTutorials" GroupItemCount="1" >
            <ItemTemplate>            
                <li class="tutoClick" onclick="showTuto('<%#: Item._id %>')"><a><%#: Item.Title %></a></li>
            </ItemTemplate>
        </asp:ListView>
        </ul>
    </div>

    <!-- placeholder for views -->
    <div class="col-md-9" id="tutoPlaceholder"></div>
    <script type="text/javascript" src="Tutorials.js"></script>
</asp:Content>
