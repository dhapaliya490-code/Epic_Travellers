<%@ Page Title="Sitemap – Epic-Travellers | All Pages & Navigation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sitemap.aspx.cs" Inherits="Epic_Travelers.Pages.sitemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="HTML Sitemap for Epic-Travellers – Discover Incredible India. Access all pages, tour packages, destinations, and blog articles.">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div style="padding-top: calc(var(--header-height) + 40px); padding-bottom: 80px;">
    <div class="container">
      <div class="section-header anim-fade-up">
        <div class="section-label"><i class="fa-solid fa-sitemap"></i> Navigation Map</div>
        <h1 class="section-title">Website <span class="text-gradient">Sitemap</span></h1>
        <p class="section-subtitle">A complete list of all pages and resources available on Epic-Travellers.</p>
      </div>

      <div class="grid grid-3 gap-24 stagger-children">

        <div class="card p-24 anim-fade-up" style="padding:24px;">
          <h3 style="font-size:18px; font-weight:700; color:var(--primary); margin-bottom:16px;">🏠 Main Pages</h3>
          <ul style="display:flex; flex-direction:column; gap:10px; font-size:15px;">
            <li><a href="/Pages/index.aspx">→ Home Page</a></li>
            <li><a href="/Pages/destinations.aspx">→ Indian Destinations</a></li>
            <li><a href="/Pages/packages.aspx">→ Handcrafted Tour Packages</a></li>
            <li><a href="/Pages/about.aspx">→ About Us & Leadership</a></li>
            <li><a href="/Pages/gallery.aspx">→ Photo & Video Gallery</a></li>
            <li><a href="/Pages/blog.aspx">→ Travel Blog & Guides</a></li>
            <li><a href="/Pages/contact.aspx">→ Contact Us & 24/7 Support</a></li>
          </ul>
        </div>

        <div class="card p-24 anim-fade-up" style="padding:24px;">
          <h3 style="font-size:18px; font-weight:700; color:var(--secondary); margin-bottom:16px;">🏔️ Top Destinations</h3>
          <ul style="display:flex; flex-direction:column; gap:10px; font-size:15px;">
            <li><a href="/Pages/destinations.aspx?dest=rajasthan">→ Rajasthan (Jaipur, Udaipur)</a></li>
            <li><a href="/Pages/destinations.aspx?dest=kerala">→ Kerala (Munnar, Alleppey)</a></li>
            <li><a href="/Pages/destinations.aspx?dest=goa">→ Goa (North & South Beaches)</a></li>
            <li><a href="/Pages/destinations.aspx?dest=ladakh">→ Ladakh (Leh & Pangong)</a></li>
            <li><a href="/Pages/destinations.aspx?dest=manali">→ Himachal (Manali & Shimla)</a></li>
            <li><a href="/Pages/destinations.aspx?dest=andaman">→ Andaman & Nicobar Islands</a></li>
            <li><a href="/Pages/destinations.aspx?dest=varanasi">→ Varanasi & Sacred Ghats</a></li>
          </ul>
        </div>

        <div class="card p-24 anim-fade-up" style="padding:24px;">
          <h3 style="font-size:18px; font-weight:700; color:var(--accent); margin-bottom:16px;">🔐 Account & Admin</h3>
          <ul style="display:flex; flex-direction:column; gap:10px; font-size:15px;">
            <li><a href="/Pages/auth.aspx">→ User Login / Sign Up</a></li>
            <li><a href="/Pages/dashboard.aspx">→ My Bookings & Wishlist</a></li>
            <li><a href="/Pages/admin.aspx">→ Admin Control Dashboard</a></li>
            <li><a href="/Pages/404.aspx">→ Custom 404 Error Page</a></li>
          </ul>
        </div>

      </div>
    </div>
  </div>
</asp:Content>

