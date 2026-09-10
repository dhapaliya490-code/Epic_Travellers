using System;
using System.Web;
using System.Web.Routing;

namespace Epic_Travelers
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        private void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("RootRoute", "", "~/Pages/index.aspx");
            routes.MapPageRoute("IndexHtmlRoute", "Pages/index.html", "~/Pages/index.aspx");
            routes.MapPageRoute("404HtmlRoute", "Pages/404.html", "~/Pages/404.aspx");
            routes.MapPageRoute("AboutHtmlRoute", "Pages/about.html", "~/Pages/about.aspx");
            routes.MapPageRoute("AdminHtmlRoute", "Pages/admin.html", "~/Pages/admin.aspx");
            routes.MapPageRoute("AuthHtmlRoute", "Pages/auth.html", "~/Pages/auth.aspx");
            routes.MapPageRoute("BlogHtmlRoute", "Pages/blog.html", "~/Pages/blog.aspx");
            routes.MapPageRoute("ContactHtmlRoute", "Pages/contact.html", "~/Pages/contact.aspx");
            routes.MapPageRoute("DashboardHtmlRoute", "Pages/dashboard.html", "~/Pages/dashboard.aspx");
            routes.MapPageRoute("DestinationsHtmlRoute", "Pages/destinations.html", "~/Pages/destinations.aspx");
            routes.MapPageRoute("GalleryHtmlRoute", "Pages/gallery.html", "~/Pages/gallery.aspx");
            routes.MapPageRoute("LoginHtmlRoute", "Pages/login.html", "~/Pages/login.aspx");
            routes.MapPageRoute("PackageDetailsHtmlRoute", "Pages/package-details.html", "~/Pages/package-details.aspx");
            routes.MapPageRoute("PackagesHtmlRoute", "Pages/packages.html", "~/Pages/packages.aspx");
            routes.MapPageRoute("RegisterHtmlRoute", "Pages/register.html", "~/Pages/register.aspx");
            routes.MapPageRoute("SitemapHtmlRoute", "Pages/sitemap.html", "~/Pages/sitemap.aspx");
        }

        protected void Session_Start(object sender, EventArgs e) { }

        protected void Application_BeginRequest(object sender, EventArgs e) { }

        protected void Application_AuthenticateRequest(object sender, EventArgs e) { }

        protected void Application_Error(object sender, EventArgs e) { }

        protected void Session_End(object sender, EventArgs e) { }

        protected void Application_End(object sender, EventArgs e) { }
    }
}
