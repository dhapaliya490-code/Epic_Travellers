<%@ Page Title="Travel Blog – Epic-Travellers | Stories & Guides of India" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="Epic_Travelers.Pages.blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Discover inspiring travel stories, destination guides, and expert Indian travel tips on the Epic-Travellers blog.">
  <meta name="keywords" content="India travel blog, Ladakh travel guide, Rajasthan tips, Kerala backwaters blog, travel advice India">

  <style>
    .page-hero {
      background: linear-gradient(135deg, rgba(15,23,42,0.85) 0%, rgba(14,165,233,0.7) 100%),
                  url('../Content/images/img_10.jpg') center/cover;
      padding: 140px 0 80px;
      color: white;
      text-align: center;
    }

    .featured-blog-card {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      overflow: hidden;
      box-shadow: var(--shadow-xl);
      border: 1px solid var(--gray-200);
      display: grid;
      grid-template-columns: 1.2fr 1fr;
    }

    .sidebar-widget {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 24px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      margin-bottom: 24px;
    }

    @media (max-width: 992px) {
      .featured-blog-card { grid-template-columns: 1fr; }
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
          <span class="breadcrumb-item active" style="color:white;">Travel Blog</span>
        </div>
        <h1 class="section-title" style="color:white; font-size:clamp(32px, 5vw, 54px);">
          India Travel <span style="color:var(--accent-light);">Stories & Guides</span>
        </h1>
        <p style="color:rgba(255,255,255,0.85); max-width:600px; margin:0 auto; font-size:16px;">
          Expert itineraries, secret travel hacks, local food guides, and photo inspiration for exploring Incredible India.
        </p>
      </div>
    </section>

    <!-- Main Section -->
    <section class="section">
      <div class="container">

        <!-- Featured Post Banner -->
        <div class="featured-blog-card mb-48 anim-fade-up">
          <div style="height:340px; overflow:hidden;">
            <img src="../Content/images/img_15.jpg" style="width:100%; height:100%; object-fit:cover;" alt="Ladakh Roadtrip">
          </div>
          <div style="padding:32px; display:flex; flex-direction:column; justify-content:center;">
            <span class="badge badge-accent mb-12" style="width:max-content;">⭐ Featured Article</span>
            <h2 style="font-size:24px; font-weight:800; line-height:1.3; margin-bottom:12px;">
              <a href="/Pages/blog-details.aspx?id=ladakh-biking-guide" style="color:var(--text-primary);">The Ultimate Ladakh Biking Expedition Guide 2025</a>
            </h2>
            <p style="font-size:14px; color:var(--text-secondary); line-height:1.7; margin-bottom:20px;">
              Everything you need to plan a bike journey over Khardung La, Chang La, and Pangong Tso. Permits, oxygen tips, gear checklist, and road conditions explained.
            </p>
            <div class="blog-meta mb-20">
              <span><i class="fa-regular fa-user"></i> Kabir Sharma</span>
              <span><i class="fa-regular fa-calendar"></i> Jan 15, 2025</span>
              <span><i class="fa-regular fa-clock"></i> 8 min read</span>
            </div>
            <a href="/Pages/blog-details.aspx?id=ladakh-biking-guide" class="btn btn-primary btn-sm" style="width:max-content;">Read Full Story <i class="fa-solid fa-arrow-right"></i></a>
          </div>
        </div>

        <!-- Grid Layout: Articles + Sidebar -->
        <div class="grid" style="grid-template-columns: 2.2fr 1fr; gap:40px;">

          <!-- Article Cards Grid -->
          <div>
            <div class="grid grid-2 stagger-children" id="blog-articles-grid">

              <!-- Article 1 -->
              <article class="blog-card anim-fade-up">
                <div class="blog-card-image">
                  <a href="/Pages/blog-details.aspx?id=kerala-backwaters-houseboat"><img src="../Content/images/img_55.jpg" alt="Kerala backwaters" loading="lazy"></a>
                </div>
                <div class="blog-card-body">
                  <span class="blog-category">Nature & Backwaters</span>
                  <h3 class="blog-card-title"><a href="/Pages/blog-details.aspx?id=kerala-backwaters-houseboat">Kerala Backwaters: Houseboat Cruise Experience</a></h3>
                  <p style="font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:12px;">
                    Float through green waterways in Alleppey and Kumarakom with authentic Karimeen fish fry.
                  </p>
                  <div class="blog-meta">
                    <span><i class="fa-regular fa-calendar"></i> Jan 10, 2025</span>
                    <span><i class="fa-regular fa-clock"></i> 5 min</span>
                  </div>
                </div>
              </article>

              <!-- Article 2 -->
              <article class="blog-card anim-fade-up">
                <div class="blog-card-image">
                  <a href="/Pages/blog-details.aspx?id=rajasthan-forts"><img src="../Content/images/img_48.jpg" alt="Rajasthan palaces" loading="lazy"></a>
                </div>
                <div class="blog-card-body">
                  <span class="blog-category">Heritage & Palaces</span>
                  <h3 class="blog-card-title"><a href="/Pages/blog-details.aspx?id=rajasthan-forts">10 Forts in Rajasthan That Transport You Back in Time</a></h3>
                  <p style="font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:12px;">
                    Explore Mehrangarh Fort, Amber Palace, and Chittorgarh – legends of valor and royal architecture.
                  </p>
                  <div class="blog-meta">
                    <span><i class="fa-regular fa-calendar"></i> Jan 04, 2025</span>
                    <span><i class="fa-regular fa-clock"></i> 7 min</span>
                  </div>
                </div>
              </article>

              <!-- Article 3 -->
              <article class="blog-card anim-fade-up">
                <div class="blog-card-image">
                  <a href="/Pages/blog-details.aspx?id=goa-hidden-spots"><img src="../Content/images/img_21.jpg" alt="Goa beaches" loading="lazy"></a>
                </div>
                <div class="blog-card-body">
                  <span class="blog-category">Beach & Nightlife</span>
                  <h3 class="blog-card-title"><a href="/Pages/blog-details.aspx?id=goa-hidden-spots">Beyond Beaches: Hidden Secret Spots in South Goa</a></h3>
                  <p style="font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:12px;">
                    Discover quiet spice plantations, Cabo de Rama fort, and serene Butterfly beach away from crowds.
                  </p>
                  <div class="blog-meta">
                    <span><i class="fa-regular fa-calendar"></i> Dec 28, 2024</span>
                    <span><i class="fa-regular fa-clock"></i> 6 min</span>
                  </div>
                </div>
              </article>

              <!-- Article 4 -->
              <article class="blog-card anim-fade-up">
                <div class="blog-card-image">
                  <a href="/Pages/blog-details.aspx?id=varanasi-ganga-aarti"><img src="../Content/images/img_41.jpg" alt="Varanasi Ghats" loading="lazy"></a>
                </div>
                <div class="blog-card-body">
                  <span class="blog-category">Spiritual Journey</span>
                  <h3 class="blog-card-title"><a href="/Pages/blog-details.aspx?id=varanasi-ganga-aarti">A Spiritual Morning in Varanasi: Boat Ride & Ganga Aarti</a></h3>
                  <p style="font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:12px;">
                    Witnessing the divine energy at Dashashwamedh Ghat as priests perform sacred fire rituals.
                  </p>
                  <div class="blog-meta">
                    <span><i class="fa-regular fa-calendar"></i> Dec 18, 2024</span>
                    <span><i class="fa-regular fa-clock"></i> 5 min</span>
                  </div>
                </div>
              </article>

            </div>
          </div>

          <!-- Sidebar -->
          <div>
            <!-- Search Widget -->
            <div class="sidebar-widget">
              <h4 style="font-size:16px; font-weight:700; margin-bottom:16px;">Search Blog</h4>
              <div class="form-group mb-0">
                <input type="text" class="form-control" placeholder="Search topics, cities..." id="blog-search">
              </div>
            </div>

            <!-- Categories Widget -->
            <div class="sidebar-widget">
              <h4 style="font-size:16px; font-weight:700; margin-bottom:16px;">Categories</h4>
              <ul style="display:flex; flex-direction:column; gap:10px;">
                <li class="flex-between" style="font-size:14px; color:var(--text-secondary);">
                  <a href="#">🏔️ Himalayan Treks</a> <span>(14)</span>
                </li>
                <li class="flex-between" style="font-size:14px; color:var(--text-secondary);">
                  <a href="#">🏖️ Coastal & Beaches</a> <span>(18)</span>
                </li>
                <li class="flex-between" style="font-size:14px; color:var(--text-secondary);">
                  <a href="#">🏰 Forts & Heritage</a> <span>(22)</span>
                </li>
                <li class="flex-between" style="font-size:14px; color:var(--text-secondary);">
                  <a href="#">🍛 Indian Food & Dining</a> <span>(11)</span>
                </li>
                <li class="flex-between" style="font-size:14px; color:var(--text-secondary);">
                  <a href="#">🛕 Spiritual Guides</a> <span>(9)</span>
                </li>
              </ul>
            </div>

            <!-- Newsletter Widget -->
            <div class="sidebar-widget" style="background:var(--gradient-primary); color:white;">
              <h4 style="font-size:16px; font-weight:700; margin-bottom:8px; color:white;">✈️ Travel Newsletter</h4>
              <p style="font-size:13px; opacity:0.9; margin-bottom:16px;">Get weekly India destination guides and exclusive tour discounts directly in your inbox.</p>
              <div class="newsletter-form">
                <input type="email" placeholder="Your email..." required class="form-control mb-12" style="background:white; color:var(--text-primary);">
                <button type="button" onclick="Toast.show('Subscribed to newsletter!', 'success')" class="btn btn-accent btn-sm" style="width:100%;">Subscribe Free</button>
              </div>
            </div>
          </div>

        </div>
      </div>
    </section>
</asp:Content>
