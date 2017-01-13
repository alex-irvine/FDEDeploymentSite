<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tutorials.aspx.cs" Inherits="Consumer.Tutorials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Content/carousel.css" />
    <link rel="stylesheet" href="Content/Site.css" />
    <style>
        html, body {
            height: 100%;
        }
        .titre{
            text-align:center;
        }
        #tutopart .table {
          display: table;
          width: 100%;
          border-collapse: separate;
        }
        #tutopart .table .col-md-3{
          display: table-cell;
          width:25%;
          background: #fff;
          border: 2px #3288c1 solid;
          padding: 20px;
          box-shadow: 0 0 0 1px rgba(0,0,0,.15) inset;
          height:auto;
          margin-bottom:20px;
        }
        #tutopart .table .col-md-9{
          display: table-cell;
          width: 75%;
          background: #fff;
          padding: 20px;
        }
         .titre h2 {
            margin-top: 40px;
            text-transform: uppercase;
            color: #24242a;
            text-align: center;
          }

         .footer {
            height: 100px;
            position: absolute;
            bottom: 0;
           }
         #tutopart .table .col-md-3 .tuto_search {
            width: 80%;
            margin-bottom: 10px;
            box-sizing: border-box;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
            border-radius: 0;
            border: 2px solid #3288c1;
            color: #0d0d0d;
        }

        #tutopart .table .col-md-3 .tuto_search:focus {
            border: 3px solid #3288c1;
        }
        #tutopart .table .col-md-3 .listtuto{
            color:#fff;
            list-style-type:none;
            border-left: 2px solid #1879ba;
            padding:10px 10px;
            text-align:left;
        }
        #tutopart .table .col-md-9 .tutoTitle {
            margin: 0;
            margin-bottom: 10px;
            text-align:center;
            color: #24242a;
        }
        #tutopart .table .col-md-9 .videoplayer {
            background-color: rgb(190, 188, 212);
            padding: 15px;
            margin-bottom: 8px;
            color:#24242a;
            border: 2px solid #fff;
            -webkit-transition: 0.5s;
            transition: 0.5s;
        }
        #tutopart .table .col-md-9 .tutotext{
            background-color:#fff;
            margin-bottom:20px;
        }
        #tutopart .table .col-md-9 .videoplayer:hover{
            border: 1px solid #24242a;
        }
        .tutoDivider{
            margin-top:5px;
            margin-bottom:5px;
        }
    </style> 
<div class="containerSpecial" style="width:1200px !important">
    <div id="tutopart">
    <div>
        <div class="titre">
            <h2>Tutorials</h2>
            <hr class="sep">
         </div>
        </div>
    <div class="table">
         <div class="col-md-3">
              <ul id="list_tuto" class="listtuto">
              <asp:ListView ID="LVTuto" runat="server" ItemType="Consumer.ServiceReference1.TutorialItem" SelectMethod="GetTutorials" GroupItemCount="1" >
                  <ItemTemplate>            
                      <li class="tutoClick" onclick="showTuto('<%#: Item._id %>')"><a><%#: Item.Title %></a></li>
                      <hr class="tutoDivider"/>
                  </ItemTemplate>
              </asp:ListView>
              </ul>
              <p style="text-align:left;color:red">
                  Please, click <a href="img/ADEUserGuide.pdf" target="_blank">ADE 1.0 Users’ Guide</a> to download and view the full features of ADE 1.0
              </p>
             <p style="text-align:left;color:red">
                  For common issues please click <a href="img/troubleshooting.pdf" target="_blank">Troubleshooting</a>
              </p>
          </div>

        <!-- placeholder for views -->
        <div class="col-md-9" id="tutoPlaceholder">
            <script type="text/javascript" src="Tutorials.js"></script>
        </div>
    </div>
    </div>
</div>
</asp:Content>
