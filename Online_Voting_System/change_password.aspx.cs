using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Voting_System
{
    public partial class change_password : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Linux\OneDrive\Documents\Online_Voting_System\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void change_pass_Click(object sender, EventArgs e)
        {
           
            string query_select = "UPDATE [VOTERS] SET [Password] =@password WHERE [Email] = @Email";
            try
            {
                using(con)
                {
                    using(SqlCommand cmd1 = new SqlCommand(query_select))
                    {   
                        cmd1.Parameters.AddWithValue("@Email",enter_email.Text);
                        cmd1.Parameters.AddWithValue("@password", new_password.Text);
                        cmd1.Connection = con;
                        con.Open();
                        cmd1.ExecuteNonQuery();
                        con.Close();
                        Label1.Text = "password changed";
                    }
                }

            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}