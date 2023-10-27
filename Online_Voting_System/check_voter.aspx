<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="check_voter.aspx.cs" Inherits="Online_Voting_System.check_voter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <title></title>
    <style type="text/css">
        .auto-style1 {
            
        }
        .auto-style2 {
            
        }

          .header{
            font-size:25px;
            color :  white;
            margin-top:2px;
            margin-bottom:2px;
            margin-right: 1050px;
          
        }

          #Edit_Profile
         {
          
           margin-right:15px;
         }
       #assigned_vote
       {
           margin-right:500px;
       }
       .header1
       {
           padding-top:80px;
           padding-bottom:20px;
           padding-left:40px;
            margin-top:40px;
            margin-bottom:40px;
            font-family:Verdana, Geneva, Tahoma, sans-serif;
            font-size:25px;
       }

       .header2{

            padding-top:60px;
            padding-bottom:20px;
            padding-left: 80px;
            margin-top: 60px;
            margin-bottom: 40px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: 30px;
            width: 336px;

       }

       #logout_button
       {
          
       }
       .form-control{
           margin-bottom:5px;
       }
    </style>
      </head><body><form id="form1" runat="server">
         <nav class="navbar navbar-dark bg-dark">
            <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label class="header" ID="print_email" runat="server"> </asp:Label>

                                           

                   </td>
                <td>


                 

                    <asp:Button class="btn btn-danger" ID="logout_button" runat="server"   Text="Logout" />
                

                </td>
            </tr>
           
        </table>
        </nav>
        <center><table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="header1">ADD VOTE <i class="fa-solid fa-check-to-slot"></i></td>
            </tr>
            <tr>
               
                <td>
                    <asp:TextBox class="form-control" ID="voterid_txt" runat="server" TextMode="Number" placeholder="Enter Voter ID"></asp:TextBox>
                </td>
            </tr>
            <tr>
                
                <td>
                    <asp:TextBox class="form-control" ID="password_txt" runat="server" TextMode="Password" placeholder="Enter Password" ></asp:TextBox>
                </td>


            </tr>
            <tr>
                <td>
                    <asp:Button class="btn btn-danger" ID="back_button" runat="server" OnClick = "back_click" Text="Back" />
              
                    <asp:Button class="btn btn-primary" ID="verify_voter" runat="server" OnClick="verify_voter_Click" Text="Submit" />
                </td>
            </tr>
            <tr>
             <center>  <td class="auto-style2">
                    <asp:Label Class ="fw-bolder text-danger" ID="wrong_txt" runat="server"></asp:Label>
                </td>
                </center> 
            </tr>
        </table></center>
        <div>
        </div>
    </form>
</body>
</html>
