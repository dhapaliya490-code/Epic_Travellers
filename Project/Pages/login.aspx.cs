using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epic_Travelers.Pages
{
    public partial class login : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int i;

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
            if (!(string.IsNullOrEmpty(txtLoginEmail.Text)) && !(string.IsNullOrEmpty(txtLoginPass.Text)))
            {
                getcon();
                cmd = new SqlCommand("select count(*) from user_tbl where Email = '" + txtLoginEmail.Text + "' and Password = '" + txtLoginPass.Text + "'", con);

                i = Convert.ToInt16(cmd.ExecuteScalar());

                if (i > 0)
                {
                    if (txtLoginEmail.Text == "epictravelers365@gmail.com" && txtLoginPass.Text == "admin@123")
                    {
                        Response.Redirect("~/Pages/admin.aspx");
                    }
                    else
                    {
                        Session["admin"] = txtLoginEmail.Text;
                        Response.Redirect("~/Pages/dashboard.aspx");
                    }
                }
                else
                {
                    Response.Write("Invalid Email or Password");
                }
            }
        }


    }
}
