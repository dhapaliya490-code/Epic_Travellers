<%@ Page Title="Destinations – Epic-Travellers | Explore Incredible India" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="destinations.aspx.cs" Inherits="Epic_Travelers.Pages.destinations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Explore top travel destinations across India with Epic-Travellers. Filter by region, budget, duration, and climate for Goa, Kerala, Rajasthan, Ladakh, Kashmir, Manali, Andaman, and more.">
  <meta name="keywords" content="Indian destinations, travel India, Goa beaches, Kerala backwaters, Rajasthan palaces, Ladakh passes, Kashmir valley, Manali hill station, Andaman islands, Varanasi">
  <meta name="author" content="Epic-Travellers">
  <meta property="og:title" content="Destinations – Epic-Travellers India">
  <meta property="og:description" content="Discover curated Indian travel destinations with real-time weather, budget filters, and custom tour packages.">

  <style>
    .page-hero {
      background: linear-gradient(135deg, rgba(15,23,42,0.85) 0%, rgba(20,184,166,0.7) 100%),
                  url('../Content/images/img_23.jpg') center/cover no-repeat;
      padding: 150px 0 90px;
      color: white;
      text-align: center;
      position: relative;
    }

    .dest-filter-card {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      padding: 28px;
      box-shadow: 0 20px 40px -15px rgba(0,0,0,0.12);
      border: 1px solid var(--gray-200);
      margin-top: -55px;
      position: relative;
      z-index: 10;
    }

    .region-pill {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 10px 22px;
      border-radius: var(--radius-full);
      background: var(--bg-primary);
      color: var(--text-secondary);
      font-weight: 700;
      font-size: 13px;
      cursor: pointer;
      border: 1px solid var(--gray-300);
      transition: all 0.2s ease;
      box-shadow: var(--shadow-sm);
    }

    .region-pill:hover, .region-pill.active {
      background: var(--gradient-primary);
      color: white;
      border-color: transparent;
      box-shadow: 0 4px 14px rgba(14,165,233,0.35);
      transform: translateY(-2px);
    }

    .destinations-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(360px, 1fr));
      gap: 32px;
    }

    .destination-full-card {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      overflow: hidden;
      box-shadow: var(--shadow-sm);
      border: 1px solid var(--gray-200);
      transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.3s ease, border-color 0.2s;
      display: flex;
      flex-direction: column;
    }

    .destination-full-card:hover {
      transform: translateY(-6px);
      box-shadow: var(--shadow-xl);
      border-color: var(--primary);
    }

    .dest-card-img {
      position: relative;
      height: 230px;
      overflow: hidden;
    }

    .dest-card-img img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.6s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .destination-full-card:hover .dest-card-img img {
      transform: scale(1.08);
    }

    .dest-badges-top {
      position: absolute;
      top: 14px;
      left: 14px;
      display: flex;
      flex-direction: column;
      gap: 6px;
      z-index: 2;
    }

    .dest-wishlist-btn {
      position: absolute;
      top: 14px;
      right: 14px;
      width: 38px;
      height: 38px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(4px);
      border: none;
      color: var(--gray-600);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 16px;
      cursor: pointer;
      transition: all 0.2s ease;
      z-index: 2;
      box-shadow: 0 4px 10px rgba(0,0,0,0.15);
    }

    .dest-wishlist-btn:hover {
      background: white;
      color: #ef4444;
      transform: scale(1.1);
    }

    .dest-wishlist-btn.active {
      background: #ef4444;
      color: white;
    }

    .dest-card-body {
      padding: 24px;
      flex: 1;
      display: flex;
      flex-direction: column;
    }

    .weather-badge {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      background: linear-gradient(135deg, rgba(14,165,233,0.15) 0%, rgba(2,132,199,0.2) 100%);
      color: var(--primary);
      border: 1px solid rgba(14,165,233,0.3);
      padding: 4px 12px;
      border-radius: var(--radius-full);
      font-size: 12px;
      font-weight: 700;
    }

    .dest-info-row {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 12px;
      color: var(--text-secondary);
      margin: 10px 0 16px;
      flex-wrap: wrap;
    }

    .dest-info-item {
      display: flex;
      align-items: center;
      gap: 6px;
      background: var(--bg-secondary);
      padding: 4px 10px;
      border-radius: var(--radius-sm);
      border: 1px solid var(--gray-200);
      font-weight: 600;
    }

    .dest-footer {
      padding: 16px 24px;
      background: var(--bg-secondary);
      border-top: 1px solid var(--gray-200);
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
    }

    .dest-price-val {
      font-size: 20px;
      font-weight: 800;
      color: var(--primary);
      line-height: 1.1;
    }

    /* Map Section */
    .map-container {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      padding: 24px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-lg);
      overflow: hidden;
    }

    .simulated-map {
      width: 100%;
      height: 480px;
      background: #0f172a;
      border-radius: var(--radius-xl);
      position: relative;
      overflow: hidden;
      background: url('../Content/images/img_22.jpg') center/cover no-repeat;
    }

    .simulated-map-overlay {
      position: absolute;
      inset: 0;
      background: radial-gradient(circle at center, rgba(15,23,42,0.4) 0%, rgba(11,19,41,0.85) 100%);
      backdrop-filter: blur(1px);
    }

    .map-pin {
      position: absolute;
      width: 38px;
      height: 38px;
      background: var(--gradient-primary);
      color: white;
      border-radius: 50% 50% 50% 0;
      transform: rotate(-45deg);
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      box-shadow: 0 6px 16px rgba(0,0,0,0.4);
      transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
      z-index: 10;
    }

    .map-pin i {
      transform: rotate(45deg);
      font-size: 14px;
    }

    .map-pin:hover {
      transform: rotate(-45deg) scale(1.25);
      background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
      z-index: 30;
    }

    .map-pin-tooltip {
      position: absolute;
      bottom: 48px;
      left: 50%;
      transform: translateX(-50%) rotate(45deg);
      background: white;
      color: var(--text-primary);
      padding: 6px 14px;
      border-radius: var(--radius-md);
      font-size: 12px;
      font-weight: 800;
      white-space: nowrap;
      box-shadow: 0 10px 25px rgba(0,0,0,0.25);
      opacity: 0;
      pointer-events: none;
      transition: all 0.2s ease;
    }

    .map-pin:hover .map-pin-tooltip {
      opacity: 1;
      transform: translateX(-50%) rotate(45deg) translateY(-4px);
    }

    .region-guide-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 24px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .region-guide-card:hover {
      transform: translateY(-4px);
      box-shadow: var(--shadow-md);
    }

    @media (max-width: 768px) {
      .destinations-grid {
        grid-template-columns: 1fr;
      }
      .dest-filter-card {
        padding: 20px;
      }
      .simulated-map {
        height: 380px;
      }
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
          <span class="breadcrumb-item active" style="color:white;">Destinations</span>
        </div>
        
        <span class="badge" style="background:rgba(20,184,166,0.25); border:1px solid rgba(20,184,166,0.5); color:#2DD4BF; padding:6px 16px; font-size:12px; font-weight:700; border-radius:999px; margin-bottom:16px; display:inline-block;">
          🌏 500+ Curated Indian Travel Spots
        </span>

        <h1 class="section-title" style="color:white; font-size:clamp(32px, 5vw, 54px); margin-bottom:14px;">
          Explore Incredible <span style="color:var(--accent-light);">Indian Destinations</span>
        </h1>
        <p style="color:rgba(255,255,255,0.9); max-width:660px; margin:0 auto; font-size:16px; line-height:1.7;">
          Discover sun-soaked tropical beaches, snow-covered Himalayan valleys, royal desert palaces, and sacred rivers. Filter easily by region, budget, season, and style.
        </p>
      </div>
    </section>

    <!-- Filters Section -->
    <section class="section" style="padding-top:0; padding-bottom:32px;">
      <div class="container">
        
        <div class="dest-filter-card anim-fade-up">
          <div class="grid grid-4" style="gap:18px;">
            
            <!-- Filter 1: Search -->
            <div>
              <label class="form-label" for="filter-search"><i class="fa-solid fa-magnifying-glass" style="color:var(--primary); margin-right:4px;"></i> Search Destination</label>
              <input type="text" id="filter-search" class="form-control" placeholder="Search Goa, Jaipur, Kashmir..." oninput="applyDestFilters()">
            </div>

            <!-- Filter 2: Region -->
            <div>
              <label class="form-label" for="filter-region"><i class="fa-solid fa-map-location-dot" style="color:var(--primary); margin-right:4px;"></i> Region / Zone</label>
              <select id="filter-region" class="form-control filter-select" onchange="applyDestFilters()">
                <option value="all">All Regions (12 Spots)</option>
                <option value="north">North India (Himalayas &amp; Heritage)</option>
                <option value="south">South India (Kerala &amp; Karnataka)</option>
                <option value="west">West India (Goa &amp; Coastal)</option>
                <option value="east">East &amp; North-East (Sikkim &amp; Darjeeling)</option>
                <option value="islands">Islands (Andaman &amp; Nicobar)</option>
              </select>
            </div>

            <!-- Filter 3: Budget -->
            <div>
              <label class="form-label" for="filter-budget"><i class="fa-solid fa-indian-rupee-sign" style="color:var(--primary); margin-right:4px;"></i> Max Budget / Person</label>
              <select id="filter-budget" class="form-control filter-select" onchange="applyDestFilters()">
                <option value="all">Any Budget</option>
                <option value="10000">Under ₹10,000 (Pocket Friendly)</option>
                <option value="20000">Under ₹20,000 (Standard)</option>
                <option value="35000">Under ₹35,000 (Premium)</option>
                <option value="50000">Above ₹35,000 (Luxury Expeditions)</option>
              </select>
            </div>

            <!-- Filter 4: Best Season -->
            <div>
              <label class="form-label" for="filter-season"><i class="fa-solid fa-sun" style="color:var(--primary); margin-right:4px;"></i> Best Season</label>
              <select id="filter-season" class="form-control filter-select" onchange="applyDestFilters()">
                <option value="all">All Seasons</option>
                <option value="winter">Winter (Oct – Mar)</option>
                <option value="summer">Summer (Apr – Jun)</option>
                <option value="monsoon">Monsoon (Jul – Sep)</option>
              </select>
            </div>

          </div>

          <!-- Bottom Filter Status & Reset -->
          <div class="flex-between mt-18 pt-16" style="border-top:1px solid var(--gray-200); font-size:13px;">
            <div style="color:var(--text-secondary);">
              <span id="results-count" style="font-weight:800; color:var(--text-primary);">Showing 12</span> curated destinations
            </div>
            <button type="button" class="btn btn-secondary btn-sm" onclick="resetAllDestFilters()">
              <i class="fa-solid fa-rotate-left" style="margin-right:4px;"></i> Reset Filters
            </button>
          </div>
        </div>

        <!-- Quick Region Filter Pills -->
        <div class="flex-center gap-12 flex-wrap mt-32 mb-28" id="dest-pill-filters">
          <button type="button" class="region-pill active" onclick="selectRegionPill(this, 'all')">🌟 All India (12)</button>
          <button type="button" class="region-pill" onclick="selectRegionPill(this, 'north')">🏔️ North India</button>
          <button type="button" class="region-pill" onclick="selectRegionPill(this, 'south')">🌴 South India</button>
          <button type="button" class="region-pill" onclick="selectRegionPill(this, 'west')">🏖️ West Coast</button>
          <button type="button" class="region-pill" onclick="selectRegionPill(this, 'east')">🍵 East &amp; Himalayas</button>
          <button type="button" class="region-pill" onclick="selectRegionPill(this, 'islands')">🏝️ Coral Islands</button>
        </div>

      </div>
    </section>

    <!-- Destinations Grid -->
    <section class="section" style="padding-top:0; padding-bottom:80px;">
      <div class="container">
        
        <div class="flex-between mb-28 flex-wrap gap-16">
          <div>
            <h2 style="font-size:24px; font-weight:800; color:var(--text-primary);" id="grid-header-title">Curated Holiday Destinations</h2>
            <p style="font-size:14px; color:var(--text-secondary);">Handpicked spots with live weather, trip costs, and verified tours</p>
          </div>
          <div style="display:flex; gap:12px; align-items:center;">
            <label for="dest-sort-select" style="font-size:13px; color:var(--text-secondary); font-weight:700;">Sort By:</label>
            <select id="dest-sort-select" class="form-control filter-select" style="width:auto; padding:8px 16px; font-size:13px;" onchange="sortDestinations(this.value)">
              <option value="popular">Most Popular</option>
              <option value="rating">Highest Rated</option>
              <option value="price-low">Avg. Cost: Low to High</option>
              <option value="price-high">Avg. Cost: High to Low</option>
            </select>
          </div>
        </div>

        <div class="destinations-grid stagger-children" id="destinations-grid-container">

          <!-- Destination 1: Jaipur & Udaipur (Rajasthan) -->
          <article class="destination-full-card anim-fade-up" data-name="jaipur udaipur rajasthan thar desert jodhpur" data-region="north" data-price="45000" data-season="winter" data-rating="4.9" data-reviews="2400">
            <div class="dest-card-img">
              <img src="../Content/images/img_48.jpg" alt="Jaipur Pink City Rajasthan" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-accent" style="font-size:11px;">👑 Royal Heritage</span>
                <span class="badge badge-dark" style="font-size:10px;">⭐ Top Rated</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Jaipur & Udaipur (Rajasthan)', '₹45,000', '../Content/images/img_48.jpg', '/Pages/package-details.aspx?id=royal-rajasthan')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Jaipur &amp; Udaipur</h3>
                <span class="weather-badge">☀️ 26°C Sunny</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Rajasthan, North-West India
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                Discover opulent pink sandstone forts, sunset boat cruises on Lake Pichola, camel safaris across Thar dunes, and rich royal heritage.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: Oct – Mar</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 6–8 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.9 (2.4k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹45,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=royal-rajasthan" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 2: Goa Beaches -->
          <article class="destination-full-card anim-fade-up" data-name="goa beaches calangute baga panaji mandovi" data-region="west" data-price="18000" data-season="winter" data-rating="4.8" data-reviews="3800">
            <div class="dest-card-img">
              <img src="../Content/images/img_21.jpg" alt="Goa Beaches" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-primary" style="font-size:11px;">🏖️ Beach &amp; Cruise</span>
                <span class="badge badge-secondary" style="font-size:10px;">🍹 Tropical</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'North & South Goa', '₹18,000', '../Content/images/img_21.jpg', '/Pages/package-details.aspx?id=goa-beach')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">North &amp; South Goa</h3>
                <span class="weather-badge">🌤️ 29°C Tropical</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Goa, West Coast India
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                Golden sun-kissed beaches, Portuguese colonial architecture, Mandovi river luxury sunset cruises, vibrant nightlife, and thrilling water sports.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: Nov – Feb</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 4–6 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.8 (3.8k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹18,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=goa-beach" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 3: Munnar & Alleppey (Kerala) -->
          <article class="destination-full-card anim-fade-up" data-name="kerala munnar alleppey backwaters tea kochi" data-region="south" data-price="36000" data-season="winter" data-rating="4.9" data-reviews="3100">
            <div class="dest-card-img">
              <img src="../Content/images/img_55.jpg" alt="Kerala Backwaters" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-secondary" style="font-size:11px;">💑 Honeymoon Bliss</span>
                <span class="badge badge-success" style="font-size:10px;">🌿 Nature Retreat</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Munnar & Alleppey (Kerala)', '₹36,000', '../Content/images/img_55.jpg', '/Pages/package-details.aspx?id=kerala')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Munnar &amp; Alleppey</h3>
                <span class="weather-badge">🌧️ 22°C Pleasant</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Kerala, South India
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                Tranquil private houseboat cruises along palm-fringed lagoons, rolling emerald tea gardens of Munnar, and authentic Ayurvedic wellness therapies.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: Sep – Mar</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 5–8 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.9 (3.1k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹36,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=kerala" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 4: Leh & Ladakh -->
          <article class="destination-full-card anim-fade-up" data-name="leh ladakh pangong khardung la nubra himalayas" data-region="north" data-price="32000" data-season="summer" data-rating="4.9" data-reviews="2100">
            <div class="dest-card-img">
              <img src="../Content/images/img_14.jpg" alt="Leh Ladakh" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-dark" style="font-size:11px;">🏔️ High Altitude</span>
                <span class="badge badge-danger" style="font-size:10px;">🏍️ Bike Adventure</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Leh & Pangong Lake (Ladakh)', '₹32,000', '../Content/images/img_14.jpg', '/Pages/package-details.aspx?id=ladakh-adventure')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Leh &amp; Pangong Lake</h3>
                <span class="weather-badge">❄️ 14°C Crisp</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Ladakh UT, Far North India
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                Dramatic cold desert mountains, Khardung La pass, centuries-old Buddhist monasteries, and shimmering color-changing Pangong Lake camps.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: May – Sep</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 7–10 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.9 (2.1k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹32,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=ladakh-adventure" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 5: Kashmir (Srinagar & Gulmarg) -->
          <article class="destination-full-card anim-fade-up" data-name="kashmir srinagar gulmarg pahalgam dal lake snow" data-region="north" data-price="38000" data-season="winter" data-rating="5.0" data-reviews="4100">
            <div class="dest-card-img">
              <img src="../Content/images/img_13.jpg" alt="Kashmir Dal Lake" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-accent" style="font-size:11px;">👑 Crown of India</span>
                <span class="badge badge-success" style="font-size:10px;">⭐ 5.0 Star</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Srinagar & Gulmarg (Kashmir)', '₹38,000', '../Content/images/img_13.jpg', '/Pages/package-details.aspx?id=kashmir-paradise')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Srinagar &amp; Gulmarg</h3>
                <span class="weather-badge">❄️ 8°C Alpine</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Jammu &amp; Kashmir, North India
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                Gliding on luxury Dal Lake Shikaras, riding the Gulmarg Gondola over snow peaks, walking through saffron fields, and Betaab Valley streams.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: All Year</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 6–8 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 5.0 (4.1k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹38,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=kashmir-paradise" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 6: Andaman Islands -->
          <article class="destination-full-card anim-fade-up" data-name="andaman havelock port blair neil coral islands scuba" data-region="islands" data-price="42000" data-season="winter" data-rating="4.9" data-reviews="1950">
            <div class="dest-card-img">
              <img src="../Content/images/img_33.jpg" alt="Andaman Islands" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-accent" style="font-size:11px;">🏝️ Island Luxury</span>
                <span class="badge badge-success" style="font-size:10px;">🤿 Scuba &amp; Coral</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Andaman & Nicobar Islands', '₹42,000', '../Content/images/img_33.jpg', '/Pages/package-details.aspx?id=andaman')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Andaman &amp; Nicobar</h3>
                <span class="weather-badge">🌤️ 28°C Tropical</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Bay of Bengal, Islands
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                White sands of Radhanagar beach, rich coral reef scuba diving at Elephant Beach, catamaran cruises, and historic Cellular Jail sound show.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: Oct – May</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 6–8 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.9 (1.9k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹42,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=andaman" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 7: Manali & Solang Valley (Himachal) -->
          <article class="destination-full-card anim-fade-up" data-name="manali solang valley shimla himachal snow rohtang" data-region="north" data-price="24000" data-season="summer" data-rating="4.8" data-reviews="2900">
            <div class="dest-card-img">
              <img src="../Content/images/img_43.jpg" alt="Manali Himachal" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-secondary" style="font-size:11px;">❄️ Snow &amp; Hills</span>
                <span class="badge badge-dark" style="font-size:10px;">🌲 Pine Valley</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Manali & Solang Valley', '₹24,000', '../Content/images/img_43.jpg', '/Pages/package-details.aspx?id=manali-shimla')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Manali &amp; Solang Valley</h3>
                <span class="weather-badge">❄️ 12°C Cool</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Himachal Pradesh, North India
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                Snowcapped Himalayan crests, skiing and paragliding at Solang Valley, Rohtang Pass excursions, and strolls through fragrant pine woodlands.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: Mar–Jun, Dec</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 5–7 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.8 (2.9k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹24,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=manali-shimla" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 8: Golden Triangle (Agra & Delhi) -->
          <article class="destination-full-card anim-fade-up" data-name="golden triangle delhi agra taj mahal mughal jaipur" data-region="north" data-price="28000" data-season="winter" data-rating="4.9" data-reviews="3300">
            <div class="dest-card-img">
              <img src="../Content/images/img_32.jpg" alt="Taj Mahal Agra" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-accent" style="font-size:11px;">🏛️ World Heritage</span>
                <span class="badge badge-dark" style="font-size:10px;">🕌 Taj Mahal</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Golden Triangle (Delhi & Agra)', '₹28,000', '../Content/images/img_32.jpg', '/Pages/package-details.aspx?id=golden-triangle')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Delhi &amp; Agra (Taj Mahal)</h3>
                <span class="weather-badge">🌤️ 24°C Pleasant</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> National Capital Region &amp; UP
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                Sunrise marvels at the legendary Taj Mahal, grand Agra Fort, Qutub Minar, Chandni Chowk food trails, and iconic monuments of Delhi.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: Oct – Mar</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 5–6 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.9 (3.3k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹28,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=golden-triangle" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 9: Varanasi Ghats -->
          <article class="destination-full-card anim-fade-up" data-name="varanasi kashi ganges ghats sarnath spiritual aarti" data-region="north" data-price="16000" data-season="winter" data-rating="4.9" data-reviews="2800">
            <div class="dest-card-img">
              <img src="../Content/images/img_39.jpg" alt="Varanasi Ghats" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-accent" style="font-size:11px;">🛕 Spiritual Heart</span>
                <span class="badge badge-dark" style="font-size:10px;">🕯️ Ganga Aarti</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Varanasi & Ganges Ghats', '₹16,000', '../Content/images/img_39.jpg', '/Pages/package-details.aspx?id=varanasi-spiritual')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Varanasi &amp; Ganges Ghats</h3>
                <span class="weather-badge">🌤️ 25°C Pleasant</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Uttar Pradesh, North India
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                World's oldest living holy city. Mesmerizing evening Dashashwamedh Ganga Aarti, dawn rowing boats on the holy river, and Buddhist stupas at Sarnath.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: Oct – Mar</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 3–5 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.9 (2.8k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹16,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=varanasi-spiritual" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 10: Darjeeling & Gangtok (East) -->
          <article class="destination-full-card anim-fade-up" data-name="darjeeling sikkim gangtok tea kanchenjunga monasteries east" data-region="east" data-price="22000" data-season="summer" data-rating="4.8" data-reviews="1900">
            <div class="dest-card-img">
              <img src="../Content/images/img_18.jpg" alt="Darjeeling Tea Garden" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-secondary" style="font-size:11px;">🍵 Tea &amp; Monasteries</span>
                <span class="badge badge-success" style="font-size:10px;">🚂 Toy Train</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Darjeeling & Gangtok (Sikkim)', '₹22,000', '../Content/images/img_18.jpg', '/Pages/packages.aspx')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Darjeeling &amp; Gangtok</h3>
                <span class="weather-badge">🌤️ 16°C Cool</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Sikkim &amp; West Bengal, East India
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                Breathtaking sunrise views over Mount Kanchenjunga from Tiger Hill, heritage Himalayan Toy Train, sprawling tea estates, and Rumtek monastery.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: Mar–May, Oct–Dec</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 6–8 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.8 (1.9k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹22,000</div>
              </div>
              <a href="/Pages/packages.aspx" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 11: Coorg & Mysore (Karnataka) -->
          <article class="destination-full-card anim-fade-up" data-name="coorg mysore karnataka coffee estate waterfalls south" data-region="south" data-price="14000" data-season="winter" data-rating="4.8" data-reviews="1700">
            <div class="dest-card-img">
              <img src="../Content/images/img_20.jpg" alt="Coorg Coffee Estate" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-primary" style="font-size:11px;">☕ Coffee Hills</span>
                <span class="badge badge-accent" style="font-size:10px;">👑 Mysore Palace</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Coorg & Mysore (Karnataka)', '₹14,000', '../Content/images/img_20.jpg', '/Pages/packages.aspx')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Coorg &amp; Mysore</h3>
                <span class="weather-badge">🌤️ 21°C Mild</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Karnataka, South India
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                Known as the Scotland of India. Aromatic misty coffee estates, cascading Abbey Falls, royal architecture of illuminated Mysore Palace, and wildlife.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: Oct – Mar</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 4–5 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.8 (1.7k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹14,000</div>
              </div>
              <a href="/Pages/packages.aspx" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Destination 12: Rishikesh & Haridwar (Uttarakhand) -->
          <article class="destination-full-card anim-fade-up" data-name="rishikesh haridwar uttarakhand rafting yoga ganges spiritual" data-region="north" data-price="12000" data-season="summer" data-rating="4.8" data-reviews="2300">
            <div class="dest-card-img">
              <img src="../Content/images/img_41.jpg" alt="Rishikesh Uttarakhand" loading="lazy">
              <div class="dest-badges-top">
                <span class="badge badge-accent" style="font-size:11px;">🧘 Yoga Capital</span>
                <span class="badge badge-primary" style="font-size:10px;">🌊 River Rafting</span>
              </div>
              <button type="button" class="dest-wishlist-btn" onclick="toggleDestWishlist(this, 'Rishikesh & Haridwar', '₹12,000', '../Content/images/img_41.jpg', '/Pages/packages.aspx')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="dest-card-body">
              <div class="flex-between mb-8">
                <h3 style="font-size:20px; font-weight:800; color:var(--text-primary);">Rishikesh &amp; Haridwar</h3>
                <span class="weather-badge">🌤️ 22°C Refreshing</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Uttarakhand, Himalayan Foothills
              </p>
              <p style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1;">
                World Capital of Yoga. White water river rafting on the Ganges, cliff jumping, bungee adventure, iconic suspension bridges, and Har Ki Pauri evening Aarti.
              </p>

              <div class="dest-info-row">
                <div class="dest-info-item"><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> Best: Sep–Nov, Mar–May</div>
                <div class="dest-info-item"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 3–5 Days</div>
                <div class="dest-info-item"><i class="fa-solid fa-star" style="color:#F59E0B;"></i> 4.8 (2.3k)</div>
              </div>
            </div>
            <div class="dest-footer">
              <div>
                <small style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;">Avg. Tour Cost</small>
                <div class="dest-price-val">₹12,000</div>
              </div>
              <a href="/Pages/packages.aspx" class="btn btn-primary btn-sm">
                Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

        </div>

        <!-- No Results Fallback Card -->
        <div id="noDestResultsCard" class="card p-32 text-center" style="display:none; padding:48px 24px; border:2px dashed var(--gray-300); margin-top:20px;">
          <div style="font-size:52px; margin-bottom:12px;">🗺️</div>
          <h3 style="font-size:20px; font-weight:800; color:var(--text-primary); margin-bottom:6px;">No Matching Destinations Found</h3>
          <p style="font-size:14px; color:var(--text-secondary); max-width:440px; margin:0 auto 20px;">
            We couldn't find destinations matching your active filters. Try searching for other regions or reset your filters.
          </p>
          <button type="button" class="btn btn-primary" onclick="resetAllDestFilters()">
            <i class="fa-solid fa-rotate-left" style="margin-right:6px;"></i> Show All 12 Destinations
          </button>
        </div>

      </div>
    </section>

    <!-- Regional Travel Guides Hub -->
    <section class="section" style="background:var(--bg-secondary); padding:70px 0;">
      <div class="container">
        <div class="text-center mb-40 anim-fade-up">
          <span class="badge badge-accent mb-8">💡 Regional India Handbook</span>
          <h2 class="section-title">Travel Seasons &amp; Regional Guides</h2>
          <p class="section-subtitle">Plan your timeline wisely with insights into climate patterns and best visiting windows across India.</p>
        </div>

        <div class="grid grid-4" style="gap:24px;">
          
          <div class="region-guide-card">
            <div style="font-size:32px; margin-bottom:12px;">🏔️</div>
            <h3 style="font-size:18px; font-weight:800; margin-bottom:8px;">Himalayan North</h3>
            <p style="font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:12px;">
              Ideal for snow enthusiasts in winter (Dec–Feb) and pleasant escapades in summer (Apr–Jun). Leh-Ladakh is best between May and September.
            </p>
            <span class="badge badge-primary" style="font-size:10px;">Ladakh • Kashmir • Manali</span>
          </div>

          <div class="region-guide-card">
            <div style="font-size:32px; margin-bottom:12px;">🌴</div>
            <h3 style="font-size:18px; font-weight:800; margin-bottom:8px;">Tropical South</h3>
            <p style="font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:12px;">
              Pleasant winter breezes from October to March make it supreme for Kerala backwaters, spice estates of Coorg, and temple architectures.
            </p>
            <span class="badge badge-success" style="font-size:10px;">Kerala • Coorg • Mysore</span>
          </div>

          <div class="region-guide-card">
            <div style="font-size:32px; margin-bottom:12px;">🏰</div>
            <h3 style="font-size:18px; font-weight:800; margin-bottom:8px;">Royal West Coast</h3>
            <p style="font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:12px;">
              Rajasthan desert festivals and Goa coastal nightlife peak between November and February when sunny days give way to cool evenings.
            </p>
            <span class="badge badge-dark" style="font-size:10px;">Rajasthan • Goa • Gujarat</span>
          </div>

          <div class="region-guide-card">
            <div style="font-size:32px; margin-bottom:12px;">🏝️</div>
            <h3 style="font-size:18px; font-weight:800; margin-bottom:8px;">Coral Islands</h3>
            <p style="font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:12px;">
              Crystal clear sea visibility for scuba diving, bioluminescence at night, and catamaran ferry rides from October to May.
            </p>
            <span class="badge badge-secondary" style="font-size:10px;">Havelock • Neil • Port Blair</span>
          </div>

        </div>
      </div>
    </section>

    <!-- Interactive Visual India Map Section -->
    <section class="section" style="padding:70px 0;">
      <div class="container">
        <div class="text-center mb-36 anim-fade-up">
          <span class="badge" style="background:rgba(14,165,233,0.15); color:var(--primary); border:1px solid rgba(14,165,233,0.3); padding:6px 16px; font-size:12px; font-weight:700; border-radius:999px; margin-bottom:10px; display:inline-block;">
            📍 Geographic Exploration
          </span>
          <h2 class="section-title">Interactive India <span class="text-gradient">Travel Map</span></h2>
          <p class="section-subtitle">Click on any destination pin to explore verified packages, itineraries, and live rates.</p>
        </div>

        <div class="map-container anim-scale">
          <div class="simulated-map">
            <div class="simulated-map-overlay"></div>

            <!-- Pin: Ladakh -->
            <div class="map-pin" style="top: 14%; left: 33%;" onclick="window.location.href='/Pages/package-details.aspx?id=ladakh-adventure'">
              <i class="fa-solid fa-mountain"></i>
              <div class="map-pin-tooltip">Ladakh (Leh) • ₹32,000</div>
            </div>

            <!-- Pin: Kashmir -->
            <div class="map-pin" style="top: 17%; left: 27%;" onclick="window.location.href='/Pages/package-details.aspx?id=kashmir-paradise'">
              <i class="fa-solid fa-snowflake"></i>
              <div class="map-pin-tooltip">Kashmir (Srinagar) • ₹38,000</div>
            </div>

            <!-- Pin: Manali -->
            <div class="map-pin" style="top: 24%; left: 35%;" onclick="window.location.href='/Pages/package-details.aspx?id=manali-shimla'">
              <i class="fa-solid fa-tree"></i>
              <div class="map-pin-tooltip">Manali &amp; Shimla • ₹24,000</div>
            </div>

            <!-- Pin: Rajasthan -->
            <div class="map-pin" style="top: 40%; left: 26%;" onclick="window.location.href='/Pages/package-details.aspx?id=royal-rajasthan'">
              <i class="fa-solid fa-chess-rook"></i>
              <div class="map-pin-tooltip">Rajasthan (Jaipur) • ₹45,000</div>
            </div>

            <!-- Pin: Agra Taj Mahal -->
            <div class="map-pin" style="top: 38%; left: 40%;" onclick="window.location.href='/Pages/package-details.aspx?id=golden-triangle'">
              <i class="fa-solid fa-landmark"></i>
              <div class="map-pin-tooltip">Agra (Taj Mahal) • ₹28,000</div>
            </div>

            <!-- Pin: Varanasi -->
            <div class="map-pin" style="top: 45%; left: 52%;" onclick="window.location.href='/Pages/package-details.aspx?id=varanasi-spiritual'">
              <i class="fa-solid fa-fire"></i>
              <div class="map-pin-tooltip">Varanasi (Ganges) • ₹16,000</div>
            </div>

            <!-- Pin: Sikkim / Darjeeling -->
            <div class="map-pin" style="top: 36%; left: 68%;" onclick="window.location.href='/Pages/packages.aspx'">
              <i class="fa-solid fa-mug-hot"></i>
              <div class="map-pin-tooltip">Darjeeling &amp; Sikkim • ₹22,000</div>
            </div>

            <!-- Pin: Goa -->
            <div class="map-pin" style="top: 68%; left: 29%;" onclick="window.location.href='/Pages/package-details.aspx?id=goa-beach'">
              <i class="fa-solid fa-umbrella-beach"></i>
              <div class="map-pin-tooltip">Goa Beaches • ₹18,000</div>
            </div>

            <!-- Pin: Kerala -->
            <div class="map-pin" style="top: 86%; left: 35%;" onclick="window.location.href='/Pages/package-details.aspx?id=kerala'">
              <i class="fa-solid fa-ship"></i>
              <div class="map-pin-tooltip">Kerala Backwaters • ₹36,000</div>
            </div>

            <!-- Pin: Andaman -->
            <div class="map-pin" style="top: 76%; left: 82%;" onclick="window.location.href='/Pages/package-details.aspx?id=andaman'">
              <i class="fa-solid fa-water"></i>
              <div class="map-pin-tooltip">Andaman Islands • ₹42,000</div>
            </div>

            <div style="position:absolute; bottom:20px; right:20px; background:rgba(255,255,255,0.92); padding:10px 18px; border-radius:var(--radius-md); font-size:12px; font-weight:700; color:var(--text-primary); backdrop-filter:blur(10px); box-shadow:var(--shadow-md);">
              📍 Interactive Map: Click pins to view package details
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Custom Destination Trip Inquiry CTA -->
    <section class="section" style="background:linear-gradient(135deg, #0b1329 0%, #1e293b 100%); color:white; padding:70px 0;">
      <div class="container text-center">
        <div class="anim-fade-up">
          <span class="badge" style="background:rgba(14,165,233,0.2); border:1px solid rgba(14,165,233,0.4); color:#38BDF8; padding:6px 18px; font-size:12px; font-weight:700; border-radius:999px; margin-bottom:14px; display:inline-block;">
            ✨ Tailor-Made Destination Planning
          </span>
          <h2 class="section-title" style="color:white; font-size:clamp(28px, 4vw, 44px); margin-top:8px; margin-bottom:12px;">Planning a Multi-City Indian Journey?</h2>
          <p style="color:rgba(255,255,255,0.85); max-width:580px; margin:0 auto 28px; font-size:16px; line-height:1.7;">
            Connect with our destination curators to create an all-inclusive custom circuit covering your dream states, heritage stays, and flight connections.
          </p>
          <div style="display:flex; justify-content:center; gap:16px; flex-wrap:wrap;">
            <a href="/Pages/contact.aspx" class="btn btn-primary btn-lg" style="box-shadow:0 6px 20px rgba(14,165,233,0.4);">
              <i class="fa-solid fa-paper-plane" style="margin-right:8px;"></i> Request Custom Circuit
            </a>
            <a href="tel:+919099107637" class="btn btn-secondary btn-lg" style="background:rgba(255,255,255,0.1); color:white; border-color:rgba(255,255,255,0.3);">
              <i class="fa-solid fa-phone-volume" style="margin-right:8px; color:#38BDF8;"></i> Call +91 90991 07637
            </a>
          </div>
        </div>
      </div>
    </section>

  <script>
    // Live Multi-Filter for Destinations
    function applyDestFilters() {
      const query = document.getElementById('filter-search').value.toLowerCase().trim();
      const region = document.getElementById('filter-region').value;
      const budget = document.getElementById('filter-budget').value;
      const season = document.getElementById('filter-season').value;

      const cards = Array.from(document.querySelectorAll('#destinations-grid-container .destination-full-card'));
      let visibleCount = 0;

      cards.forEach(card => {
        const name = (card.dataset.name || '').toLowerCase();
        const cardRegion = card.dataset.region;
        const cardPrice = parseInt(card.dataset.price || 0);
        const cardSeason = card.dataset.season;

        let match = true;

        if (query && !name.includes(query)) match = false;
        if (region !== 'all' && cardRegion !== region) match = false;
        if (season !== 'all' && cardSeason !== season) match = false;

        if (budget !== 'all') {
          const maxB = parseInt(budget);
          if (maxB === 50000) {
            if (cardPrice < 35000) match = false;
          } else if (cardPrice > maxB) {
            match = false;
          }
        }

        card.style.display = match ? 'flex' : 'none';
        if (match) visibleCount++;
      });

      // Update Header & Counter
      const counter = document.getElementById('results-count');
      if (counter) counter.innerText = `Showing ${visibleCount}`;

      // Show/Hide Fallback
      const fallback = document.getElementById('noDestResultsCard');
      if (fallback) fallback.style.display = visibleCount === 0 ? 'block' : 'none';
    }

    // Sort Destinations
    function sortDestinations(type) {
      const container = document.getElementById('destinations-grid-container');
      const cards = Array.from(container.querySelectorAll('.destination-full-card'));

      cards.sort((a, b) => {
        const priceA = parseInt(a.dataset.price || 0);
        const priceB = parseInt(b.dataset.price || 0);
        const ratingA = parseFloat(a.dataset.rating || 0);
        const ratingB = parseFloat(b.dataset.rating || 0);
        const reviewsA = parseInt(a.dataset.reviews || 0);
        const reviewsB = parseInt(b.dataset.reviews || 0);

        if (type === 'price-low') return priceA - priceB;
        if (type === 'price-high') return priceB - priceA;
        if (type === 'rating') return ratingB - ratingA;
        return reviewsB - reviewsA; // 'popular'
      });

      cards.forEach(c => container.appendChild(c));
      applyDestFilters();
    }

    // Select Region Quick Pill
    function selectRegionPill(btn, region) {
      document.querySelectorAll('#dest-pill-filters .region-pill').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      document.getElementById('filter-region').value = region;
      applyDestFilters();
    }

    // Reset All Filters
    function resetAllDestFilters() {
      document.getElementById('filter-search').value = '';
      document.getElementById('filter-region').value = 'all';
      document.getElementById('filter-budget').value = 'all';
      document.getElementById('filter-season').value = 'all';
      document.getElementById('dest-sort-select').value = 'popular';

      document.querySelectorAll('#dest-pill-filters .region-pill').forEach(b => b.classList.remove('active'));
      const firstPill = document.querySelector('#dest-pill-filters .region-pill');
      if (firstPill) firstPill.classList.add('active');

      sortDestinations('popular');
      Toast.show('All destination filters reset', 'info');
    }

    // Wishlist Toggle for Destinations
    function toggleDestWishlist(btn, title, price, image, href) {
      const user = window.EPIC_USER || {};
      const email = (user.email || 'guest').toLowerCase();
      const key = 'epic_wishlist_' + email;

      let wishlist = [];
      try {
        wishlist = JSON.parse(localStorage.getItem(key) || '[]');
      } catch(e) {}

      const existsIdx = wishlist.findIndex(w => w.title === title);

      if (existsIdx > -1) {
        wishlist.splice(existsIdx, 1);
        btn.classList.remove('active');
        btn.innerHTML = '<i class="fa-regular fa-heart"></i>';
        Toast.show(`Removed "${title}" from your wishlist`, 'info');
      } else {
        wishlist.push({ title, price, image, href });
        btn.classList.add('active');
        btn.innerHTML = '<i class="fa-solid fa-heart"></i>';
        Toast.show(`❤️ Saved "${title}" to your wishlist!`, 'success');
      }

      localStorage.setItem(key, JSON.stringify(wishlist));
    }

    // Init Wishlist active states and URL query parameters on load
    document.addEventListener('DOMContentLoaded', () => {
      const user = window.EPIC_USER || {};
      const email = (user.email || 'guest').toLowerCase();
      const key = 'epic_wishlist_' + email;

      try {
        const wishlist = JSON.parse(localStorage.getItem(key) || '[]');
        const wishTitles = wishlist.map(w => w.title);

        document.querySelectorAll('.destination-full-card').forEach(card => {
          const title = card.querySelector('h3')?.innerText.trim();
          const btn = card.querySelector('.dest-wishlist-btn');
          if (title && wishTitles.some(wt => wt.includes(title) || title.includes(wt)) && btn) {
            btn.classList.add('active');
            btn.innerHTML = '<i class="fa-solid fa-heart"></i>';
          }
        });
      } catch(e) {}

      // Handle URL search parameter e.g. ?search=kerala or ?region=north
      const params = new URLSearchParams(window.location.search);
      const search = params.get('search') || params.get('dest');
      const region = params.get('region');

      if (search) {
        document.getElementById('filter-search').value = search;
      }
      if (region) {
        const regSelect = document.getElementById('filter-region');
        if (regSelect) regSelect.value = region;

        const pill = Array.from(document.querySelectorAll('#dest-pill-filters .region-pill')).find(p => p.getAttribute('onclick')?.includes(`'${region}'`));
        if (pill) {
          document.querySelectorAll('#dest-pill-filters .region-pill').forEach(b => b.classList.remove('active'));
          pill.classList.add('active');
        }
      }
      
      if (search || region) {
        applyDestFilters();
      }
    });
  </script>
</asp:Content>
