<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Online_Voting_System.Register" %>

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
        #Submit_Login {
            margin-left: 150px;
        }
        .auto-style2 {
            height: 29px;
        }
        .auto-style3 {
            height: 29px;
            width: 11px;
        }
        .auto-style4 {
            width: 11px;
        }

        #form1{

            

        }
        #header{
            margin-top:40px;
            margin-bottom:40px;
            font-family:Verdana, Geneva, Tahoma, sans-serif;
            font-size:30px;
        }
        .form-control
        {
          
            margin-bottom:8px;

        }
        
        .btn btn-primary
        {
            
        }
    </style>
</head>
<body>
   <center> <form id="form1" runat="server">
        <div id="header">
                       
          REGISTER <i class="fa fa-user-plus" aria-hidden="true"></i>
        </div> 
          <center> <table class="auto-style1">
               <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                   <td class="auto-style2">
                        <asp:TextBox  class="form-control"  ID="fullnametxt" runat="server" placeholder="Enter Full Name"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td class="auto-style2">
                        <asp:TextBox  class="form-control"  ID="emailidtxt" runat="server" placeholder="Enter Email Id"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td class="auto-style2">
                        <asp:TextBox  class="form-control"  ID="passwordtxt" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td>
                        <asp:TextBox class="form-control" ID="dobtxt" runat="server" TextMode="Date" placeholder="Enter DOB"></asp:TextBox>
                     </td>
                </tr>
                 <tr>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td>
                        <asp:TextBox class="form-control" ID="phonenotxt" runat="server" TextMode="Phone" placeholder="Enter Phone No"></asp:TextBox>
                     </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td>
                        <asp:TextBox class="form-control" ID="addresstxt" runat="server" TextMode="MultiLine" placeholder="Enter Address"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td>
                        <asp:RadioButtonList  ID="gendertxt" runat="server" RepeatDirection="Horizontal" Width="200px">
                            <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td>

                        <br />
                        <asp:Label class="text-danger" ID="wrong_ans" runat="server"></asp:Label>
                        <br />
                        <asp:Label class="text-success" ID="right_ans" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Button class="btn btn-primary" ID="confirm_register" runat="server" OnClick="register_clicked" Text="Submit" Width="103px" />
                        <asp:Button class="btn btn-primary" ID="login_link" runat="server" Text="Back" Width="97px" OnClick="login_link_Click" />

                      

                    </td>
                </tr>
            </table></center>
    </form></center>
</body>
</html>