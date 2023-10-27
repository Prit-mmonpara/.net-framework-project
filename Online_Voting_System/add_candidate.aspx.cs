using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Voting_System
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Linux\OneDrive\Documents\Online_Voting_System\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");
        // SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Ruchit\Documents\GitHub\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void candidate_added_Click(object sender, EventArgs e)
        {
            string add_candidate = "INSERT INTO CANDIDATES(FullName,PartyName,Gender) VALUES(@fullname,@partyname,@gender)";
            using(con)
            {
                using(SqlCommand cmd = new SqlCommand(add_candidate))
                {
                    cmd.Parameters.AddWithValue("@fullname",Candidatename_txt.Text);
                    cmd.Parameters.AddWithValue("@partyname",party_txt.Text);
                    cmd.Parameters.AddWithValue("@gender", gendertxt.Text);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("Admin_panel.aspx");
                }
            }
        }

        protected void back_button_click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_panel.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }
    }
}