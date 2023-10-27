
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
    public partial class Edit_Voter_Profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Linux\OneDrive\Documents\Online_Voting_System\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                emailid_txt.Text = Session["Email"].ToString();
                password_txt.Text = Session["Password"].ToString();
                dob_txt.Text = Session["DOB"].ToString();
                phoneno_txt.Text = Session["Phoneno"].ToString();
                address_txt.Text = Session["Address"].ToString();
                Name_txt.Text = Session["voter_name"].ToString();
                //   Response.Write(Session["voter_id"]);
                print_email.Text = "Hey, " + Session["voter_name"].ToString(); 
            }
            

        }

       

        protected void update_btn_Click(object sender, EventArgs e)
        {
            string update_profile = "UPDATE [VOTERS] SET [Email] = @Email, [Password] =@Password, [FullName] = @FullName, [PhoneNo] = @PhoneNo, [Address] = @Address WHERE [VoterId] = @VoterId"; 
            try
            {
                using(con)
                {
                    using(SqlCommand cmd = new SqlCommand(update_profile))
                    {
                        cmd.Parameters.AddWithValue("@Email", emailid_txt.Text);
                        cmd.Parameters.AddWithValue("@Password", password_txt.Text);
                        cmd.Parameters.AddWithValue("@FullName", Name_txt.Text);
                        cmd.Parameters.AddWithValue("@PhoneNo", phoneno_txt.Text);
                        cmd.Parameters.AddWithValue("@Address", address_txt.Text);
                        cmd.Parameters.AddWithValue("@VoterId", Session["voter_id"]);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                      //  Response.Write(phoneno_txt.Text);

                        Successful_msg.Text = "Updated Successfully !!";
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }


        }

        protected void back_home_Click(object sender, EventArgs e)
        {
            Response.Redirect("voter_home.aspx");
        }

        protected void logout_button_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }
    }
}
