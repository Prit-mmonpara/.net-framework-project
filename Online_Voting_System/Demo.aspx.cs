
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Voting_System
{
    public partial class Demo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Linux\OneDrive\Documents\Online_Voting_System\Online_Voting_System\Online_Voting_System\Online_Voting_System\App_Data\OnlineVotingSystem.mdf;Integrated Security=True");
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            using(con)
            {
                string command = "SELECT * FROM VOTERS";
                SqlCommand cmd = new SqlCommand(command);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                cmd.Connection = con;
               
                da.Fill(ds, "VOTERS");
                con.Close();
            }
        }
    }
}
