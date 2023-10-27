<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_candidate.aspx.cs" Inherits="Online_Voting_System.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <style type="text/css">
        .auto-style1 {
            
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            width: 166px;
        }
        .auto-style4 {
            height: 23px;
            width: 166px;
        }
         .header{
            font-size:28px;
            color :  white;
            margin-right: 400px;
        }

         .header1{
             font-size:28px;
             font-family:Verdana, Geneva, Tahoma, sans-serif;
             padding-bottom:60px;
         }
       #approved_user
       {
          
           margin-right:15px;
       }
       #add_candidate
       {
           margin-right:15px;
       }

       #add_result
       {
           margin-right:260px;
       }
       .form-control{
           margin-top:10px;
           margin-bottom:10px;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark bg-dark">
             
                    <div class="header">Admin Panel</div></>
                
                    

                    <asp:Button class="btn btn-primary" ID="approved_user" runat="server"  Text="Approve User" />

                    <asp:Button class="btn btn-primary" ID="add_candidate" runat="server"  Text="Add Candidate" />

                    <asp:Button class="btn btn-primary" ID="add_result" runat="server"  Text="Generate Result" />

                   <asp:Button class="btn btn-danger" ID="logout" runat="server"  Text ="Logout" OnClick="logout_Click" /> 
             </nav>
        <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         <center> <table class="auto-style1">
                <tr>
                    <td class="header1">ADD CANDIDATE</td>
                </tr>
             <tr>

                 <td>
                     <asp:TextBox class="form-control" ID="Candidatename_txt" runat="server" placeholder=" Enter Candidate Name" Width="250px"></asp:TextBox>
                 </td>
             </tr>
                <tr>
                    
                    <td class="auto-style2">
                        <asp:TextBox class="form-control" ID="party_txt" runat="server" placeholder="Enter Party Name"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                   
                    <td>
                        <asp:RadioButtonList ID="gendertxt" runat="server">
                            <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    
                    <td class="auto-style2">
                        <asp:Button class="btn btn-danger" ID="back_button" runat ="server" OnClick="back_button_click" Text="Back" />
                        <asp:Button class="btn btn-primary" ID="candidate_added" runat="server" OnClick="candidate_added_Click" Text="Add Candidate" />
                    </td>
                </tr>
            </table></center>  
        </div>
    </form>
</body>
</html>
