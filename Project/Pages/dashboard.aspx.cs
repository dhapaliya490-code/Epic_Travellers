using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Epic_Travelers.Pages
{
    public partial class dashboard : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbcon"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string email = null;

            if (Session["admin"] != null)
            {
                email = Session["admin"].ToString();
            }
            else if (Session["userEmail"] != null)
            {
                email = Session["userEmail"].ToString();
            }
            else
            {
                HttpCookie authCookie = Request.Cookies["epic_auth"];
                if (authCookie != null && authCookie["role"] == "user" && !string.IsNullOrEmpty(authCookie["email"]))
                {
                    email = authCookie["email"];
                    Session["admin"] = email;
                }
            }

            // If not logged in, redirect to login
            if (string.IsNullOrEmpty(email))
            {
                Response.Redirect("~/Pages/login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserDetails(email);
            }
        }

        void LoadUserDetails(string email)
        {
            string fullName = email;
            try
            {
                if (!string.IsNullOrEmpty(connStr))
                {
                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("SELECT [Full Name], Email FROM user_tbl WHERE Email = @email", con))
                        {
                            cmd.Parameters.AddWithValue("@email", email);
                            using (SqlDataReader dr = cmd.ExecuteReader())
                            {
                                if (dr.Read())
                                {
                                    fullName = dr["Full Name"] != DBNull.Value ? dr["Full Name"].ToString().Trim() : email;
                                    email = dr["Email"] != DBNull.Value ? dr["Email"].ToString().Trim() : email;
                                }
                            }
                        }
                    }
                }
            }
            catch
            {
                // Fallback gracefully
            }

            litUserName.Text     = fullName;
            litUserEmail.Text    = email;
            litProfileName.Text  = fullName;
            litProfileEmail.Text = email;

            Session["userRole"]  = "user";
            Session["userName"]  = fullName;
            Session["userEmail"] = email;

            HttpCookie authCookie = new HttpCookie("epic_auth");
            authCookie["role"] = "user";
            authCookie["name"] = fullName;
            authCookie["email"] = email;
            authCookie.Expires = DateTime.Now.AddDays(7);
            authCookie.Path = "/";
            Response.Cookies.Add(authCookie);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/logout.aspx");
        }
    }
}
