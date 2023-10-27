<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="select_candidate.aspx.cs" Inherits="Online_Voting_System.select_candidate" %>

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
        .auto-style4 {
           
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

           margin-top:5px;
           margin-bottom:5px;
       }

       .table table-striped
       {
         margin-top:30px;
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

                   

                    <asp:Button class="btn btn-danger" ID="logout_button" runat="server"   Text="Logout" />

                </td>
            </tr>
           
        </table>
        </nav>
        <div>
        <center>   <asp:GridView class="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="FullName" HeaderText="Candidate Name" SortExpression="FullName" />
                    <asp:BoundField DataField="PartyName" HeaderText="Party Name" SortExpression="PartyName" />
                </Columns>
            </asp:GridView></center>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT [FullName], [PartyName] FROM [CANDIDATES]"></asp:SqlDataSource>
           <center> <table class="auto-style1">
                <tr>
                    <td>
                        <asp:TextBox class="form-control" ID="candidatename_txt" runat="server" placeholder="Enter Candidate Name"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> <asp:TextBox class="form-control"  ID="partyname_txt" runat="server" placeholder="Enter Party Name"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>

                         <asp:Button class="btn btn-danger" ID="back_button" runat="server" OnClick="back_click" Text="Back" />
                        <asp:Button class="btn btn-primary" ID="vote" runat="server" OnClick="vote_Click" Text="Vote"  />
                         <br />
                         <br />
                         <asp:Label class="fw-bolder text-danger" ID="wrong_txt" runat="server"></asp:Label>
                         <br />
                         <asp:Label ID="vote_success" runat="server"></asp:Label>
                    </td>
                </tr>
            </table></center>
        </div>
    </form>
</body>
</html>
