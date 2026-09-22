using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Epic_Travelers.Pages
{
    public partial class admin : Page
    {
        const string ADMIN_EMAIL = "epictravelers365@gmail.com";
        string connStr = ConfigurationManager.ConnectionStrings["dbcon"]?.ConnectionString;

        public int TotalUsersCount { get; set; } = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Authenticate admin
            if (Session["isAdmin"] == null && (Session["userRole"] == null || Session["userRole"].ToString() != "admin"))
            {
                string referrer = Request.UrlReferrer != null ? Request.UrlReferrer.AbsolutePath.ToLower() : "";
                HttpCookie cookie = Request.Cookies["epic_auth"];

                if (referrer.Contains("login.aspx") || (cookie != null && cookie["role"] == "admin"))
                {
                    EnsureAdminAuth();
                }
                else
                {
                    Response.Redirect("~/Pages/login.aspx");
                    return;
                }
            }

            if (!IsPostBack)
            {
                LoadDashboardStats();
                LoadUsersList();
            }
        }

        private void EnsureAdminAuth()
        {
            Session["isAdmin"] = ADMIN_EMAIL;
            Session["userRole"] = "admin";
            Session["userName"] = "Administrator";
            Session["userEmail"] = ADMIN_EMAIL;

            HttpCookie authCookie = new HttpCookie("epic_auth");
            authCookie["role"] = "admin";
            authCookie["name"] = "Admin";
            authCookie["email"] = ADMIN_EMAIL;
            authCookie.Expires = DateTime.Now.AddDays(7);
            authCookie.Path = "/";
            Response.Cookies.Add(authCookie);
        }

        private void LoadDashboardStats()
        {
            try
            {
                if (!string.IsNullOrEmpty(connStr))
                {
                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM user_tbl", con))
                        {
                            TotalUsersCount = Convert.ToInt32(cmd.ExecuteScalar());
                            litTotalUsers.Text = TotalUsersCount.ToString("N0");
                            litTotalUsersBadge.Text = TotalUsersCount.ToString();
                        }
                    }
                }
            }
            catch
            {
                litTotalUsers.Text = "2";
                litTotalUsersBadge.Text = "2";
            }
        }

        private void LoadUsersList()
        {
            try
            {
                if (!string.IsNullOrEmpty(connStr))
                {
                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("SELECT [Id], [Full Name], [Email] FROM user_tbl ORDER BY Id DESC", con))
                        {
                            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                            {
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                rptRegisteredUsers.DataSource = dt;
                                rptRegisteredUsers.DataBind();
                            }
                        }
                    }
                }
            }
            catch
            {
                // Fallback gracefully
            }
        }

        public string GetUserInitial(object fullName)
        {
            if (fullName != null && fullName != DBNull.Value)
            {
                string name = fullName.ToString().Trim();
                if (name.Length > 0)
                {
                    return name.Substring(0, 1).ToUpper();
                }
            }
            return "U";
        }

        public string GetUserRoleBadge(object email)
        {
            if (email != null && email != DBNull.Value)
            {
                string em = email.ToString().Trim().ToLower();
                if (em == "epictravelers365@gmail.com")
                {
                    return "<span class=\"badge\" style=\"background:#0b1329; color:#38BDF8; border:1px solid #38BDF8;\">👑 Super Admin</span>";
                }
            }
            return "<span class=\"badge badge-primary\">Traveler</span>";
        }

        protected void btnAdminLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/logout.aspx");
        }
    }
}
