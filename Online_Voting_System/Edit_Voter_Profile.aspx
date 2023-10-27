<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit_Voter_Profile.aspx.cs" Inherits="Online_Voting_System.Edit_Voter_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <title></title>
    <style type="text/css">
        .auto-style1 {
           
        }
        .auto-style2 {
          
        }
        .auto-style3 {
           
        }
        .auto-style5 {
            
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
           padding-left:40px;
            margin-top:40px;
            margin-bottom:40px;
            font-family:Verdana, Geneva, Tahoma, sans-serif;
            font-size:30px;
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
        .auto-style7 {
           
        }
        .auto-style8 {
            width: 336px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark bg-dark">
            <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label class="header" ID="print_email" runat="server"> </asp:Label>

                                           

                   </td>
                <td>


                   

                    <asp:Button class="btn btn-danger" ID="logout_button" runat="server"   Text="Logout" OnClick="logout_button_Click" />
                

                </td>
            </tr>
           
        </table>
        </nav>
       <center> <table class="auto-style1">
           <tr>
               <td class ="header2">
                        EDIT PROFILE <i class="fa fa-edit"></i>
               </td>
           </tr>
            <tr>
                <td class="auto-style8">Email</td>
                <td>
                    <asp:TextBox class="form-control" ID="emailid_txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Password</td>
                <td>
                    <asp:TextBox class="form-control" ID="password_txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Date of Birth</td>
                <td>
                    <asp:TextBox class="form-control" ID="dob_txt" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Phone Number</td>
                <td>
                    <asp:TextBox class="form-control" ID="phoneno_txt" runat="server" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Address</td>
                <td>
                    <asp:TextBox class="form-control" ID="address_txt" runat="server" Height="18px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Name</td>
                <td>
                    <asp:TextBox class="form-control" ID="Name_txt" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div class="auto-style3">
            <asp:Button class ="btn btn-danger"  ID="back_home" runat="server"  OnClick="back_home_Click" Text="Back" />
            <asp:Button class ="btn btn-primary"  ID="update_btn" runat="server"  OnClick="update_btn_Click" Text="Update" />
            <br />
            <br />
            <table class="auto-style5">
                <tr>
                    <td>
                        <asp:Label  class="fw-bolder text-success"  ID="Successful_msg" runat="server"></asp:Label>
                    </td>
                </tr>
            </table></center>
            <br />
        </div>
    </form>
</body>
</html>
