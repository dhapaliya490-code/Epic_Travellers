<%@ Page Title="404 Page Not Found – Epic-Travellers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="Epic_Travelers.Pages.Page_404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Page not found – Epic-Travellers.">
  <style>
    .error-container {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      padding: calc(var(--header-height) + 40px) 20px 60px;
      background: linear-gradient(135deg, rgba(14,165,233,0.08) 0%, rgba(245,158,11,0.08) 100%);
    }

    .error-code {
      font-family: 'Playfair Display', serif;
      font-size: clamp(80px, 15vw, 160px);
      font-weight: 900;
      background: var(--gradient-primary);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      line-height: 1;
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="error-container">
    <div class="container" style="max-width:600px;">
      <div class="anim-scale">
        <div class="error-code">404</div>
        <h1 style="font-size:28px; font-weight:800; margin-bottom:12px;">Looks Like You're Lost!</h1>
        <p style="color:var(--text-secondary); font-size:16px; margin-bottom:32px; line-height:1.7;">
          The travel destination or page you are looking for has wandered off the map or no longer exists.
        </p>

        <div style="display:flex; gap:16px; justify-content:center; flex-wrap:wrap;">
          <a href="/Pages/index.aspx" class="btn btn-primary btn-lg"><i class="fa-solid fa-house"></i> Return Home</a>
          <a href="/Pages/destinations.aspx" class="btn btn-secondary btn-lg"><i class="fa-solid fa-compass"></i> Explore Destinations</a>
        </div>
      </div>
    </div>
  </div>
</asp:Content>

