
using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace Online_Voting_System
{
    public partial class Approved_user : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\Documents\GitHub\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");

        SqlConnection con = new SqlConnection((@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Linux\OneDrive\Documents\Online_Voting_System\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");
        // SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\admin\Documents\GitHub\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }

        protected void addvoters_Click(object sender, EventArgs e)
        {
            // SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //  String approved_voter = "SELECT * FROM PENDING_VOTERS WHERE IsApproved = @IsApproved";
        
            string approved_voter = "INSERT INTO VOTERS(Email,Password,DOB,FullName,PhoneNo,Address,Gender) SELECT Email,Password,DOB,FullName,PhoneNo,Address,Gender FROM PENDING_VOTERS WHERE IsApproved = @IsApproved";
            string delete_pending_voter = "DELETE FROM PENDING_VOTERS WHERE IsApproved = @IsApproved";

            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(approved_voter))
                    {
                        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                        foreach (DataRow row in dv.Table.Rows)
                        {
                            string email = row[0].ToString();
                            int val = Convert.ToInt32(row[7]);
                            string name = row[3].ToString();
                            Label1.Text = email;
                            Label2.Text = val.ToString();
                            if (val == 1)
                            {
                                using (MailMessage mail = new MailMessage())
                                {
                                    mail.From = new MailAddress("20ceutg136@ddu.ac.in");
                                    mail.To.Add(email);
                                    mail.Subject = "Congratulation, " + name;
                                    mail.Body = "<h3>your account has been approved by the admin.Now you can vote.</h3>";
                                    mail.IsBodyHtml = true;

                                    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                                    {
                                        smtp.UseDefaultCredentials = true;
                                        smtp.Credentials = new System.Net.NetworkCredential("20ceutg136@ddu.ac.in", "rgizgfmeztmrcyux");
                                        smtp.EnableSsl = true;
                                        smtp.Send(mail);
                                    }
                                }
                            }
                        }
                        cmd.Parameters.AddWithValue("IsApproved", 1);

                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                     
                    using (SqlCommand cmd1 = new SqlCommand(delete_pending_voter))
                    {
                        cmd1.Parameters.AddWithValue("IsApproved", 1);
                        cmd1.Connection = con;
                        con.Open();
                        cmd1.ExecuteNonQuery();
                        con.Close();

                    }
                }
            }
            
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
       

        protected void back_click(object sender, EventArgs e)
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
