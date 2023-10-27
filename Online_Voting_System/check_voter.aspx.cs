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
    
    public partial class check_voter : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Linux\OneDrive\Documents\Online_Voting_System\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");

       // string voter = Session["voter_id"].ToString();
        //string password = Session["Password"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Session["voter_id"]);
            //Response.Write(Session["Password"]);
            //Response.Write(voter);
            print_email.Text = "Hey, " + Session["voter_name"];
        }

        protected void verify_voter_Click(object sender, EventArgs e)
        {
            Int32 is_voter_exist;
            string check_voter = "SELECT COUNT(*) FROM VOTERS WHERE VoterId =@VoterId AND Password = @Password";
            try
            {

                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(check_voter))
                    {
                        cmd.Parameters.AddWithValue("@VoterId", voterid_txt.Text);
                        cmd.Parameters.AddWithValue("@Password", password_txt.Text);
                        cmd.Connection = con;
                        con.Open();
                        is_voter_exist = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                        if(is_voter_exist == 1)
                        {
                            if (Session["voter_id"].ToString() == voterid_txt.Text)
                            {
                                Response.Write("voter Exists");
                                Response.Redirect("select_candidate.aspx");
                            }

                            else
                            {
                               wrong_txt.Text =  "Incorrect voterId or Password";
                            }
                           // Response.Write(Session["voter_id"]);
                           // Response.Write(Session["Password"]);
                        }
                             
                              
                        else
                        {
                           wrong_txt.Text =  "Incorrect VoterId or Password";
                        }
                        
                    }
                       
                }
                     
            }
                        



            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void back_click(object sender, EventArgs e)
        {
            Response.Redirect("voter_home.aspx");
        }
    }
}