using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Epic_Travelers.Pages
{
    public partial class register : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
        }

        void fillgird()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM user_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }

        void filldata()
        {
            getcon();
            da = new SqlDataAdapter("select * from user_tbl where Id=" + ViewState["id"],con);
            ds = new DataSet();
            da.Fill(ds);

            txtFullName.Text = ds.Tables[0].Rows[0]["Full Name"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            txtPassword.Text = ds.Tables[0].Rows[0]["Password"].ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fillgird();
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            if (btnCreateAccount.Text == "Create Account 🎉")
            {
                getcon();
                cmd = new SqlCommand("INSERT INTO user_tbl ([Full Name], Email, Password) " +
                                     "VALUES('" + txtFullName.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                clear();
                fillgird();

                Response.Redirect("register.aspx");
            }
            else
            {
                getcon();
                cmd = new SqlCommand("UPDATE user_tbl SET [Full Name]='" + txtFullName.Text + "', Email='" + txtEmail.Text + "', Password='" + txtPassword.Text + "' WHERE Id=" + ViewState["id"], con);
                cmd.ExecuteNonQuery();
                fillgird();
                clear();
                btnCreateAccount.Text = "Create Account 🎉";
            }
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if(e.CommandName =="cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                btnCreateAccount.Text = "Update Account ✏️";
                filldata();
            }
            else
            {
                
            }
        }
    }
}