using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Epic_Travelers.MasterPages
{
    public partial class Main : MasterPage
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
            if (Session["isAdmin"] != null || (Session["userRole"] != null && Session["userRole"].ToString() == "admin"))
            {
                IsLoggedIn = true;
                CurrentUserRole = "admin";
                CurrentUserName = "Admin";
                CurrentUserEmail = "epictravelers365@gmail.com";
                return;
            }

            if (Session["admin"] != null)
            {
                string email = Session["admin"].ToString().Trim();
                if (string.Equals(email, "epictravelers365@gmail.com", StringComparison.OrdinalIgnoreCase))
                {
                    IsLoggedIn = true;
                    CurrentUserRole = "admin";
                    CurrentUserName = "Admin";
                    CurrentUserEmail = "epictravelers365@gmail.com";
                    return;
                }

                IsLoggedIn = true;
                CurrentUserRole = "user";
                CurrentUserEmail = email;
                CurrentUserName = Session["userName"] != null ? Session["userName"].ToString() : email.Split('@')[0];
                return;
            }

            HttpCookie authCookie = Request.Cookies["epic_auth"];
            if (authCookie != null && !string.IsNullOrEmpty(authCookie["role"]))
            {
                string role = authCookie["role"];
                if (role == "admin")
                {
                    IsLoggedIn = true;
                    CurrentUserRole = "admin";
                    CurrentUserName = "Admin";
                    CurrentUserEmail = "epictravelers365@gmail.com";
                }
                else if (role == "user" && !string.IsNullOrEmpty(authCookie["email"]))
                {
                    IsLoggedIn = true;
                    CurrentUserRole = "user";
                    CurrentUserEmail = authCookie["email"];
                    CurrentUserName = !string.IsNullOrEmpty(authCookie["name"]) ? authCookie["name"] : authCookie["email"].Split('@')[0];
                }
            }
        }
    }
}
