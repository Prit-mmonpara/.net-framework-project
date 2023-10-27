using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Voting_System
{
    public partial class forgot_password : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Linux\OneDrive\Documents\Online_Voting_System\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");

       public string Otp;
       
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void send_Click(object sender, EventArgs e)
        {
            Int32 count;
            string query_select = "SELECT COUNT (*) FROM VOTERS WHERE Email = @email ";
            try
            {
                using(con)
                {
                    using(SqlCommand cmd1 = new SqlCommand(query_select))
                    {
                        cmd1.Parameters.AddWithValue("@email", enter_email.Text);
                        cmd1.Connection = con;
                        con.Open();
                        count = Convert.ToInt32(cmd1.ExecuteScalar());
                        con.Close();

                        if(count == 0)
                        {
                            Label2.Text = "Wrong email id";
                        }

                        else
                        {
                            Random r = new Random();
                            Otp = r.Next(100000, 999999).ToString();
                            Label4.Text = Otp;
                            using (MailMessage mail = new MailMessage())
                            {
                                mail.From = new MailAddress("20ceutg136@ddu.ac.in");
                                mail.To.Add(enter_email.Text);          
                                mail.Subject = "Your One Time Password(OTP)";
                                mail.Body = "<h3>One Time Password(OTP) for your Login on our site:- "+ Otp;
                                mail.IsBodyHtml = true;

                                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                                {
                                    smtp.UseDefaultCredentials = true;
                                    smtp.Credentials = new System.Net.NetworkCredential("20ceutg136@ddu.ac.in", "rgizgfmeztmrcyux");
                                    smtp.EnableSsl = true;
                                    smtp.Send(mail);
                                }
                            }

                            Label2.Text = "we have mail you a 6 digit code ,please enter here for verification";
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected void verify_otp_Click(object sender, EventArgs e)
        {
            
            string entered = enter_otp.Text;
            string otp = Label4.Text;
            bool b = entered.Equals(otp);
            Label3.Text = "here"+entered;
            Label4.Text = "there"+Otp;
            if(b)
            {
                Response.Redirect("change_password.aspx");
            }

            else
            {
                Label1.Text = "The code you enter is incorrect";
            }
        }
    }
}