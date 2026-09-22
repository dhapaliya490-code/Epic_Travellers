<%@ Page Title="Travel Blog & Magazine – Epic-Travellers | India Stories & Guides" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="Epic_Travelers.Pages.blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Immerse in award-winning travel stories, high-altitude biking guides, royal palace histories, and secret beach trails across India by Epic-Travellers local experts.">
  <meta name="keywords" content="India travel blog, Ladakh expedition guide, Kerala backwaters tips, Rajasthan forts history, Goa secret beaches, Varanasi spiritual guide, Andaman scuba diving">
  <meta name="author" content="Epic-Travellers">
  <meta property="og:title" content="Travel Blog & Magazine – Epic-Travellers India">
  <meta property="og:description" content="Award-winning travel stories, detailed itineraries, local food journeys, and insider guides for Incredible India.">

  <style>
    /* ==========================================================================
       BLOG MAGAZINE STYLING & HERO
       ========================================================================== */
    .blog-hero {
      position: relative;
      background: linear-gradient(135deg, rgba(15, 23, 42, 0.88) 0%, rgba(13, 148, 136, 0.75) 100%),
                  url('../Content/images/img_10.jpg') center/cover no-repeat;
      padding: 160px 0 110px;
      color: white;
      text-align: center;
      overflow: hidden;
    }

    .blog-hero::before {
      content: '';
      position: absolute;
      inset: 0;
      background: radial-gradient(circle at 50% 30%, rgba(20, 184, 166, 0.25), transparent 70%);
      pointer-events: none;
    }

    .hero-badge-pill {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 6px 18px;
      border-radius: 999px;
      background: rgba(255, 255, 255, 0.12);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border: 1px solid rgba(255, 255, 255, 0.25);
      color: #5EEAD4;
      font-size: 12px;
      font-weight: 800;
      letter-spacing: 1.5px;
      text-transform: uppercase;
      margin-bottom: 18px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.2);
    }

    .hero-badge-pill .pulse-dot {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #2DD4BF;
      box-shadow: 0 0 10px #2DD4BF;
      animation: pulseGlow 2s infinite;
    }

    @keyframes pulseGlow {
      0%, 100% { opacity: 1; transform: scale(1); }
      50% { opacity: 0.4; transform: scale(1.3); }
    }

    .blog-stats-bar {
      display: flex;
      justify-content: center;
      gap: 32px;
      flex-wrap: wrap;
      margin-top: 36px;
      padding-top: 24px;
      border-top: 1px solid rgba(255, 255, 255, 0.15);
    }

    .blog-stat-item {
      display: flex;
      align-items: center;
      gap: 10px;
      font-size: 13px;
      color: rgba(255, 255, 255, 0.9);
    }

    .blog-stat-item strong {
      font-size: 16px;
      color: var(--accent-light, #FBBF24);
      font-weight: 800;
    }

    /* ==========================================================================
       CONTROL & FILTER BAR
       ========================================================================== */
    .blog-control-wrapper {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      padding: 24px 30px;
      box-shadow: 0 20px 40px -15px rgba(0,0,0,0.12);
      border: 1px solid var(--gray-200);
      margin-top: -55px;
      position: relative;
      z-index: 20;
    }

    .search-input-wrapper {
      position: relative;
      width: 100%;
    }

    .search-input-wrapper i.search-icon {
      position: absolute;
      left: 18px;
      top: 50%;
      transform: translateY(-50%);
      color: var(--primary);
      font-size: 15px;
    }

    .search-input-wrapper input {
      padding-left: 48px;
      padding-right: 40px;
      height: 48px;
      border-radius: var(--radius-xl);
      font-size: 14px;
      background: var(--bg-secondary);
      border: 1px solid var(--gray-300);
      transition: all 0.25s ease;
    }

    .search-input-wrapper input:focus {
      background: var(--bg-primary);
      border-color: var(--primary);
      box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.15);
    }

    .clear-search-btn {
      position: absolute;
      right: 14px;
      top: 50%;
      transform: translateY(-50%);
      background: none;
      border: none;
      color: var(--text-muted);
      cursor: pointer;
      display: none;
      font-size: 14px;
    }

    .clear-search-btn:hover { color: var(--text-primary); }

    .blog-pill {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 9px 20px;
      border-radius: var(--radius-full);
      background: var(--bg-primary);
      color: var(--text-secondary);
      font-weight: 700;
      font-size: 13px;
      cursor: pointer;
      border: 1px solid var(--gray-300);
      transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
      box-shadow: var(--shadow-sm);
    }

    .blog-pill .pill-count {
      background: var(--bg-secondary);
      padding: 2px 7px;
      border-radius: 999px;
      font-size: 11px;
      font-weight: 800;
      color: var(--text-primary);
      transition: all 0.2s;
    }

    .blog-pill:hover, .blog-pill.active {
      background: var(--gradient-primary);
      color: white;
      border-color: transparent;
      box-shadow: 0 6px 18px rgba(14,165,233,0.35);
      transform: translateY(-2px);
    }

    .blog-pill.active .pill-count, .blog-pill:hover .pill-count {
      background: rgba(255, 255, 255, 0.25);
      color: white;
    }

    /* ==========================================================================
       FEATURED EDITORIAL MASTERPIECE
       ========================================================================== */
    .featured-editorial-card {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      overflow: hidden;
      box-shadow: var(--shadow-xl);
      border: 1px solid var(--gray-200);
      display: grid;
      grid-template-columns: 1.3fr 1fr;
      transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.4s ease;
      position: relative;
    }

    .featured-editorial-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 25px 50px -12px rgba(0,0,0,0.2);
    }

    .featured-media-box {
      height: 420px;
      overflow: hidden;
      position: relative;
    }

    .featured-media-box img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.8s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .featured-editorial-card:hover .featured-media-box img {
      transform: scale(1.06);
    }

    .featured-glass-badge {
      position: absolute;
      top: 20px;
      left: 20px;
      background: rgba(15, 23, 42, 0.75);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      color: #FBBF24;
      font-weight: 800;
      font-size: 12px;
      padding: 7px 16px;
      border-radius: 999px;
      border: 1px solid rgba(251, 191, 36, 0.35);
      display: flex;
      align-items: center;
      gap: 6px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.25);
    }

    .featured-content-box {
      padding: 40px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .category-kicker {
      font-size: 11px;
      font-weight: 800;
      text-transform: uppercase;
      letter-spacing: 1.5px;
      color: var(--primary);
      margin-bottom: 12px;
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .featured-title {
      font-size: clamp(22px, 3vw, 28px);
      font-weight: 800;
      line-height: 1.3;
      margin-bottom: 14px;
      color: var(--text-primary);
    }

    .featured-title a {
      color: inherit;
      text-decoration: none;
      transition: color 0.2s;
    }

    .featured-title a:hover {
      color: var(--primary);
    }

    .featured-excerpt {
      font-size: 14px;
      color: var(--text-secondary);
      line-height: 1.75;
      margin-bottom: 24px;
    }

    .author-meta-row {
      display: flex;
      align-items: center;
      gap: 14px;
      margin-bottom: 24px;
    }

    .author-avatar-sm {
      width: 42px;
      height: 42px;
      border-radius: 50%;
      background: var(--gradient-primary);
      color: white;
      font-weight: 800;
      font-size: 14px;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 4px 10px rgba(14, 165, 233, 0.25);
    }

    /* ==========================================================================
       STANDARD ARTICLE CARD
       ========================================================================== */
    .magazine-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 28px;
    }

    .mag-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      overflow: hidden;
      box-shadow: var(--shadow-sm);
      border: 1px solid var(--gray-200);
      display: flex;
      flex-direction: column;
      transition: transform 0.35s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.35s ease, border-color 0.2s;
      position: relative;
    }

    .mag-card:hover {
      transform: translateY(-6px);
      box-shadow: var(--shadow-xl);
      border-color: var(--primary-light, #38bdf8);
    }

    .mag-card-media {
      height: 230px;
      overflow: hidden;
      position: relative;
    }

    .mag-card-media img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .mag-card:hover .mag-card-media img {
      transform: scale(1.08);
    }

    .mag-card-tag {
      position: absolute;
      top: 14px;
      left: 14px;
      font-size: 11px;
      font-weight: 800;
      padding: 5px 12px;
      border-radius: 999px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.18);
    }

    .mag-bookmark-btn {
      position: absolute;
      top: 14px;
      right: 14px;
      width: 34px;
      height: 34px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      border: 1px solid rgba(255, 255, 255, 0.5);
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--text-secondary);
      cursor: pointer;
      transition: all 0.2s ease;
      box-shadow: 0 2px 8px rgba(0,0,0,0.12);
    }

    .mag-bookmark-btn:hover, .mag-bookmark-btn.bookmarked {
      background: #EF4444;
      color: white;
      border-color: #EF4444;
      transform: scale(1.1);
    }

    .mag-card-body {
      padding: 24px;
      flex: 1;
      display: flex;
      flex-direction: column;
    }

    .mag-card-title {
      font-size: 18px;
      font-weight: 800;
      line-height: 1.4;
      margin-bottom: 10px;
      color: var(--text-primary);
    }

    .mag-card-title a {
      color: inherit;
      text-decoration: none;
      transition: color 0.2s;
    }

    .mag-card-title a:hover {
      color: var(--primary);
    }

    .mag-card-text {
      font-size: 13.5px;
      color: var(--text-secondary);
      line-height: 1.65;
      margin-bottom: 16px;
      flex: 1;
    }

    .mag-tags-row {
      display: flex;
      gap: 6px;
      flex-wrap: wrap;
      margin-bottom: 16px;
    }

    .mag-tag-chip {
      font-size: 11px;
      font-weight: 700;
      color: var(--primary);
      background: var(--bg-secondary);
      padding: 3px 9px;
      border-radius: var(--radius-md);
      transition: all 0.2s;
      cursor: pointer;
    }

    .mag-tag-chip:hover {
      background: var(--gradient-primary);
      color: white;
    }

    .mag-card-footer {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding-top: 14px;
      border-top: 1px solid var(--gray-200);
      font-size: 12px;
      color: var(--text-muted);
    }

    .read-story-link {
      display: inline-flex;
      align-items: center;
      gap: 5px;
      font-size: 12.5px;
      font-weight: 800;
      color: var(--primary);
      text-decoration: none;
      transition: gap 0.2s;
    }

    .read-story-link:hover {
      gap: 9px;
    }

    /* ==========================================================================
       SIDEBAR & WIDGETS
       ========================================================================== */
    .mag-sidebar {
      display: flex;
      flex-direction: column;
      gap: 26px;
    }

    .sidebar-widget-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 26px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
    }

    .sidebar-heading {
      font-size: 16px;
      font-weight: 800;
      color: var(--text-primary);
      margin-bottom: 18px;
      position: relative;
      padding-bottom: 10px;
    }

    .sidebar-heading::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 36px;
      height: 3px;
      background: var(--gradient-primary);
      border-radius: 999px;
    }

    .trending-story-row {
      display: flex;
      gap: 14px;
      align-items: center;
      padding: 12px 0;
      border-bottom: 1px solid var(--gray-200);
      text-decoration: none;
      color: inherit;
      transition: transform 0.2s ease;
    }

    .trending-story-row:last-child {
      border-bottom: none;
      padding-bottom: 0;
    }

    .trending-story-row:hover {
      transform: translateX(4px);
    }

    .trending-rank-num {
      font-size: 20px;
      font-weight: 900;
      color: var(--gray-300);
      font-style: italic;
      width: 24px;
      flex-shrink: 0;
    }

    .trending-thumb-img {
      width: 60px;
      height: 60px;
      border-radius: var(--radius-md);
      object-fit: cover;
      flex-shrink: 0;
    }

    .topic-cloud-wrapper {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
    }

    .topic-tag-pill {
      font-size: 12px;
      font-weight: 700;
      padding: 6px 13px;
      border-radius: var(--radius-full);
      background: var(--bg-secondary);
      color: var(--text-secondary);
      border: 1px solid var(--gray-200);
      cursor: pointer;
      transition: all 0.2s;
    }

    .topic-tag-pill:hover {
      background: var(--primary);
      color: white;
      border-color: var(--primary);
      transform: translateY(-2px);
    }

    .author-spotlight-card {
      background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
      color: white;
      border-radius: var(--radius-xl);
      padding: 24px;
      border: 1px solid rgba(255, 255, 255, 0.1);
      box-shadow: var(--shadow-md);
    }

    .vip-newsletter-card {
      background: linear-gradient(135deg, #042f2e 0%, #0f172a 100%);
      color: white;
      border-radius: var(--radius-xl);
      padding: 28px 24px;
      border: 1px solid rgba(20, 184, 166, 0.3);
      box-shadow: var(--shadow-lg);
    }

    @media (max-width: 992px) {
      .featured-editorial-card { grid-template-columns: 1fr; }
      .featured-media-box { height: 260px; }
      .magazine-grid { grid-template-columns: 1fr; }
      .blog-layout-grid { grid-template-columns: 1fr !important; }
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- =========================================================================
         1. HERO HEADER SECTION
         ========================================================================= -->
    <section class="blog-hero">
      <div class="container">
        
        <!-- Breadcrumbs -->
        <div class="breadcrumb flex-center mb-16" style="justify-content:center;">
          <a href="/Pages/index.aspx" class="breadcrumb-item" style="color:rgba(255,255,255,0.75);">Home</a>
          <span class="breadcrumb-sep" style="color:rgba(255,255,255,0.4);">/</span>
          <span class="breadcrumb-item active" style="color:white; font-weight:700;">Travel Journal</span>
        </div>

        <!-- Issue Pill -->
        <div class="hero-badge-pill">
          <span class="pulse-dot"></span>
          <span>Epic Journal • 2025 Editions</span>
        </div>

        <!-- Main Title -->
        <h1 class="section-title" style="color:white; font-size:clamp(34px, 5.5vw, 56px); margin-bottom:16px; font-weight:900; letter-spacing:-0.5px;">
          India Travel <span style="color:var(--accent-light, #FBBF24);">Stories &amp; Chronicles</span>
        </h1>
        
        <p style="color:rgba(255,255,255,0.92); max-width:680px; margin:0 auto; font-size:16px; line-height:1.75;">
          Immerse in high-altitude motorcycle diaries, royal citadel chronicles, serene backwater food secrets, and pristine reef diving guides curated by local explorers.
        </p>

        <!-- Stats Bar -->
        <div class="blog-stats-bar">
          <div class="blog-stat-item">
            <i class="fa-solid fa-book-open" style="color:var(--accent-light);"></i>
            <span><strong>120+</strong> Curated Stories</span>
          </div>
          <div class="blog-stat-item">
            <i class="fa-solid fa-mountain-sun" style="color:#38BDF8;"></i>
            <span><strong>45+</strong> Indian Expeditions</span>
          </div>
          <div class="blog-stat-item">
            <i class="fa-solid fa-users" style="color:#4ADE80;"></i>
            <span><strong>25k+</strong> Monthly Readers</span>
          </div>
          <div class="blog-stat-item">
            <i class="fa-solid fa-award" style="color:#F472B6;"></i>
            <span><strong>100%</strong> Local Insider Verified</span>
          </div>
        </div>

      </div>
    </section>


    <!-- =========================================================================
         2. FILTER & SEARCH CONTROL BAR
         ========================================================================= -->
    <section class="section" style="padding-top:0; padding-bottom:32px;">
      <div class="container">
        
        <div class="blog-control-wrapper anim-fade-up">
          <div class="grid" style="grid-template-columns: 2fr 1fr 0.9fr; gap:16px; align-items:center;">
            
            <!-- Live Search Box -->
            <div class="search-input-wrapper">
              <i class="fa-solid fa-magnifying-glass search-icon"></i>
              <input type="text" id="blog-search-input" placeholder="Search by destination, topic (e.g. Ladakh, Forts, Scuba, Kerala)..." oninput="filterBlogArticles()">
              <button type="button" id="clear-search-btn" class="clear-search-btn" onclick="clearSearchInput()">
                <i class="fa-solid fa-xmark"></i>
              </button>
            </div>

            <!-- Sort By Dropdown -->
            <div>
              <select id="blog-sort-select" class="form-control" onchange="sortBlogArticles()" style="height:48px; border-radius:var(--radius-xl); font-size:13.5px; font-weight:600; cursor:pointer;">
                <option value="latest">⚡ Sort: Latest Stories</option>
                <option value="read-short">⏱️ Shortest Read First</option>
                <option value="read-long">📖 Long Read / Detailed</option>
              </select>
            </div>

            <!-- Results Count & Reset Action -->
            <div class="flex-between" style="gap:10px;">
              <span id="article-count-label" style="font-size:13px; font-weight:800; color:var(--text-primary); white-space:nowrap;">
                Showing 8 Stories
              </span>
              <button type="button" class="btn btn-secondary btn-sm" onclick="resetBlogFilters()" style="border-radius:var(--radius-full); padding:7px 14px; font-size:12px;">
                <i class="fa-solid fa-rotate-left"></i> Reset
              </button>
            </div>

          </div>
        </div>

        <!-- Quick Region & Theme Filter Pills -->
        <div class="flex-center gap-10 flex-wrap mt-24 mb-28" id="blog-pills">
          <button type="button" class="blog-pill active" onclick="selectBlogPill(this, 'all')">
            🌟 All Guides <span class="pill-count">8</span>
          </button>
          <button type="button" class="blog-pill" onclick="selectBlogPill(this, 'himalayas')">
            🏔️ Himalayas &amp; Snow <span class="pill-count">3</span>
          </button>
          <button type="button" class="blog-pill" onclick="selectBlogPill(this, 'kerala')">
            🌿 Kerala &amp; Backwaters <span class="pill-count">1</span>
          </button>
          <button type="button" class="blog-pill" onclick="selectBlogPill(this, 'rajasthan')">
            👑 Rajasthan &amp; Forts <span class="pill-count">2</span>
          </button>
          <button type="button" class="blog-pill" onclick="selectBlogPill(this, 'goa')">
            🏖️ Goa &amp; Coastal <span class="pill-count">1</span>
          </button>
          <button type="button" class="blog-pill" onclick="selectBlogPill(this, 'varanasi')">
            🛕 Spiritual Varanasi <span class="pill-count">1</span>
          </button>
          <button type="button" class="blog-pill" onclick="selectBlogPill(this, 'andaman')">
            🏝️ Andaman &amp; Scuba <span class="pill-count">1</span>
          </button>
        </div>

      </div>
    </section>


    <!-- =========================================================================
         3. MAIN CONTENT: EDITORIAL MASTERPIECE + GRID + SIDEBAR
         ========================================================================= -->
    <section class="section" style="padding-top:0; padding-bottom:90px;">
      <div class="container">

        <!-- Featured Editorial Masterpiece -->
        <div class="featured-editorial-card mb-48 anim-fade-up" id="featured-article-card" data-category="himalayas" data-title="the ultimate ladakh biking expedition guide 2025 leh khardung la pangong tso motorcycling" data-readtime="8">
          <div class="featured-media-box">
            <img src="../Content/images/img_15.jpg" alt="Ladakh Roadtrip Bike Expedition">
            <div class="featured-glass-badge">
              <i class="fa-solid fa-crown"></i> Story of the Month
            </div>
          </div>
          <div class="featured-content-box">
            <div class="category-kicker">
              <i class="fa-solid fa-motorcycle"></i> Himalayan High Altitude Guide
            </div>
            <h2 class="featured-title">
              <a href="/Pages/blog-details.aspx?id=ladakh-biking-guide">The Ultimate Ladakh Biking Expedition Guide 2025</a>
            </h2>
            <p class="featured-excerpt">
              Conquer Khardung La, Chang La, and Pangong Tso on a Royal Enfield Himalayan. Crucial inner line permit tips, altitude acclimatization protocols, packing essentials, and mechanic backup van strategies.
            </p>
            
            <div class="author-meta-row">
              <div class="author-avatar-sm">KS</div>
              <div>
                <strong style="display:block; font-size:14px; color:var(--text-primary);">Kabir Sharma</strong>
                <span style="font-size:12px; color:var(--text-muted);"><i class="fa-regular fa-calendar" style="margin-right:4px;"></i>Jan 15, 2025 • <i class="fa-regular fa-clock" style="margin-right:4px;"></i>8 min read</span>
              </div>
            </div>

            <div class="flex-between">
              <a href="/Pages/blog-details.aspx?id=ladakh-biking-guide" class="btn btn-primary btn-sm" style="border-radius:var(--radius-full); padding:10px 22px;">
                Read Full Story <i class="fa-solid fa-arrow-right" style="margin-left:6px;"></i>
              </a>
              <button type="button" class="btn btn-glass btn-sm" onclick="toggleBookmark(this, 'The Ultimate Ladakh Biking Expedition Guide')" style="border-radius:var(--radius-full); padding:8px 14px; font-size:12px;">
                <i class="fa-regular fa-bookmark"></i> Save
              </button>
            </div>
          </div>
        </div>

        <!-- Layout Grid: 2 Columns (Magazine Articles + Sidebar) -->
        <div class="grid blog-layout-grid" style="grid-template-columns: 2.3fr 1fr; gap:40px; align-items:start;">

          <!-- Articles Stream Column -->
          <div>
            
            <div class="magazine-grid stagger-children" id="blog-articles-grid">

              <!-- Article 1: Kerala -->
              <article class="mag-card anim-fade-up" data-category="kerala" data-title="kerala backwaters authentic houseboat ayurveda guide alleppey munnar" data-readtime="5" data-date="2025-01-10">
                <div class="mag-card-media">
                  <a href="/Pages/blog-details.aspx?id=kerala-backwaters-houseboat">
                    <img src="../Content/images/img_55.jpg" alt="Kerala backwaters houseboat cruise" loading="lazy">
                  </a>
                  <span class="badge badge-success mag-card-tag">🌿 Backwaters &amp; Spa</span>
                  <button type="button" class="mag-bookmark-btn" onclick="toggleBookmark(this, 'Kerala Backwaters: Authentic Houseboat Guide')" title="Save story">
                    <i class="fa-regular fa-bookmark"></i>
                  </button>
                </div>
                <div class="mag-card-body">
                  <h3 class="mag-card-title">
                    <a href="/Pages/blog-details.aspx?id=kerala-backwaters-houseboat">Kerala Backwaters: Authentic Houseboat &amp; Ayurveda Guide</a>
                  </h3>
                  <p class="mag-card-text">
                    Float through tranquil emerald waterways in Alleppey, feast on fresh Karimeen fish wrapped in banana leaves, and experience authentic Ayurvedic rejuvenation.
                  </p>
                  <div class="mag-tags-row">
                    <span class="mag-tag-chip" onclick="searchTag('Alleppey')">#Alleppey</span>
                    <span class="mag-tag-chip" onclick="searchTag('Ayurveda')">#Ayurveda</span>
                    <span class="mag-tag-chip" onclick="searchTag('Houseboat')">#Houseboat</span>
                  </div>
                  <div class="mag-card-footer">
                    <span><i class="fa-regular fa-calendar"></i> Jan 10, 2025</span>
                    <a href="/Pages/blog-details.aspx?id=kerala-backwaters-houseboat" class="read-story-link">
                      Read Story <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </article>

              <!-- Article 2: Rajasthan Forts -->
              <article class="mag-card anim-fade-up" data-category="rajasthan" data-title="10 majestic rajasthan forts royal heritage jaipur jodhpur jaisalmer amber mehrangarh" data-readtime="7" data-date="2025-01-04">
                <div class="mag-card-media">
                  <a href="/Pages/blog-details.aspx?id=rajasthan-forts">
                    <img src="../Content/images/img_48.jpg" alt="Rajasthan palaces and hill forts" loading="lazy">
                  </a>
                  <span class="badge badge-accent mag-card-tag">👑 Royal Heritage</span>
                  <button type="button" class="mag-bookmark-btn" onclick="toggleBookmark(this, '10 Majestic Rajasthan Forts')" title="Save story">
                    <i class="fa-regular fa-bookmark"></i>
                  </button>
                </div>
                <div class="mag-card-body">
                  <h3 class="mag-card-title">
                    <a href="/Pages/blog-details.aspx?id=rajasthan-forts">10 Majestic Rajasthan Forts That Transport You Back in Time</a>
                  </h3>
                  <p class="mag-card-text">
                    Stand atop the sun-drenched ramparts of Mehrangarh, mirror-palace Amber, and the golden living citadel of Jaisalmer — epic stories of Rajput chivalry.
                  </p>
                  <div class="mag-tags-row">
                    <span class="mag-tag-chip" onclick="searchTag('Jodhpur')">#Jodhpur</span>
                    <span class="mag-tag-chip" onclick="searchTag('AmberFort')">#AmberFort</span>
                    <span class="mag-tag-chip" onclick="searchTag('History')">#History</span>
                  </div>
                  <div class="mag-card-footer">
                    <span><i class="fa-regular fa-calendar"></i> Jan 04, 2025</span>
                    <a href="/Pages/blog-details.aspx?id=rajasthan-forts" class="read-story-link">
                      Read Story <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </article>

              <!-- Article 3: Goa Hidden Spots -->
              <article class="mag-card anim-fade-up" data-category="goa" data-title="beyond beaches hidden secret spots south goa spice trails cabo de rama fontainhas" data-readtime="6" data-date="2024-12-28">
                <div class="mag-card-media">
                  <a href="/Pages/blog-details.aspx?id=goa-hidden-spots">
                    <img src="../Content/images/img_21.jpg" alt="Goa secret beaches and heritage" loading="lazy">
                  </a>
                  <span class="badge badge-primary mag-card-tag">🏖️ Secret Coves</span>
                  <button type="button" class="mag-bookmark-btn" onclick="toggleBookmark(this, 'Hidden Secret Spots in South Goa')" title="Save story">
                    <i class="fa-regular fa-bookmark"></i>
                  </button>
                </div>
                <div class="mag-card-body">
                  <h3 class="mag-card-title">
                    <a href="/Pages/blog-details.aspx?id=goa-hidden-spots">Beyond Beaches: Hidden Secret Spots &amp; Spice Trails in South Goa</a>
                  </h3>
                  <p class="mag-card-text">
                    Venture beyond the crowded shacks to dramatic cliff ruins at Cabo de Rama, Latin quarters in Fontainhas, and dolphin-filled Butterfly Beach.
                  </p>
                  <div class="mag-tags-row">
                    <span class="mag-tag-chip" onclick="searchTag('SouthGoa')">#SouthGoa</span>
                    <span class="mag-tag-chip" onclick="searchTag('CaboDeRama')">#CaboDeRama</span>
                    <span class="mag-tag-chip" onclick="searchTag('Fontainhas')">#Fontainhas</span>
                  </div>
                  <div class="mag-card-footer">
                    <span><i class="fa-regular fa-calendar"></i> Dec 28, 2024</span>
                    <a href="/Pages/blog-details.aspx?id=goa-hidden-spots" class="read-story-link">
                      Read Story <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </article>

              <!-- Article 4: Varanasi Spiritual Dawn -->
              <article class="mag-card anim-fade-up" data-category="varanasi" data-title="a spiritual dawn in varanasi rowing boat ganga aarti ghats kashi sunrise" data-readtime="5" data-date="2024-12-18">
                <div class="mag-card-media">
                  <a href="/Pages/blog-details.aspx?id=varanasi-ganga-aarti">
                    <img src="../Content/images/img_41.jpg" alt="Varanasi Ganga Aarti ghats" loading="lazy">
                  </a>
                  <span class="badge badge-accent mag-card-tag">🛕 Spiritual India</span>
                  <button type="button" class="mag-bookmark-btn" onclick="toggleBookmark(this, 'A Spiritual Dawn in Varanasi')" title="Save story">
                    <i class="fa-regular fa-bookmark"></i>
                  </button>
                </div>
                <div class="mag-card-body">
                  <h3 class="mag-card-title">
                    <a href="/Pages/blog-details.aspx?id=varanasi-ganga-aarti">A Spiritual Dawn in Varanasi: Rowing Boat &amp; Evening Ganga Aarti</a>
                  </h3>
                  <p class="mag-card-text">
                    Witness divine sunrise mist lifting over sacred Ganges ghats as Sanskrit hymns chant and brass fire lamps illuminate the twilight at Dashashwamedh.
                  </p>
                  <div class="mag-tags-row">
                    <span class="mag-tag-chip" onclick="searchTag('Kashi')">#Kashi</span>
                    <span class="mag-tag-chip" onclick="searchTag('GangaAarti')">#GangaAarti</span>
                    <span class="mag-tag-chip" onclick="searchTag('Spiritual')">#Spiritual</span>
                  </div>
                  <div class="mag-card-footer">
                    <span><i class="fa-regular fa-calendar"></i> Dec 18, 2024</span>
                    <a href="/Pages/blog-details.aspx?id=varanasi-ganga-aarti" class="read-story-link">
                      Read Story <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </article>

              <!-- Article 5: Kashmir Winter Guide -->
              <article class="mag-card anim-fade-up" data-category="himalayas" data-title="kashmir in winter gulmarg gondola snow skiing dal lake shikara pahalgam" data-readtime="7" data-date="2024-12-05">
                <div class="mag-card-media">
                  <a href="/Pages/blog-details.aspx?id=kashmir-winter-guide">
                    <img src="../Content/images/img_13.jpg" alt="Kashmir winter snow and Dal Lake" loading="lazy">
                  </a>
                  <span class="badge badge-dark mag-card-tag">❄️ Snow &amp; Alps</span>
                  <button type="button" class="mag-bookmark-btn" onclick="toggleBookmark(this, 'Kashmir in Winter Guide')" title="Save story">
                    <i class="fa-regular fa-bookmark"></i>
                  </button>
                </div>
                <div class="mag-card-body">
                  <h3 class="mag-card-title">
                    <a href="/Pages/blog-details.aspx?id=kashmir-winter-guide">Kashmir in Winter: Gulmarg Gondola Snow &amp; Dal Lake Shikara Guide</a>
                  </h3>
                  <p class="mag-card-text">
                    Ski world-class powder at 13,780 ft on Apharwat Peak, sleep aboard heated cedarwood houseboats, and warm your hands with traditional earthen Kangris.
                  </p>
                  <div class="mag-tags-row">
                    <span class="mag-tag-chip" onclick="searchTag('Gulmarg')">#Gulmarg</span>
                    <span class="mag-tag-chip" onclick="searchTag('DalLake')">#DalLake</span>
                    <span class="mag-tag-chip" onclick="searchTag('Skiing')">#Skiing</span>
                  </div>
                  <div class="mag-card-footer">
                    <span><i class="fa-regular fa-calendar"></i> Dec 05, 2024</span>
                    <a href="/Pages/blog-details.aspx?id=kashmir-winter-guide" class="read-story-link">
                      Read Story <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </article>

              <!-- Article 6: Andaman Scuba -->
              <article class="mag-card anim-fade-up" data-category="andaman" data-title="andaman scuba diving havelock radhanagar neil coral reefs bioluminescence" data-readtime="6" data-date="2024-11-24">
                <div class="mag-card-media">
                  <a href="/Pages/blog-details.aspx?id=andaman-scuba-guide">
                    <img src="../Content/images/img_33.jpg" alt="Andaman coral islands and scuba diving" loading="lazy">
                  </a>
                  <span class="badge badge-primary mag-card-tag">🤿 Island Scuba</span>
                  <button type="button" class="mag-bookmark-btn" onclick="toggleBookmark(this, 'Andaman Scuba Diving Guide')" title="Save story">
                    <i class="fa-regular fa-bookmark"></i>
                  </button>
                </div>
                <div class="mag-card-body">
                  <h3 class="mag-card-title">
                    <a href="/Pages/blog-details.aspx?id=andaman-scuba-guide">Andaman Scuba Diving: Havelock Coral Reefs &amp; Night Kayaking</a>
                  </h3>
                  <p class="mag-card-text">
                    Dive alongside green sea turtles at Dixon's Pinnacle, kayak through starry mangrove lagoons glowing with blue bioluminescence, and unwind at Radhanagar.
                  </p>
                  <div class="mag-tags-row">
                    <span class="mag-tag-chip" onclick="searchTag('Havelock')">#Havelock</span>
                    <span class="mag-tag-chip" onclick="searchTag('ScubaDiving')">#ScubaDiving</span>
                    <span class="mag-tag-chip" onclick="searchTag('Bioluminescence')">#Bioluminescence</span>
                  </div>
                  <div class="mag-card-footer">
                    <span><i class="fa-regular fa-calendar"></i> Nov 24, 2024</span>
                    <a href="/Pages/blog-details.aspx?id=andaman-scuba-guide" class="read-story-link">
                      Read Story <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </article>

              <!-- Article 7: Golden Triangle -->
              <article class="mag-card anim-fade-up" data-category="rajasthan" data-title="golden triangle in 6 days sunrise taj mahal agra delhi jaipur secrets" data-readtime="6" data-date="2024-11-15">
                <div class="mag-card-media">
                  <a href="/Pages/blog-details.aspx?id=golden-triangle-guide">
                    <img src="../Content/images/img_32.jpg" alt="Taj Mahal Golden Triangle tour guide" loading="lazy">
                  </a>
                  <span class="badge badge-accent mag-card-tag">🏛️ World Heritage</span>
                  <button type="button" class="mag-bookmark-btn" onclick="toggleBookmark(this, 'Golden Triangle in 6 Days')" title="Save story">
                    <i class="fa-regular fa-bookmark"></i>
                  </button>
                </div>
                <div class="mag-card-body">
                  <h3 class="mag-card-title">
                    <a href="/Pages/blog-details.aspx?id=golden-triangle-guide">Golden Triangle in 6 Days: Sunrise Taj Mahal &amp; Pink City Secrets</a>
                  </h3>
                  <p class="mag-card-text">
                    Beat the crowds for magical sunrise rays at the Taj Mahal, taste legendary Chandni Chowk street kebabs, and uncover royal hidden courtyards in Jaipur.
                  </p>
                  <div class="mag-tags-row">
                    <span class="mag-tag-chip" onclick="searchTag('TajMahal')">#TajMahal</span>
                    <span class="mag-tag-chip" onclick="searchTag('Jaipur')">#Jaipur</span>
                    <span class="mag-tag-chip" onclick="searchTag('OldDelhi')">#OldDelhi</span>
                  </div>
                  <div class="mag-card-footer">
                    <span><i class="fa-regular fa-calendar"></i> Nov 15, 2024</span>
                    <a href="/Pages/blog-details.aspx?id=golden-triangle-guide" class="read-story-link">
                      Read Story <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </article>

              <!-- Article 8: Himachal / Manali -->
              <article class="mag-card anim-fade-up" data-category="himalayas" data-title="himachal mountain roadmap manali solang valley cedar treks atal tunnel" data-readtime="5" data-date="2024-11-02">
                <div class="mag-card-media">
                  <a href="/Pages/blog-details.aspx?id=himachal-mountain-guide">
                    <img src="../Content/images/img_43.jpg" alt="Himachal Pradesh pine valley" loading="lazy">
                  </a>
                  <span class="badge badge-secondary mag-card-tag">🌲 Pine Valley</span>
                  <button type="button" class="mag-bookmark-btn" onclick="toggleBookmark(this, 'Himachal Mountain Roadmap')" title="Save story">
                    <i class="fa-regular fa-bookmark"></i>
                  </button>
                </div>
                <div class="mag-card-body">
                  <h3 class="mag-card-title">
                    <a href="/Pages/blog-details.aspx?id=himachal-mountain-guide">Himachal Mountain Roadmap: Manali, Solang Valley &amp; Cedar Treks</a>
                  </h3>
                  <p class="mag-card-text">
                    Paraglide high above the Beas river, cruise through the engineering marvel of Atal Tunnel to frozen Sissu, and hike fragrant deodar pine trails in Old Manali.
                  </p>
                  <div class="mag-tags-row">
                    <span class="mag-tag-chip" onclick="searchTag('Manali')">#Manali</span>
                    <span class="mag-tag-chip" onclick="searchTag('SolangValley')">#SolangValley</span>
                    <span class="mag-tag-chip" onclick="searchTag('AtalTunnel')">#AtalTunnel</span>
                  </div>
                  <div class="mag-card-footer">
                    <span><i class="fa-regular fa-calendar"></i> Nov 02, 2024</span>
                    <a href="/Pages/blog-details.aspx?id=himachal-mountain-guide" class="read-story-link">
                      Read Story <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </article>

            </div>

            <!-- Empty Search State -->
            <div id="noBlogResultsCard" class="card text-center" style="display:none; padding:56px 24px; border:2px dashed var(--gray-300); margin-top:24px; border-radius:var(--radius-2xl);">
              <div style="font-size:52px; margin-bottom:12px;">🗺️</div>
              <h3 style="font-size:22px; font-weight:800; color:var(--text-primary); margin-bottom:8px;">No Travel Stories Found</h3>
              <p style="font-size:14px; color:var(--text-secondary); max-width:440px; margin:0 auto 24px;">
                We couldn't find stories matching your exact search keywords. Try exploring other tags or reset filters.
              </p>
              <button type="button" class="btn btn-primary" onclick="resetBlogFilters()" style="border-radius:var(--radius-full); padding:10px 24px;">
                <i class="fa-solid fa-rotate-left" style="margin-right:6px;"></i> Show All Stories
              </button>
            </div>

          </div>

          <!-- Sidebar Column -->
          <aside class="mag-sidebar">
            
            <!-- Widget 1: Trending Top Stories -->
            <div class="sidebar-widget-card">
              <h4 class="sidebar-heading">🔥 Trending Stories</h4>
              <div>
                <a href="/Pages/blog-details.aspx?id=ladakh-biking-guide" class="trending-story-row">
                  <span class="trending-rank-num">01</span>
                  <img src="../Content/images/img_15.jpg" alt="Ladakh biking" class="trending-thumb-img">
                  <div>
                    <div style="font-size:13px; font-weight:800; line-height:1.35; margin-bottom:4px; color:var(--text-primary);">
                      The Ultimate Ladakh Biking Guide
                    </div>
                    <small style="color:var(--text-muted); font-size:11px;"><i class="fa-regular fa-clock"></i> 8 min read</small>
                  </div>
                </a>

                <a href="/Pages/blog-details.aspx?id=kerala-backwaters-houseboat" class="trending-story-row">
                  <span class="trending-rank-num">02</span>
                  <img src="../Content/images/img_55.jpg" alt="Kerala backwaters" class="trending-thumb-img">
                  <div>
                    <div style="font-size:13px; font-weight:800; line-height:1.35; margin-bottom:4px; color:var(--text-primary);">
                      Kerala Backwaters Houseboat Guide
                    </div>
                    <small style="color:var(--text-muted); font-size:11px;"><i class="fa-regular fa-clock"></i> 5 min read</small>
                  </div>
                </a>

                <a href="/Pages/blog-details.aspx?id=rajasthan-forts" class="trending-story-row">
                  <span class="trending-rank-num">03</span>
                  <img src="../Content/images/img_48.jpg" alt="Rajasthan forts" class="trending-thumb-img">
                  <div>
                    <div style="font-size:13px; font-weight:800; line-height:1.35; margin-bottom:4px; color:var(--text-primary);">
                      10 Majestic Rajasthan Forts to Visit
                    </div>
                    <small style="color:var(--text-muted); font-size:11px;"><i class="fa-regular fa-clock"></i> 7 min read</small>
                  </div>
                </a>

                <a href="/Pages/blog-details.aspx?id=andaman-scuba-guide" class="trending-story-row">
                  <span class="trending-rank-num">04</span>
                  <img src="../Content/images/img_33.jpg" alt="Andaman scuba" class="trending-thumb-img">
                  <div>
                    <div style="font-size:13px; font-weight:800; line-height:1.35; margin-bottom:4px; color:var(--text-primary);">
                      Andaman Scuba &amp; Night Bioluminescence
                    </div>
                    <small style="color:var(--text-muted); font-size:11px;"><i class="fa-regular fa-clock"></i> 6 min read</small>
                  </div>
                </a>
              </div>
            </div>

            <!-- Widget 2: Popular Topic Tags -->
            <div class="sidebar-widget-card">
              <h4 class="sidebar-heading">🏷️ Explore by Tags</h4>
              <div class="topic-cloud-wrapper">
                <span class="topic-tag-pill" onclick="searchTag('Himalayas')">🏔️ #Himalayas</span>
                <span class="topic-tag-pill" onclick="searchTag('Houseboat')">🌿 #Houseboat</span>
                <span class="topic-tag-pill" onclick="searchTag('AmberFort')">👑 #AmberFort</span>
                <span class="topic-tag-pill" onclick="searchTag('ScubaDiving')">🤿 #ScubaDiving</span>
                <span class="topic-tag-pill" onclick="searchTag('GangaAarti')">🛕 #GangaAarti</span>
                <span class="topic-tag-pill" onclick="searchTag('Skiing')">❄️ #Skiing</span>
                <span class="topic-tag-pill" onclick="searchTag('SouthGoa')">🏖️ #SouthGoa</span>
                <span class="topic-tag-pill" onclick="searchTag('TajMahal')">🏛️ #TajMahal</span>
                <span class="topic-tag-pill" onclick="searchTag('AtalTunnel')">🌲 #AtalTunnel</span>
                <span class="topic-tag-pill" onclick="searchTag('Ayurveda')">💆 #Ayurveda</span>
              </div>
            </div>

            <!-- Widget 3: Author Spotlight -->
            <div class="author-spotlight-card">
              <span class="badge" style="background:rgba(255,255,255,0.15); color:#FBBF24; font-size:11px; margin-bottom:12px;">🌟 Explorer of the Month</span>
              <div class="flex-start gap-14 mb-14" style="align-items:center;">
                <div style="width:52px; height:52px; border-radius:50%; background:var(--gradient-primary); display:flex; align-items:center; justify-content:center; font-weight:800; font-size:18px; color:white; flex-shrink:0;">
                  KS
                </div>
                <div>
                  <strong style="font-size:16px; color:white; display:block;">Kabir Sharma</strong>
                  <small style="color:#2DD4BF;">Lead Himalayan Expeditionist</small>
                </div>
              </div>
              <p style="font-size:12.5px; color:rgba(255,255,255,0.8); line-height:1.6; margin-bottom:14px;">
                Kabir has completed 45+ high-altitude passes across Ladakh, Zanskar, and Spiti Valley.
              </p>
              <button type="button" class="btn btn-glass btn-sm" onclick="searchTag('Kabir')" style="width:100%; border-radius:var(--radius-full); font-size:12px;">
                Read Kabir's Guides <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </button>
            </div>

            <!-- Widget 4: VIP Newsletter Digest -->
            <div class="vip-newsletter-card">
              <div style="font-size:24px; margin-bottom:8px;">📬</div>
              <h4 style="font-size:18px; font-weight:800; margin-bottom:6px; color:white;">India Travel Insider</h4>
              <p style="font-size:12.5px; color:rgba(255,255,255,0.85); line-height:1.6; margin-bottom:16px;">
                Receive exclusive secret route maps, seasonal booking discounts, and monthly curated itineraries.
              </p>
              <div class="form-group mb-10">
                <input type="email" id="sidebar-vip-email" placeholder="Your best email..." class="form-control" style="background:rgba(255,255,255,0.1); border-color:rgba(255,255,255,0.25); color:white; font-size:13px; border-radius:var(--radius-lg);">
              </div>
              <button type="button" onclick="subscribeVipNewsletter()" class="btn btn-accent btn-sm" style="width:100%; border-radius:var(--radius-lg); font-weight:800;">
                Join 25,000+ Travelers <i class="fa-solid fa-paper-plane" style="margin-left:4px;"></i>
              </button>
            </div>

            <!-- Widget 5: Custom Itinerary Concierge -->
            <div class="sidebar-widget-card" style="background:var(--bg-secondary); text-align:center; padding:28px 20px;">
              <div style="font-size:32px; margin-bottom:8px;">✨</div>
              <h4 style="font-size:16px; font-weight:800; margin-bottom:6px; color:var(--text-primary);">Planning a Custom Trip?</h4>
              <p style="font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:16px;">
                Our destination architects will craft a personalized itinerary for your family or group within 30 minutes.
              </p>
              <a href="/Pages/contact.aspx" class="btn btn-primary btn-sm mb-10" style="width:100%; border-radius:var(--radius-full);">
                Request Tailored Itinerary
              </a>
              <div style="font-size:12px; color:var(--text-muted);">
                <i class="fa-solid fa-phone" style="color:var(--primary); margin-right:4px;"></i> Or Call <a href="tel:+919099107637" style="color:var(--primary); font-weight:700;">+91 90991 07637</a>
              </div>
            </div>

          </aside>

        </div>

      </div>
    </section>

  <!-- =========================================================================
       4. CLIENT-SIDE CONTROLLERS & SCRIPTS
       ========================================================================= -->
  <script>
    let activeCategory = 'all';

    function filterBlogArticles() {
      const searchInput = document.getElementById('blog-search-input');
      const search = (searchInput?.value || '').toLowerCase().trim();
      const clearBtn = document.getElementById('clear-search-btn');
      
      if (clearBtn) clearBtn.style.display = search ? 'block' : 'none';

      const articles = Array.from(document.querySelectorAll('#blog-articles-grid .mag-card'));
      const featured = document.getElementById('featured-article-card');

      let visibleCount = 0;

      // Filter featured card
      if (featured) {
        const featCat = featured.dataset.category || '';
        const featTitle = (featured.dataset.title || '').toLowerCase();
        let featMatch = true;
        if (activeCategory !== 'all' && featCat !== activeCategory) featMatch = false;
        if (search && !featTitle.includes(search)) featMatch = false;
        featured.style.display = featMatch ? 'grid' : 'none';
        if (featMatch) visibleCount++;
      }

      // Filter grid cards
      articles.forEach(card => {
        const cat = card.dataset.category || '';
        const title = (card.dataset.title || '').toLowerCase();
        let match = true;

        if (activeCategory !== 'all' && cat !== activeCategory) match = false;
        if (search && !title.includes(search)) match = false;

        card.style.display = match ? 'flex' : 'none';
        if (match) visibleCount++;
      });

      // Update count label
      const countLabel = document.getElementById('article-count-label');
      if (countLabel) countLabel.innerText = `Showing ${visibleCount} Stories`;

      // Show/hide empty state
      const noResults = document.getElementById('noBlogResultsCard');
      if (noResults) noResults.style.display = visibleCount === 0 ? 'block' : 'none';
    }

    function selectBlogPill(btn, cat) {
      document.querySelectorAll('#blog-pills .blog-pill').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      activeCategory = cat;
      filterBlogArticles();
    }

    function searchTag(tagName) {
      const input = document.getElementById('blog-search-input');
      if (input) {
        input.value = tagName;
        activeCategory = 'all';
        document.querySelectorAll('#blog-pills .blog-pill').forEach(b => b.classList.remove('active'));
        const firstPill = document.querySelector('#blog-pills .blog-pill');
        if (firstPill) firstPill.classList.add('active');
        filterBlogArticles();
        window.scrollTo({ top: 350, behavior: 'smooth' });
      }
    }

    function clearSearchInput() {
      const input = document.getElementById('blog-search-input');
      if (input) {
        input.value = '';
        filterBlogArticles();
        input.focus();
      }
    }

    function resetBlogFilters() {
      const input = document.getElementById('blog-search-input');
      if (input) input.value = '';
      activeCategory = 'all';
      document.querySelectorAll('#blog-pills .blog-pill').forEach(b => b.classList.remove('active'));
      const firstPill = document.querySelector('#blog-pills .blog-pill');
      if (firstPill) firstPill.classList.add('active');
      const sortSelect = document.getElementById('blog-sort-select');
      if (sortSelect) sortSelect.value = 'latest';
      filterBlogArticles();
      if (window.Toast) Toast.show('All magazine filters reset', 'info');
    }

    function sortBlogArticles() {
      const sortVal = document.getElementById('blog-sort-select')?.value;
      const grid = document.getElementById('blog-articles-grid');
      if (!grid) return;

      const articles = Array.from(grid.querySelectorAll('.mag-card'));
      
      articles.sort((a, b) => {
        if (sortVal === 'read-short') {
          return parseInt(a.dataset.readtime || '0') - parseInt(b.dataset.readtime || '0');
        } else if (sortVal === 'read-long') {
          return parseInt(b.dataset.readtime || '0') - parseInt(a.dataset.readtime || '0');
        } else {
          // latest by date
          return new Date(b.dataset.date || '2024-01-01') - new Date(a.dataset.date || '2024-01-01');
        }
      });

      articles.forEach(card => grid.appendChild(card));
    }

    function toggleBookmark(btn, storyTitle) {
      btn.classList.toggle('bookmarked');
      const isSaved = btn.classList.contains('bookmarked');
      const icon = btn.querySelector('i');
      if (icon) {
        icon.className = isSaved ? 'fa-solid fa-bookmark' : 'fa-regular fa-bookmark';
      }
      if (window.Toast) {
        Toast.show(isSaved ? `🔖 "${storyTitle}" saved to bookmarks!` : `Removed from bookmarks`, isSaved ? 'success' : 'info');
      }
    }

    function subscribeVipNewsletter() {
      const email = document.getElementById('sidebar-vip-email')?.value?.trim();
      if (!email || !email.includes('@')) {
        if (window.Toast) Toast.show('Please enter a valid email address', 'error');
        return;
      }
      document.getElementById('sidebar-vip-email').value = '';
      if (window.Toast) Toast.show('🎉 Welcome to India Travel Insider VIP Dispatch!', 'success');
    }

    // Read URL query parameters on load
    document.addEventListener('DOMContentLoaded', () => {
      const params = new URLSearchParams(window.location.search);
      const topic = params.get('topic') || params.get('cat');
      const search = params.get('search') || params.get('q');

      if (topic) {
        const pill = Array.from(document.querySelectorAll('#blog-pills .blog-pill')).find(p => p.getAttribute('onclick')?.includes(`'${topic}'`));
        if (pill) selectBlogPill(pill, topic);
      }
      if (search) {
        const input = document.getElementById('blog-search-input');
        if (input) {
          input.value = search;
          filterBlogArticles();
        }
      }
    });
  </script>
</asp:Content>
