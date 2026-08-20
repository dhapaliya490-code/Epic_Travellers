<%@ Page Title="Sign In / Register – Epic-Travellers | Discover India" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="auth.aspx.cs" Inherits="Epic_Travelers.Pages.auth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Sign in or create an account with Epic-Travellers. Unlock exclusive Indian tour discounts and track your travel bookings.">

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

    .social-btn:hover {
      background: var(--gray-100);
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="auth-card anim-scale">

      <!-- Auth Header Tabs -->
      <div class="tabs mb-32">
        <button type="button" class="tab active" id="tab-login-btn" onclick="toggleAuth('login')">Sign In</button>
        <button type="button" class="tab" id="tab-register-btn" onclick="toggleAuth('register')">Create Account</button>
      </div>

      <!-- Login Form -->
      <div id="login-form" onsubmit="event.preventDefault(); Toast.show('Welcome back! Logging you in... 🚀', 'success'); setTimeout(() => window.location.href='dashboard.html', 1500);">
        <div class="text-center mb-24">
          <h2 style="font-size:22px; font-weight:700;">Welcome Back</h2>
          <p style="font-size:14px; color:var(--text-secondary);">Enter your credentials to access your trips</p>
        </div>

        <div class="form-group">
          <label class="form-label" for="login-email">Email Address</label>
          <input type="email" id="login-email" class="form-control" placeholder="name@domain.com" required>
        </div>

        <div class="form-group">
          <div class="flex-between mb-6">
            <label class="form-label mb-0" for="login-pass">Password</label>
            <a href="#" style="font-size:12px; color:var(--primary);" onclick="alert('Password reset link sent to your email!')">Forgot Password?</a>
          </div>
          <input type="password" id="login-pass" class="form-control" placeholder="••••••••" required>
        </div>

        <button type="button" onclick="Toast.show('Welcome back! Logging you in... 🚀', 'success'); setTimeout(() => window.location.href='dashboard.html', 1500);" class="btn btn-primary btn-lg" style="width:100%;">Sign In ➔</button>

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

      <!-- Register Form -->
      <div id="register-form" style="display:none;" onsubmit="event.preventDefault(); Toast.show('Account created successfully! Welcome aboard ✈️', 'success'); setTimeout(() => window.location.href='dashboard.html', 1500);">
        <div class="text-center mb-24">
          <h2 style="font-size:22px; font-weight:700;">Join Epic-Travellers</h2>
          <p style="font-size:14px; color:var(--text-secondary);">Start your journey across Incredible India</p>
        </div>

        <div class="form-group">
          <label class="form-label" for="reg-name">Full Name</label>
          <input type="text" id="reg-name" class="form-control" placeholder="e.g. Vikram Sharma" required>
        </div>

        <div class="form-group">
          <label class="form-label" for="reg-email">Email Address</label>
          <input type="email" id="reg-email" class="form-control" placeholder="name@domain.com" required>
        </div>

        <div class="form-group">
          <label class="form-label" for="reg-pass">Create Password</label>
          <input type="password" id="reg-pass" class="form-control" placeholder="Min 8 characters" required>
        </div>

        <button type="button" onclick="Toast.show('Account created successfully! Welcome aboard ✈️', 'success'); setTimeout(() => window.location.href='dashboard.html', 1500);" class="btn btn-accent btn-lg" style="width:100%;">Create Account 🎉</button>
      </div>

    </div>
  </div>

  <script>
    function switchAuthTab(mode) {
      const loginForm = document.getElementById('login-form-box');
      const regForm = document.getElementById('register-form-box');
      const loginBtn = document.getElementById('tab-login-btn');
      const regBtn = document.getElementById('tab-register-btn');

      if (mode === 'login') {
        loginForm.style.display = 'block';
        regForm.style.display = 'none';
        loginBtn.classList.add('active');
        regBtn.classList.remove('active');
      } else {
        loginForm.style.display = 'none';
        regForm.style.display = 'block';
        loginBtn.classList.remove('active');
        regBtn.classList.add('active');
      }
    }
  </script>
</asp:Content>
