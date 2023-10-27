<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="generate_result.aspx.cs" Inherits="Online_Voting_System.generate_result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    </head>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <style type="text/css">
        .auto-style1 {
           

        }

         .header{
            font-size:28px;
            color :  white;
            margin-right: 400px;
        }

        }
         .header{
            font-size:28px;
            color :  white;
            margin-right: 400px;
        }

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

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                   <asp:Button class="btn btn-danger" ID="logout" runat="server"  Text ="Logout" OnClick="logout_Click" /> 
             </nav>
       <center><table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView class="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                            <asp:BoundField DataField="PartyName" HeaderText="PartyName" SortExpression="PartyName" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:BoundField DataField="Votes" HeaderText="Votes" SortExpression="Votes" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnection %>" SelectCommand="SELECT [FullName], [PartyName], [Gender], [Votes] FROM [CANDIDATES] ORDER BY [Votes] DESC"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button class="btn btn-danger" ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" style="height: 31px" />
                </td>
            </tr>
        </table></center> 
        <div>
        </div>

    </form>
</body>
</html>
