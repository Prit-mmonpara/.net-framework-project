
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
    
    public partial class select_candidate : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Linux\OneDrive\Documents\Online_Voting_System\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Page.IsPostBack == false)
            {
               // Response.Write(Session["HasCasted"]);
            }

            print_email.Text = "Hey, " + Session["voter_name"];
           
        }

        protected void vote_Click(object sender, EventArgs e)
        {
            Int32 Isvoted;
            Int32 Iscandidate;
            string candidate_details = "SELECT * FROM CANDIDATES WHERE [FullName] =@FullName AND [PartyName] = @PartyName";
            string is_candidate = "SELECT COUNT(*) FROM CANDIDATES WHERE [FullName] = @FullName AND [PartyName] = @PartyName";
            string candidate_voted = "UPDATE [CANDIDATES] SET [Votes] = @Votes WHERE [FullName] = @FullName AND [PartyName] = @PartyName AND [Candidate_Id] = @Candidate_Id";
            string update_voter_status = "UPDATE [VOTERS] SET [HasCasted] = @HasCasted WHERE [VoterId] = @VoterId";
            string check_voter = "SELECT COUNT(*) FROM VOTERS WHERE [HasCasted] = @Hascasted AND [VoterId] = @VoterId";
            DataTable dt = new DataTable();
            //DataTable dt1 = new DataTable();
            try
            {
                using(con)
                {
                    using(SqlCommand cmd4 = new SqlCommand(check_voter))
                    {
                        cmd4.Parameters.AddWithValue("@HasCasted",0);
                        cmd4.Parameters.AddWithValue("@VoterId", Session["voter_id"]);
                        cmd4.Connection = con;
                        con.Open();
                       
                        Isvoted = Convert.ToInt32(cmd4.ExecuteScalar());
                        con.Close();


                    }

                    using(SqlCommand cmd5 = new SqlCommand(is_candidate))
                    {
                        cmd5.Parameters.AddWithValue("@FullName",candidatename_txt.Text);
                        cmd5.Parameters.AddWithValue("@PartyName", partyname_txt.Text);
                        cmd5.Connection = con;
                        con.Open();
                        Iscandidate = Convert.ToInt32(cmd5.ExecuteScalar());
                        con.Close();

                    }    

                    using (SqlCommand cmd = new SqlCommand(candidate_details))
                    {
                        cmd.Parameters.AddWithValue("@Fullname", candidatename_txt.Text);
                        cmd.Parameters.AddWithValue("@PartyName", partyname_txt.Text);
                        cmd.Connection = con;
                        con.Open();
                        SqlDataAdapter sad = new SqlDataAdapter(cmd);
                        sad.Fill(dt);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Session["Candidate_Id"] = dt.Rows[0][0];
                            Session["Votes"] = dt.Rows[0][4];
                           

                        }
                        dr.Close();
                        
                        con.Close();

                    }

                    if (Isvoted == 1)
                    {
                        if (Iscandidate == 1)
                        {


                            using (SqlCommand cmd1 = new SqlCommand(candidate_voted))
                            {

                                cmd1.Parameters.AddWithValue("@Fullname", candidatename_txt.Text);
                                cmd1.Parameters.AddWithValue("@PartyName", partyname_txt.Text);
                                cmd1.Parameters.AddWithValue("@Candidate_Id", Session["Candidate_Id"]);
                                cmd1.Parameters.AddWithValue("@Votes", ((int)Session["Votes"] + 1));
                                cmd1.Connection = con;
                                con.Open();
                                cmd1.ExecuteNonQuery();
                                con.Close();
                                vote_success.Text = "vote added to Candidate";
                                //SqlDataAdapter sda = new SqlDataAdapter(cmd);


                            }
                        }

                        else
                        {
                           wrong_txt.Text =  "Incorrect Candidate Name Or Candidate Partyname";
                        }
                    }

                    else
                    {
                       wrong_txt.Text =  "Already Voted";
                    }

                    if(Iscandidate == 1)
                    {

                        using (SqlCommand cmd2 = new SqlCommand(update_voter_status))
                        {
                            cmd2.Parameters.AddWithValue("@HasCasted", 1);
                            cmd2.Parameters.AddWithValue("@VoterId", Session["voter_id"]);
                            cmd2.Connection = con;
                            con.Open();
                            cmd2.ExecuteNonQuery();
                            con.Close();

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
            Response.Redirect("check_voter.aspx");
        }

        protected void logout_button_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }
    }
}
