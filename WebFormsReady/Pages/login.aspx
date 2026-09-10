<%@ Page Title="Log In – Epic-Travellers | Discover Incredible India" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Epic_Travelers.Pages.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Sign in to your Epic-Travellers account to manage tour bookings and access customized India trip itineraries.">

  <style>
    .auth-container {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: calc(var(--header-height) + 40px) 20px 60px;
      background: linear-gradient(135deg, rgba(14,165,233,0.05) 0%, rgba(20,184,166,0.05) 100%);
    }

    .auth-card {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      padding: 40px;
      box-shadow: var(--shadow-xl);
      border: 1px solid var(--gray-200);
      width: 100%;
      max-width: 460px;
    }

    .social-btn {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      width: 100%;
      padding: 12px;
      border-radius: var(--radius-md);
      border: 1px solid var(--gray-200);
      background: var(--bg-primary);
      font-size: 14px;
      font-weight: 600;
      color: var(--text-primary);
      cursor: pointer;
      transition: var(--transition-fast);
    }

    .social-btn:hover { background: var(--gray-100); }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="auth-container">
    <div class="auth-card anim-scale">
      <div class="text-center mb-24">
        <h2 style="font-size:24px; font-weight:800;">Welcome Back</h2>
        <p style="font-size:14px; color:var(--text-secondary);">Sign in to your Epic-Travellers account</p>
      </div>

      <div id="login-form-page">
        <div class="form-group">
          <label class="form-label" for="txtLoginEmail">Email Address</label>
          <asp:TextBox ID="txtLoginEmail" runat="server" TextMode="Email"
            ClientIDMode="Static" CssClass="form-control"
            placeholder="name@domain.com" />
        </div>

        <div class="form-group">
          <div class="flex-between mb-6">
            <label class="form-label mb-0" for="txtLoginPass">Password</label>
            <a href="#" style="font-size:12px; color:var(--primary);" onclick="alert('Password reset link sent to your email!')">Forgot Password?</a>
          </div>
          <asp:TextBox ID="txtLoginPass" runat="server" TextMode="Password"
            ClientIDMode="Static" CssClass="form-control"
            placeholder="••••••••" />
        </div>

        <asp:Button ID="btnSignIn" runat="server" Text="Sign In ➔"
          CssClass="btn btn-primary btn-lg"
          Style="width:100%;"
          OnClick="btnSignIn_Click" />

          <asp:Label ID="lblMessage" runat="server" CssClass="mt-12" ForeColor="Red" />


        <div class="divider" style="text-align:center; position:relative; margin:24px 0;">
          <span style="background:var(--bg-primary); padding:0 12px; color:var(--text-muted); font-size:12px;">OR CONTINUE WITH</span>
        </div>

        <div style="display:flex; flex-direction:column; gap:10px;">
          <button type="button" class="social-btn" onclick="Toast.show('Google Sign-In initialized', 'info')">
            <i class="fa-brands fa-google" style="color:#EA4335;"></i> Continue with Google
          </button>
          <button type="button" class="social-btn" onclick="Toast.show('Facebook Sign-In initialized', 'info')">
            <i class="fa-brands fa-facebook" style="color:#1877F2;"></i> Continue with Facebook
          </button>
        </div>
      </div>

      <div class="text-center mt-24" style="font-size:14px; color:var(--text-secondary);">
        Don't have an account? <a href="/Pages/register.aspx" style="color:var(--primary); font-weight:600;">Create Account</a>
      </div>
    </div>
  </div>
</asp:Content>
