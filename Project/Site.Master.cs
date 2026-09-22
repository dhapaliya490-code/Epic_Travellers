using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Epic_Travelers
{
    public partial class SiteMaster : MasterPage
    {
        public bool IsLoggedIn { get; set; } = false;
        public string CurrentUserName { get; set; } = "";
        public string CurrentUserEmail { get; set; } = "";
        public string CurrentUserRole { get; set; } = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            ResolveUserSession();
        }

        private void ResolveUserSession()
        {
            // 1. Check if Admin session is active
            if (Session["isAdmin"] != null || (Session["userRole"] != null && Session["userRole"].ToString() == "admin"))
            {
                IsLoggedIn = true;
                CurrentUserRole = "admin";
                CurrentUserName = "Admin";
                CurrentUserEmail = "epictravelers365@gmail.com";
                Session["userRole"] = "admin";
                Session["userName"] = "Admin";
                Session["userEmail"] = "epictravelers365@gmail.com";
                return;
            }

            // 2. Check if Session["admin"] is set (this is the key login.aspx.cs sets for user logins)
            if (Session["admin"] != null)
            {
                string email = Session["admin"].ToString().Trim();

                if (string.Equals(email, "epictravelers365@gmail.com", StringComparison.OrdinalIgnoreCase))
                {
                    IsLoggedIn = true;
                    CurrentUserRole = "admin";
                    CurrentUserName = "Admin";
                    CurrentUserEmail = "epictravelers365@gmail.com";
                    Session["userRole"] = "admin";
                    Session["userName"] = "Admin";
                    Session["userEmail"] = "epictravelers365@gmail.com";
                    return;
                }

                // Regular logged in user
                IsLoggedIn = true;
                CurrentUserRole = "user";
                CurrentUserEmail = email;

                if (Session["userName"] != null && !string.IsNullOrWhiteSpace(Session["userName"].ToString()))
                {
                    CurrentUserName = Session["userName"].ToString();
                }
                else
                {
                    CurrentUserName = FetchFullNameFromDb(email);
                    Session["userName"] = CurrentUserName;
                    Session["userRole"] = "user";
                    Session["userEmail"] = email;
                }
                return;
            }

            // 3. Check auth cookie fallback
            HttpCookie authCookie = Request.Cookies["epic_auth"];
            if (authCookie != null && !string.IsNullOrEmpty(authCookie["role"]))
            {
                string role = authCookie["role"];
                string name = authCookie["name"] ?? "";
                string email = authCookie["email"] ?? "";

                if (role == "admin")
                {
                    IsLoggedIn = true;
                    CurrentUserRole = "admin";
                    CurrentUserName = !string.IsNullOrEmpty(name) ? name : "Admin";
                    CurrentUserEmail = !string.IsNullOrEmpty(email) ? email : "epictravelers365@gmail.com";
                    Session["isAdmin"] = CurrentUserEmail;
                    Session["userRole"] = "admin";
                    Session["userName"] = CurrentUserName;
                    Session["userEmail"] = CurrentUserEmail;
                }
                else if (role == "user" && !string.IsNullOrEmpty(email))
                {
                    IsLoggedIn = true;
                    CurrentUserRole = "user";
                    CurrentUserEmail = email;
                    CurrentUserName = !string.IsNullOrEmpty(name) ? name : FetchFullNameFromDb(email);
                    Session["admin"] = email;
                    Session["userRole"] = "user";
                    Session["userName"] = CurrentUserName;
                    Session["userEmail"] = email;
                }
            }
        }

        private string FetchFullNameFromDb(string email)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["dbcon"]?.ConnectionString;
                if (!string.IsNullOrEmpty(connStr))
                {
                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("SELECT [Full Name] FROM user_tbl WHERE Email = @email", con))
                        {
                            cmd.Parameters.AddWithValue("@email", email);
                            object result = cmd.ExecuteScalar();
                            if (result != null && result != DBNull.Value && !string.IsNullOrWhiteSpace(result.ToString()))
                            {
                                return result.ToString().Trim();
                            }
                        }
                    }
                }
            }
            catch
            {
                // Fallback gracefully to email prefix
            }

            if (!string.IsNullOrEmpty(email) && email.Contains("@"))
            {
                return email.Split('@')[0];
            }
            return email ?? "Explorer";
        }
    }
}
