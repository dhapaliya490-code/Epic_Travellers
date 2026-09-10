<%@ Page Title="Create Account – Epic-Travellers | Discover Incredible India" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Epic_Travelers.Pages.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Create a new Epic-Travellers account to explore luxury tour packages and personalized travel planning across India.">

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
        <h2 style="font-size:24px; font-weight:800;">Create Account</h2>
        <p style="font-size:14px; color:var(--text-secondary);">Join 50,000+ travellers exploring Incredible India</p>
      </div>

      <asp:Panel ID="registerFormPage" runat="server" DefaultButton="btnCreateAccount">
        <div class="form-group">
          <asp:Label ID="lblFullName" runat="server" CssClass="form-label" AssociatedControlID="txtFullName" Text="Full Name"></asp:Label>
          <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="e.g. Vikram Sharma" required="required"></asp:TextBox>
        </div>

        <div class="form-group">
          <asp:Label ID="lblEmail" runat="server" CssClass="form-label" AssociatedControlID="txtEmail" Text="Email Address"></asp:Label>
          <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="name@domain.com" required="required"></asp:TextBox>
        </div>

        <div class="form-group">
          <asp:Label ID="lblPassword" runat="server" CssClass="form-label" AssociatedControlID="txtPassword" Text="Create Password"></asp:Label>
          <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Min 8 characters" required="required"></asp:TextBox>
        </div>

        <asp:Button ID="btnCreateAccount" runat="server" CssClass="btn btn-accent btn-lg" Text="Create Account 🎉" Style="width:100%;" OnClick="btnCreateAccount_Click" CausesValidation="false" UseSubmitBehavior="false"/>

        <div class="divider" style="text-align:center; position:relative; margin:24px 0;">
          <span style="background:var(--bg-primary); padding:0 12px; color:var(--text-muted); font-size:12px;">OR SIGN UP WITH</span>
        </div>  

        <div style="display:flex; flex-direction:column; gap:10px;">
          <asp:LinkButton ID="btnGoogleSignup" runat="server" CssClass="social-btn" OnClientClick="Toast.show('Google Sign-Up initialized', 'info'); return false;" CausesValidation="false">
            <i class="fa-brands fa-google" style="color:#EA4335;"></i> Sign up with Google
          </asp:LinkButton>
        </div>
      </asp:Panel>

      <div class="text-center mt-24" style="font-size:14px; color:var(--text-secondary);">
        Already have an account? <a href="/Pages/login.aspx" style="color:var(--primary); font-weight:600;">Sign In</a>
      </div>

        <br />
        <br />
        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>

                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Id") %>'></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Full Name">
                    <ItemTemplate>

                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Full Name") %>'></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>

                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Email") %>'></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
  </div>
</asp:Content>

