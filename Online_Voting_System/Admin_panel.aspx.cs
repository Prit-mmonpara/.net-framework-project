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
    public partial class Admin_panel : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Linux\OneDrive\Documents\Online_Voting_System\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");
        // SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Ruchit\Documents\GitHub\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                Int32 totalmale = 0;
                Int32 totalfemale = 0;
                Int32 totalcandidate = 0;
                string Totalmale = "SELECT COUNT(*) FROM VOTERS WHERE Gender = @Gender";
                string TotalFemale = "SELECT COUNT(*) FROM VOTERS WHERE Gender = @Gender";
                string Totalcandidate = "SELECT COUNT(*) FROM CANDIDATES WHERE Gender = @Gender";
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(Totalmale))
                    {
                        cmd.Parameters.AddWithValue("Gender", "M");
                        cmd.Connection = con;
                        con.Open();
                        totalmale = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                        male.Text = totalmale.ToString();
                    }

                    using (SqlCommand cmd1 = new SqlCommand(TotalFemale))
                    {
                        cmd1.Parameters.AddWithValue("Gender", "F");
                        cmd1.Connection = con;
                        con.Open();
                        totalfemale = Convert.ToInt32(cmd1.ExecuteScalar());
                        con.Close();
                        female.Text = totalfemale.ToString();
                    }

                    using (SqlCommand cmd2 = new SqlCommand(Totalcandidate))
                    {
                        cmd2.Parameters.AddWithValue("Gender", "M");
                       
                        cmd2.Connection = con;
                        con.Open();
                        totalcandidate = Convert.ToInt32(cmd2.ExecuteScalar());
                        con.Close();
                        candidate.Text = totalcandidate.ToString();
                    }
                }
            }

            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

       

        protected void Approved_user_Click(object sender, EventArgs e)
        {
             Response.Redirect("Approved_user.aspx");
        }

        protected void add_candidate_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_candidate.aspx");
        }

        protected void add_result_Click(object sender, EventArgs e)
        {
            Response.Redirect("generate_result.aspx");
        }

        protected void logout_click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}