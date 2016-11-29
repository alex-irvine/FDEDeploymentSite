<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Software.aspx.cs" Inherits="Consumer.Downloads" %>
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
            color: #24242a;
            text-align: center;
          }
         .btndownload{
             background: #fff;
             border-radius: 2px;
             color: #24242a;
             border: 3px solid #3288c1;
             text-transform: uppercase;
             width:300px;
             height:50px;
             font-weight: 700;
             letter-spacing: 0.05em;
             margin-top:20px;
         }
         .btndownload:hover{
             background: #3288c1;
             border-radius: 2px;
             color: #fff;
             border: 3px solid #3288c1;
             text-transform: uppercase;
         }
         .boxThings{
            text-align: left;
            margin-top: 10px;
            margin-left: 20px;
            margin-right: 20px;
            background: #f2f2f2;
            padding-bottom: 10px;
            padding-top: 5px;
            padding-left: 10px;
            padding-right: 10px;
         }
    </style>

<section>
    <div class="containerSpecial" style="width:1000px !important">
        <div class="titre">
            <h2>Downloads</h2>
            <hr class="sep">
        </div>
        <table style="width:100%;border-collapse: collapse;border-spacing: 0;">
           <tr>
                <td style="width:800px;vertical-align:top">
<%--                    <div>
			            <img src="../img/imgSoftware.png" style="max-width:150px"/>
		            </div>--%>
                    <div class="boxThings">
                        <h5><b>Terms & Utilisations</b></h5>
                        <p>Lorem ipsum dolor sit amet, summo officiis recusabo per ea. 
                            Perfecto postulant elaboraret eos ei, an wisi lorem cum. 
                            Ex ius lobortis intellegat. Cu error graecis vix, per dicit sadipscing ut. 
                            Sea tota dicam minimum eu. Dolore impedit vis in</p>
                         <p>Lorem ipsum dolor sit amet, summo officiis recusabo per ea. 
                            Perfecto postulant elaboraret eos ei, an wisi lorem cum. 
                            Ex ius lobortis intellegat. Cu error graecis vix, per dicit sadipscing ut. 
                            Sea tota dicam minimum eu. Dolore impedit vis in</p>
                        <input type="checkbox" name="" value="">Terms & Utilisations<br>
                    </div>
                    <div class="boxThings">
                       <h5>Need a tutorial ?</h5>
                       <a href="Tutorials">Tutorials</a>
                   </div>
                </td>
               <td style="width:400px;vertical-align:top">
                    <div class="boxThings">
                        <h5><b>Questionnaire</b></h5>
                        <p>question 1 : bla bla blaabla bla ?</p>
                        <input type="checkbox" name="" value="">bla.
                        <input type="checkbox" name="" value="">blo.<br />
                        <p>question 2 : blublu blu blu blluu ?</p>
                        <input type="checkbox" name="" value="">bla.
                        <input type="checkbox" name="" value="">blo.<br />
                        <p>question 3 : bloblo blo blo blloo ?</p>
                        <input type="checkbox" name="" value="">bla.
                        <input type="checkbox" name="" value="">blo.<br />
                        <p>question 4 : blbl bl bl blblblbl ?</p>
                        <input type="checkbox" name="" value="">bla bla blu
                        <input type="checkbox" name="" value="">blo bi blo<br />
                    </div>
                   <div>
                       <asp:Button ID="btnDownload" runat="server" Text="Download File"  OnClick="btnDownload_Click" class="btndownload"/>
                   </div>
                </td>
            </tr>
        </table>
    </div>
</section>


</asp:Content>
