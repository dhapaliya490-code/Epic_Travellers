<%@ Page Title="Contact Us – Epic-Travellers | 24/7 Travel Assistance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Epic_Travelers.Pages.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Contact Epic-Travellers – We're here to help you plan your ideal India trip. Get in touch via phone, email, WhatsApp, or visit our headquarters in New Delhi.">
  <meta name="keywords" content="Contact Epic Travellers, India travel agent contact, Delhi travel agency office, travel customer support">

  <style>
    .page-hero {
      background: linear-gradient(135deg, rgba(15,23,42,0.85) 0%, rgba(14,165,233,0.7) 100%),
                  url('../Content/images/img_23.jpg') center/cover;
      padding: 140px 0 80px;
      color: white;
      text-align: center;
    }

    .contact-info-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 24px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      display: flex;
      align-items: flex-start;
      gap: 16px;
    }

    .contact-icon {
      width: 48px;
      height: 48px;
      border-radius: var(--radius-lg);
      background: var(--gradient-primary);
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 20px;
      flex-shrink: 0;
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Header -->
    <section class="page-hero">
      <div class="container">
        <div class="breadcrumb flex-center mb-16" style="justify-content:center;">
          <a href="/Pages/index.aspx" class="breadcrumb-item" style="color:rgba(255,255,255,0.7);">Home</a>
          <span class="breadcrumb-sep">/</span>
          <span class="breadcrumb-item active" style="color:white;">Contact Us</span>
        </div>
        <h1 class="section-title" style="color:white; font-size:clamp(32px, 5vw, 54px);">
          Get in Touch <span style="color:var(--accent-light);">With Us</span>
        </h1>
        <p style="color:rgba(255,255,255,0.85); max-width:600px; margin:0 auto; font-size:16px;">
          Have questions about a package or need a custom trip plan? Our travel specialists are available 24/7.
        </p>
      </div>
    </section>

    <!-- Main Contact Section -->
    <section class="section">
      <div class="container">

        <!-- Info Cards Row -->
        <div class="grid grid-4 mb-48 stagger-children">

          <div class="contact-info-card anim-fade-up">
            <div class="contact-icon"><i class="fa-solid fa-location-dot"></i></div>
            <div>
              <h4 style="font-size:16px; font-weight:700; margin-bottom:4px;">Headquarters</h4>
              <p style="font-size:13px; color:var(--text-secondary); line-height:1.5;">
                Connaught Place, Block C, Inner Circle, New Delhi 110001, India
              </p>
            </div>
          </div>

          <div class="contact-info-card anim-fade-up">
            <div class="contact-icon"><i class="fa-solid fa-phone"></i></div>
            <div>
              <h4 style="font-size:16px; font-weight:700; margin-bottom:4px;">Call Us 24/7</h4>
              <p style="font-size:13px; color:var(--text-secondary); line-height:1.5;">
                +91 98765 43210<br>+91 11 2345 6789
              </p>
            </div>
          </div>

          <div class="contact-info-card anim-fade-up">
            <div class="contact-icon"><i class="fa-solid fa-envelope"></i></div>
            <div>
              <h4 style="font-size:16px; font-weight:700; margin-bottom:4px;">Email Us</h4>
              <p style="font-size:13px; color:var(--text-secondary); line-height:1.5;">
                support@epic-travellers.com<br>bookings@epic-travellers.com
              </p>
            </div>
          </div>

          <div class="contact-info-card anim-fade-up">
            <div class="contact-icon" style="background:linear-gradient(135deg, #25D366, #128C7E);"><i class="fa-brands fa-whatsapp"></i></div>
            <div>
              <h4 style="font-size:16px; font-weight:700; margin-bottom:4px;">WhatsApp Chat</h4>
              <p style="font-size:13px; color:var(--text-secondary); line-height:1.5;">
                +91 98765 43210<br><span style="color:#25D366; font-weight:600;">Instant Reply</span>
              </p>
            </div>
          </div>

        </div>

        <!-- Form + Map Grid -->
        <div class="grid grid-2" style="gap:40px; align-items:start;">

          <!-- Contact Form -->
          <div class="card p-32 anim-fade-left" style="padding:32px;">
            <h2 style="font-size:22px; font-weight:700; margin-bottom:8px;">Send Us a Message</h2>
            <p style="font-size:14px; color:var(--text-secondary); margin-bottom:24px;">Fill out the form below and our travel advisor will respond within 30 minutes.</p>

            <div id="contact-form" onsubmit="event.preventDefault(); Toast.show('Message sent successfully! We\'ll reply shortly. 📩', 'success');">
              <div class="grid grid-2" style="gap:16px;">
                <div class="form-group">
                  <label class="form-label" for="c-name">Your Full Name</label>
                  <input type="text" id="c-name" class="form-control" placeholder="e.g. Rahul Sharma" required>
                </div>
                <div class="form-group">
                  <label class="form-label" for="c-email">Email Address</label>
                  <input type="email" id="c-email" class="form-control" placeholder="name@example.com" required>
                </div>
              </div>

              <div class="grid grid-2" style="gap:16px;">
                <div class="form-group">
                  <label class="form-label" for="c-phone">Phone Number</label>
                  <input type="tel" id="c-phone" class="form-control" placeholder="+91 98765 43210" required>
                </div>
                <div class="form-group">
                  <label class="form-label" for="c-dest">Destination Interested In</label>
                  <select id="c-dest" class="form-control filter-select">
                    <option value="rajasthan">Royal Rajasthan</option>
                    <option value="kerala">Kerala Backwaters</option>
                    <option value="goa">Goa Beaches</option>
                    <option value="ladakh">Ladakh Adventure</option>
                    <option value="andaman">Andaman Islands</option>
                    <option value="other">Custom / Other</option>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="form-label" for="c-msg">Your Message / Special Requests</label>
                <textarea id="c-msg" class="form-control" rows="4" placeholder="Tell us your dates, number of travelers, budget preferences..." required></textarea>
              </div>

              <button type="button" onclick="Toast.show('Message sent successfully! We\'ll reply shortly. 📩', 'success');" class="btn btn-primary btn-lg" style="width:100%;">
                <i class="fa-solid fa-paper-plane"></i> Send Inquiry Now
              </button>
            </div>
          </div>

          <!-- Office Map & Location -->
          <div class="anim-fade-right">
            <div class="card p-24" style="padding:24px; margin-bottom:24px;">
              <h3 style="font-size:18px; font-weight:700; margin-bottom:12px;">Visit New Delhi Headquarters</h3>
              <p style="font-size:14px; color:var(--text-secondary); margin-bottom:16px;">
                Open Monday to Saturday: 9:00 AM – 8:00 PM IST. Walk-ins welcome for coffee and trip planning!
              </p>
              <div style="height:320px; border-radius:var(--radius-lg); overflow:hidden; position:relative; background:#cbd5e1;">
                <div style="width:100%; height:100%; min-height:320px; background:linear-gradient(135deg, #0F172A 0%, #1E293B 100%); border-radius:var(--radius-lg); display:flex; flex-direction:column; align-items:center; justify-content:center; color:white; text-align:center; padding:24px;">
  <div style="font-size:42px; margin-bottom:12px;">🗺️</div>
  <h4 style="font-size:18px; font-weight:700; margin-bottom:6px; color:white;">Connaught Place Headquarters</h4>
  <p style="font-size:13px; color:rgba(255,255,255,0.7); max-width:320px;">Block C, Inner Circle, New Delhi 110001, India</p>
  <div style="margin-top:16px; font-size:12px; color:var(--primary-light); background:rgba(14,165,233,0.15); padding:6px 16px; border-radius:var(--radius-full);">📍 Offline Map View • Coordinates: 28.6301° N, 77.2167° E</div>
</div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section>
</asp:Content>
