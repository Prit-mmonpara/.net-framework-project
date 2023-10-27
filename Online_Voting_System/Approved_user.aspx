﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Approved_user.aspx.cs" Inherits="Online_Voting_System.Approved_user" %>

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

            margin-top:130px;
          
        }

        .header{
            font-size:28px;
            color :  white;
            margin-right: 400px;
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
           margin-right:290px;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <nav class="navbar navbar-dark bg-dark">
             
                    <div class="header">Admin Panel</div></>
                
                    

                    <asp:Button class="btn btn-primary" ID="approved_user" runat="server"  Text="Approve User" />

                    <asp:Button class="btn btn-primary" ID="add_candidate" runat="server"  Text="Add Candidate" />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                   <asp:Button class="btn btn-danger" ID="logout" runat="server"  Text ="Logout" OnClick="logout_Click" /> 
             </nav>
       
        <center>
            <table class="auto-style1">
            
            <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:GridView  class="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataSourceID="SqlDataSource2" AutoGenerateDeleteButton="True" CellPadding="1" DataKeyNames="Email">
                        <Columns>
                            
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                            <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                            <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:CheckBoxField DataField="IsApproved" HeaderText="IsApproved" SortExpression="IsApproved" />
                           
                        </Columns>
                    </asp:GridView></>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                        SelectCommand="SELECT * FROM [PENDING_VOTERS]"
                        DeleteCommand ="DELETE  FROM [PENDING_VOTERS] WHERE [Email] = @Email"
                        UpdateCommand="UPDATE [PENDING_VOTERS] SET [IsApproved] =@IsApproved WHERE [Email] = @Email">
                        <DeleteParameters>
                            <asp:Parameter Name="Email" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                    <asp:Button class ="btn btn-danger" ID="back" runat="server" OnClick ="back_click" Text="back" />
                   
                     <asp:Button class="btn btn-primary" ID="addvoters" runat="server" OnClick="addvoters_Click" Text="Confirm Approvement" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label1"  runat="server"></asp:Label>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
            </tr>
        </table></center>
       
        <div>
        </div>
    </form>
</body>
</html>