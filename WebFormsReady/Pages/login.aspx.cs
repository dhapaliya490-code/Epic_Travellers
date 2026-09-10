using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Epic_Travelers.Pages
{
    public partial class login : Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e) 
        {
            
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("SELECT COUNT(*) FROM user_tbl WHERE Email=@Email AND Password=@Password", con);
            cmd.Parameters.AddWithValue("@Email", txtLoginEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtLoginPass.Text);

            int count = (int)cmd.ExecuteScalar();
            con.Close();

            if (count == 1)
            {
                Session["user"] = txtLoginEmail.Text;
                Response.Redirect("index.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid email or password!";
            }
        }

        private void FireToast(string message, string type = "info")
        {
            
        }
    }
}
