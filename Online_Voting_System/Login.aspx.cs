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
    public partial class Login : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection();

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Linux\OneDrive\Documents\Online_Voting_System\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Submitbtn_Click(object sender, EventArgs e)
        {
            Int32 admin_count;
            Int32 voter_count;
            string search_admin = "SELECT COUNT (*) FROM ADMIN WHERE Email = @email AND Password = @password";
            string search_voter = "SELECT COUNT(*) FROM VOTERS WHERE Email = @email AND Password = @password";
            string get_voter_id = "SELECT * FROM VOTERS WHERE Email = @email AND Password = @password";
            DataTable dt = new DataTable();
            
            try
            {
                using(con)
                {
                    using (SqlCommand cmd2 = new SqlCommand(get_voter_id))
                    {
                        cmd2.Parameters.AddWithValue("@email", emaild_txt.Text);
                        cmd2.Parameters.AddWithValue("@password", password_txt.Text);
                        cmd2.Connection = con;
                        con.Open();
                        SqlDataAdapter sad = new SqlDataAdapter(cmd2);
                        sad.Fill(dt);
                        SqlDataReader dr = cmd2.ExecuteReader();
                        if (dr.Read())
                        {  
                            
                            Session["voter_id"] = dt.Rows[0][0];
                            Session["Email"] = dt.Rows[0][1];
                            Session["Password"] = dt.Rows[0][2];
                            Session["DOB"] = dt.Rows[0][3];
                            Session["voter_name"] = dt.Rows[0][4];
                            Session["Phoneno"] = dt.Rows[0][5];
                            Session["Address"] = dt.Rows[0][6];
                            Session["HasCasted"] = dt.Rows[0][8];

                        }
                        dr.Close();
                        voter_count = Convert.ToInt32(cmd2.ExecuteScalar());
                        con.Close();
                        
                    }



                    using (SqlCommand cmd1 = new SqlCommand(search_voter))
                    {
                        cmd1.Parameters.AddWithValue("@email", emaild_txt.Text);
                        cmd1.Parameters.AddWithValue("@password", password_txt.Text);
                        cmd1.Connection = con;
                        con.Open();
                        SqlDataAdapter sad = new SqlDataAdapter(cmd1);
                        sad.Fill(dt);
                        SqlDataReader dr = cmd1.ExecuteReader();
                        if (dr.Read())
                        {
                         //   Session["voter_email"] = emaild_txt.Text;
                           // Session["voter_id"] = dt.Rows[0][0];

                        }
                        dr.Close();
                        voter_count = Convert.ToInt32(cmd1.ExecuteScalar());
                        con.Close();
                        if (voter_count == 1)
                        {
                            //Response.Redirect("Admin_panel.aspx");
                            Response.Redirect("voter_home.aspx");
                        }
                        else
                        {
                            wrong_ans.Text = "Wrong Emailid and Password";
                        }
                    }

                    using (SqlCommand cmd = new SqlCommand(search_admin))
                    {
                        //Response.Write("Admin exists");
                        cmd.Parameters.AddWithValue("@email", emaild_txt.Text);
                        cmd.Parameters.AddWithValue("@password", password_txt.Text);
                        cmd.Connection = con;
                        con.Open();
                        

                        admin_count = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                        if (admin_count == 1)
                        {
                            Response.Redirect("Admin_panel.aspx");
                        }
                        else if(voter_count == 0)
                        {
                            wrong_ans.Text = "Wrong Emailid and Password";
                        }

                        // Response.Write(email);
                        //Response.Write(password);
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

       
    }
}

       