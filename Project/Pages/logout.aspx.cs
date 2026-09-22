using System;
using System.Web;
using System.Web.UI;

namespace Epic_Travelers.Pages
{
    public partial class logout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear all session state
            Session.Clear();
            Session.Abandon();

            // Expire authentication cookie
            if (Request.Cookies["epic_auth"] != null)
            {
                HttpCookie authCookie = new HttpCookie("epic_auth", "");
                authCookie.Expires = DateTime.Now.AddYears(-1);
                authCookie.Path = "/";
                Response.Cookies.Add(authCookie);
            }

            // Also expire any other session cookies
            HttpCookie sessionCookie = new HttpCookie("ASP.NET_SessionId", "");
            sessionCookie.Expires = DateTime.Now.AddYears(-1);
            sessionCookie.Path = "/";
            Response.Cookies.Add(sessionCookie);

            // Prevent caching of this response
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
    }
}
