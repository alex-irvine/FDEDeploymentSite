<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Consumer.Contact" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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
         .btnSend{
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
         .btnSend:hover{
             background: #24242a;
             border-radius: 0;
             color: #fff;
             border: 3px solid #24242a;
             text-transform: uppercase;
         }
         .boutonbox{
             text-align:center;
         }

         .form-controlmessage{
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
            .form-controlmessage:focus {
                border: 3px solid #24242a;
            }
            
            .form-control{
                  border-radius: 0;
                  width: 100%;
                  border: 2px solid #24242a;
                  color: #0d0d0d;
                  margin-bottom:30px;
                  background-color: #fff;
                  background-image: none;
                  display: block;
                  padding: 6px 12px;
                  font-size: 14px;
                  vertical-align: middle;
                  max-height:40px;
            }
            .form-control:focus {
                border: 3px solid #24242a;
            }
            .adressecontact{
                 text-align:"center" ;
                 margin-bottom:50px;
            }

</style>


    <section>
    <div class="titre">
        <h2>Contact Us</h2>
        <hr class="sep">
    </div>
  <div class="container">
  <div class="row">
   <div class="col-md-6 col-md-offset-3" >
        <div class="form-group" style="text-align:center">
             <textarea id="namebox" name="namebox" class="form-control" placeholder="Name"  ></textarea>
        </div>
        <div class="form-group" style="text-align:center">
             <textarea id="emailbox" name="emailbox" class="form-control"  placeholder="Email"  ></textarea>
        </div>
        <div class="form-group">
             <textarea id="messagebox" name="messagebox" class="form-controlmessage" rows="5" placeholder="Message"></textarea>
        </div>
        <div class="boutonbox">
            <asp:Button id="btnSend" runat="server" text="Send" OnClick="btnSend_Click" CssClass="btnSend"/>
        </div>
    </div>
   </div>
    </div>
    </section>
    <section>
    <div class:"adressecontact">
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100

        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
    </div>
    </section>
</asp:Content>
