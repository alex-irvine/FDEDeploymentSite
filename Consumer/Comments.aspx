<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="Consumer.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Content/carousel.css" />
    <link rel="stylesheet" href="Content/Site.css" />
    <style>
        .titre{
            text-align:center;
        }
          .titre h2 {
            margin-top: 40px;
            text-transform: uppercase;
            color:  #24242a;
            text-align: center;
          }
          .titre .label1{
            color:  #24242a;
            text-align: center;
            margin-bottom:20px;
          }
          .areatxtcomment{
                  border-radius: 0;
                  border: 2px solid #24242a;
                  color: #0d0d0d;
                  min-height: 45px;
                  background-color: #fff;
                  background-image: none;
                  display: block;
                  width: 100%;
                  height: 140px;
                  padding: 6px 12px;
                  font-size: 14px;
                  vertical-align: middle;
            }
            .areatxtcomment:focus {
                border: 3px solid #24242a;
            }
            .btnaddcomment{
            text-align:center;
             background: #fff;
             border-radius: 0;
             color: #24242a;
             border: 3px solid #24242a;
             text-transform: uppercase;
             width:150px;
             height:35px;
             font-weight: 700;
             letter-spacing: 0.05em;
             margin-top:20px;
             margin-bottom:50px;
         }
         .btnaddcomment:hover{
             background: #24242a;
             border-radius: 0;
             color: #fff;
             border: 3px solid #24242a;
             text-transform: uppercase;
         }
         .boutonbox{
             text-align:center;
         }
    </style>
    <div class="titre">
        <h2>Comments</h2>
        <hr class="sep">
        <label for="comment" class="label1">Add a new comment/suggestion :</label>
    </div>
    <div class="col-md-6 col-md-offset-3 wow fadeInUp">
        <textarea runat="server" class="areatxtcomment" rows="5" id="comment" placeholder="Comment"></textarea>
        <div class="boutonbox">
        <asp:Button id="btnAddComment" runat="server" text="Add"  OnClick="btnAddComment_Click" CssClass="btnaddcomment"/>
            </div>
    </div>
    <ul class="list_comments">
        <asp:ListView ID="LVComments" runat="server" ItemType="Consumer.ServiceReference1.Comment" SelectMethod="GetComments" GroupItemCount="1" >
            <ItemTemplate>            
                <li><strong><%#: Item.Author %></strong> : <%#: Item.Text %></li>
            </ItemTemplate>
        </asp:ListView>
    </ul>
</asp:Content>
