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
    public partial class voter_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* print_email.Text = (string)Session["voter_email"];
              Response.Write(Session["voter_id"]);

              Response.Write(Session["Email"]);
              Response.Write(Session["Password"]);
              Response.Write(Session["DOB"]);
              Response.Write(Session["Phoneno"]);
              Response.Write(Session["Address"]);
            */
            
            print_email.Text = "Hey, "+Session["voter_name"].ToString();
        }

        protected void Edit_Profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit_Voter_Profile.aspx");
        }

        protected void logout_button_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        protected void assigned_vote_Click(object sender, EventArgs e)
        {
            Response.Redirect("check_voter.aspx");
        }
    }
}