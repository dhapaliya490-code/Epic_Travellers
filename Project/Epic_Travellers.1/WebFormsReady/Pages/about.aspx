<%@ Page Title="About Us – Epic-Travellers | Premier Indian Travel Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Epic_Travelers.Pages.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Learn about Epic-Travellers – India's premier luxury travel company. Discover our story, mission, vision, expert team, and achievements in crafting authentic Indian journeys.">
  <meta name="keywords" content="About Epic-Travellers, India travel company, luxury travel agency India, travel team, awards">

  <style>
    .page-hero {
      background: linear-gradient(135deg, rgba(15,23,42,0.85) 0%, rgba(14,165,233,0.7) 100%),
                  url('../Content/images/img_23.jpg') center/cover;
      padding: 140px 0 80px;
      color: white;
      text-align: center;
    }

    .team-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      overflow: hidden;
      box-shadow: var(--shadow-md);
      border: 1px solid var(--gray-200);
      text-align: center;
      transition: var(--transition-normal);
    }

    .team-card:hover {
      transform: translateY(-8px);
      box-shadow: var(--shadow-xl);
    }

    .team-img {
      height: 260px;
      width: 100%;
      object-fit: cover;
    }

    .team-body { padding: 20px; }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Banner -->
    <section class="page-hero">
      <div class="container">
        <div class="breadcrumb flex-center mb-16" style="justify-content:center;">
          <a href="/Pages/index.aspx" class="breadcrumb-item" style="color:rgba(255,255,255,0.7);">Home</a>
          <span class="breadcrumb-sep">/</span>
          <span class="breadcrumb-item active" style="color:white;">About Us</span>
        </div>
        <h1 class="section-title" style="color:white; font-size:clamp(32px, 5vw, 54px);">
          Unveiling <span style="color:var(--accent-light);">Incredible India</span>
        </h1>
        <p style="color:rgba(255,255,255,0.85); max-width:600px; margin:0 auto; font-size:16px;">
          For over 12 years, Epic-Travellers has been inspiring global explorers to experience the soul, heritage, and natural magnificence of India.
        </p>
      </div>
    </section>

    <!-- Our Story Section -->
    <section class="section">
      <div class="container">
        <div class="grid grid-2" style="gap:48px; align-items:center;">
          <div class="anim-fade-left">
            <div class="section-label"><i class="fa-solid fa-book-open"></i> Our Story</div>
            <h2 class="section-title">Born from a Passion for <span class="text-gradient">Indian Culture</span></h2>
            <p style="color:var(--text-secondary); line-height:1.8; margin-bottom:16px;">
              Founded in 2013 in New Delhi, Epic-Travellers began with a single mission: to redefine travel across India by providing authentic, seamless, and luxury experiences for travelers from every corner of the world.
            </p>
            <p style="color:var(--text-secondary); line-height:1.8; margin-bottom:24px;">
              Whether navigating Rajasthan's royal palaces, cruising Kerala's serene lagoons, or trekking high Himalayan passes in Ladakh, we ensure every detail is meticulously curated.
            </p>

            <div class="grid grid-2" style="gap:16px;">
              <div class="card p-16" style="padding:16px; background:var(--bg-secondary);">
                <h4 style="font-size:16px; font-weight:700; color:var(--primary); margin-bottom:4px;">🎯 Mission</h4>
                <p style="font-size:13px; color:var(--text-secondary);">To connect travellers with the rich heritage and diverse landscapes of India through safe, sustainable, and unforgettable journeys.</p>
              </div>
              <div class="card p-16" style="padding:16px; background:var(--bg-secondary);">
                <h4 style="font-size:16px; font-weight:700; color:var(--secondary); margin-bottom:4px;">👁️ Vision</h4>
                <p style="font-size:13px; color:var(--text-secondary);">To be India's most trusted and sustainable luxury travel brand recognized globally for excellence in hospitality.</p>
              </div>
            </div>
          </div>

          <div class="anim-fade-right" style="position:relative;">
            <img src="../Content/images/img_26.jpg" style="border-radius:var(--radius-2xl); box-shadow:var(--shadow-xl); width:100%;" alt="Epic Travellers Team in Jaipur">
            <div style="position:absolute; bottom:-20px; left:-20px; background:var(--gradient-primary); color:white; padding:20px; border-radius:var(--radius-xl); box-shadow:var(--shadow-lg); max-width:220px;" class="hide-mobile">
              <div style="font-size:32px; font-weight:800; line-height:1;">12+</div>
              <div style="font-size:13px; font-weight:500;">Years of Tourism Leadership in India</div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Stats Banner -->
    <section class="section" style="background:var(--bg-secondary);">
      <div class="container">
        <div class="grid grid-4 text-center stagger-children">
          <div class="anim-scale">
            <div class="stat-value" data-counter="50000" data-suffix="+">0</div>
            <div class="stat-label">Happy Travellers Hosted</div>
          </div>
          <div class="anim-scale">
            <div class="stat-value" data-counter="500" data-suffix="+">0</div>
            <div class="stat-label">Indian Destinations</div>
          </div>
          <div class="anim-scale">
            <div class="stat-value" data-counter="98" data-suffix="%">0</div>
            <div class="stat-label">Satisfaction Rate</div>
          </div>
          <div class="anim-scale">
            <div class="stat-value" data-counter="25" data-suffix="+">0</div>
            <div class="stat-label">National Awards</div>
          </div>
        </div>
      </div>
    </section>

    <!-- Team Members Section -->
    <section class="section">
      <div class="container">
        <div class="section-header anim-fade-up">
          <div class="section-label"><i class="fa-solid fa-users"></i> Leadership</div>
          <h2 class="section-title">Meet Our <span class="text-gradient">Travel Experts</span></h2>
          <p class="section-subtitle">Passionate explorers, cultural historians, and hospitality veterans leading Epic-Travellers.</p>
        </div>

        <div class="grid grid-4 stagger-children">
          <div class="team-card anim-fade-up">
            <img src="../Content/images/img_17.jpg" alt="Vikramaditya Singh CEO" class="team-img">
            <div class="team-body">
              <h3 style="font-size:18px; font-weight:700;">Vikramaditya Singh</h3>
              <p style="font-size:13px; color:var(--primary); font-weight:600; margin-bottom:8px;">Founder & CEO</p>
              <p style="font-size:13px; color:var(--text-secondary);">18+ years in Indian heritage tourism and palace hospitality.</p>
            </div>
          </div>

          <div class="team-card anim-fade-up">
            <img src="../Content/images/img_29.jpg" alt="Meera Iyer COO" class="team-img">
            <div class="team-body">
              <h3 style="font-size:18px; font-weight:700;">Meera Iyer</h3>
              <p style="font-size:13px; color:var(--primary); font-weight:600; margin-bottom:8px;">Chief Operations Officer</p>
              <p style="font-size:13px; color:var(--text-secondary);">Specialist in South Indian backwaters and eco-tourism.</p>
            </div>
          </div>

          <div class="team-card anim-fade-up">
            <img src="../Content/images/img_8.jpg" alt="Kabir Sharma Head of Adventure" class="team-img">
            <div class="team-body">
              <h3 style="font-size:18px; font-weight:700;">Kabir Sharma</h3>
              <p style="font-size:13px; color:var(--primary); font-weight:600; margin-bottom:8px;">Head of Himalayan Adventures</p>
              <p style="font-size:13px; color:var(--text-secondary);">Certified mountain mountaineer with 100+ high pass treks.</p>
            </div>
          </div>

          <div class="team-card anim-fade-up">
            <img src="../Content/images/img_29.jpg" alt="Sunita Roy Customer Success" class="team-img">
            <div class="team-body">
              <h3 style="font-size:18px; font-weight:700;">Sunita Roy</h3>
              <p style="font-size:13px; color:var(--primary); font-weight:600; margin-bottom:8px;">Director of Guest Experience</p>
              <p style="font-size:13px; color:var(--text-secondary);">Ensuring 24/7 care and personalized trip itineraries.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Awards Section -->
    <section class="section" style="background:var(--bg-secondary);">
      <div class="container">
        <div class="section-header anim-fade-up">
          <div class="section-label"><i class="fa-solid fa-trophy"></i> Recognition</div>
          <h2 class="section-title">Awards & <span class="text-gradient">Certifications</span></h2>
        </div>
        <div class="grid grid-3 text-center stagger-children">
          <div class="card p-24 anim-fade-up" style="padding:28px;">
            <div style="font-size:40px; margin-bottom:12px;">🏆</div>
            <h3 style="font-size:18px; font-weight:700;">Best Luxury Tour Operator</h3>
            <p style="font-size:13px; color:var(--text-secondary); margin-top:8px;">India Tourism Excellence Awards 2024</p>
          </div>
          <div class="card p-24 anim-fade-up" style="padding:28px;">
            <div style="font-size:40px; margin-bottom:12px;">🥇</div>
            <h3 style="font-size:18px; font-weight:700;">Top Responsible Tourism Brand</h3>
            <p style="font-size:13px; color:var(--text-secondary); margin-top:8px;">National Heritage & Culture Council 2023</p>
          </div>
          <div class="card p-24 anim-fade-up" style="padding:28px;">
            <div style="font-size:40px; margin-bottom:12px;">⭐</div>
            <h3 style="font-size:18px; font-weight:700;">TripAdvisor Choice Best of Best</h3>
            <p style="font-size:13px; color:var(--text-secondary); margin-top:8px;">Consistent 5-Star Traveler Rating</p>
          </div>
        </div>
      </div>
    </section>

</asp:Content>
