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
                  url('../Content/images/img_23.jpg') center center no-repeat;
      background-size: cover;
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
      display: grid !important;
      grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
      gap: 20px !important;
      width: 100%;
    }

    /* Seamless DataList CSS Grid Integration */
    #destinations-grid-container > span,
    #destinations-grid-container span {
      display: contents !important;
    }

    /* Hide any <br> tags emitted by DataList so they never occupy grid cells */
    #destinations-grid-container br,
    #destinations-grid-container span br {
      display: none !important;
    }

    .destination-full-card {
      min-width: 0;
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
      height: 210px;
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
      text-decoration: none !important;
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
      padding: 18px;
      flex: 1;
      display: flex;
      flex-direction: column;
    }

    .dest-card-body h3, .dest-card-body .dest-title {
      font-size: 18px !important;
      font-weight: 800;
      color: var(--text-primary);
      margin: 0;
      display: block;
    }

    .weather-badge {
      display: inline-flex;
      align-items: center;
      gap: 4px;
      background: linear-gradient(135deg, rgba(14,165,233,0.15) 0%, rgba(2,132,199,0.2) 100%);
      color: var(--primary);
      border: 1px solid rgba(14,165,233,0.3);
      padding: 3px 8px;
      border-radius: var(--radius-full);
      font-size: 11px;
      font-weight: 700;
      white-space: nowrap;
    }

    .dest-info-row {
      display: flex;
      align-items: center;
      gap: 5px;
      font-size: 11px;
      color: var(--text-secondary);
      margin: 8px 0 14px;
      flex-wrap: wrap;
    }

    .dest-info-item {
      display: inline-flex;
      align-items: center;
      gap: 4px;
      background: var(--bg-secondary);
      padding: 3px 6px;
      border-radius: var(--radius-sm);
      border: 1px solid var(--gray-200);
      font-weight: 600;
      font-size: 11px;
      white-space: nowrap;
    }

    .dest-footer {
      padding: 12px 18px;
      background: var(--bg-secondary);
      border-top: 1px solid var(--gray-200);
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 8px;
    }

    .dest-price-val {
      font-size: 18px;
      font-weight: 800;
      color: var(--primary);
      line-height: 1.1;
      white-space: nowrap;
    }

    .dest-footer .btn {
      padding: 6px 12px !important;
      font-size: 12px !important;
      white-space: nowrap !important;
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
      background: url('../Content/images/img_22.jpg') center center no-repeat;
      background-size: cover;
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

    @media (max-width: 1024px) {
      .dest-filter-card {
        padding: 20px;
      }
      .simulated-map {
        height: 380px;
      }
    }

    @media (max-width: 680px) {
      .destinations-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
        gap: 14px !important;
      }
    }

    @media (max-width: 480px) {
      .destinations-grid {
        grid-template-columns: 1fr !important;
        gap: 14px !important;
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

          <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
              <asp:Panel ID="pnlCard" runat="server" CssClass="destination-full-card anim-fade-up" 
                         data-name='<%# Eval("Dest_SearchKeywords") %>' 
                         data-region='<%# Eval("Dest_Region") %>' 
                         data-price='<%# Eval("Dest_Price") %>' 
                         data-season='<%# Eval("Dest_Season") %>' 
                         data-rating='<%# Eval("Dest_Rating") %>' 
                         data-reviews='<%# Eval("Dest_Reviews") %>'>
                
                <asp:Panel ID="pnlCardImg" runat="server" CssClass="dest-card-img">
                  <asp:Image ID="imgDest" runat="server" ImageUrl='<%# Eval("Dest_Image") %>' AlternateText='<%# Eval("Dest_Name") %>' />
                  <asp:Panel ID="pnlBadgesTop" runat="server" CssClass="dest-badges-top">
                    <asp:Label ID="lblBadge1" runat="server" CssClass='<%# "badge " + Eval("Dest_Badge1_Class") %>' Text='<%# Eval("Dest_Badge1") %>' style="font-size:11px;" />
                    <asp:Label ID="lblBadge2" runat="server" CssClass='<%# "badge " + Eval("Dest_Badge2_Class") %>' Text='<%# Eval("Dest_Badge2") %>' style="font-size:10px;" />
                  </asp:Panel>
                  <asp:LinkButton ID="btnWishlist" runat="server" CssClass="dest-wishlist-btn" 
                                  OnClientClick='<%# "toggleDestWishlist(this, \"" + Eval("Dest_Name") + "\", \"₹" + Eval("Dest_Price", "{0:N0}") + "\", \"" + Eval("Dest_Image") + "\", \"" + Eval("Dest_PackageUrl") + "\"); return false;" %>' 
                                  aria-label="Add to wishlist">
                    <i class="fa-regular fa-heart"></i>
                  </asp:LinkButton>
                </asp:Panel>

                <asp:Panel ID="pnlCardBody" runat="server" CssClass="dest-card-body">
                  <asp:Panel ID="pnlTitleRow" runat="server" CssClass="flex-between mb-8">
                    <asp:Label ID="lblDestName" runat="server" CssClass="dest-title" Text='<%# Eval("Dest_Name") %>' />
                    <asp:Label ID="lblWeather" runat="server" CssClass="weather-badge" Text='<%# Eval("Dest_Weather") %>' />
                  </asp:Panel>
                  <asp:Panel ID="pnlLocationRow" runat="server" style="font-size:13px; color:var(--text-secondary); font-weight:600; margin-bottom:8px;">
                    <i class="fa-solid fa-location-dot" style="color:var(--primary); margin-right:4px;"></i>
                    <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("Dest_Location") %>' />
                  </asp:Panel>
                  <asp:Label ID="lblDescription" runat="server" style="font-size:14px; color:var(--text-secondary); line-height:1.6; margin-bottom:14px; flex:1; display:block;" Text='<%# Eval("Dest_Description") %>' />

                  <asp:Panel ID="pnlInfoRow" runat="server" CssClass="dest-info-row">
                    <asp:Panel ID="pnlBestSeason" runat="server" CssClass="dest-info-item">
                      <i class="fa-regular fa-calendar" style="color:var(--primary);"></i>
                      <asp:Label ID="lblBestSeason" runat="server" Text='<%# "Best: " + Eval("Dest_BestSeason") %>' />
                    </asp:Panel>
                    <asp:Panel ID="pnlDuration" runat="server" CssClass="dest-info-item">
                      <i class="fa-regular fa-clock" style="color:var(--primary);"></i>
                      <asp:Label ID="lblDuration" runat="server" Text='<%# Eval("Dest_Duration") %>' />
                    </asp:Panel>
                    <asp:Panel ID="pnlRating" runat="server" CssClass="dest-info-item">
                      <i class="fa-solid fa-star" style="color:#F59E0B;"></i>
                      <asp:Label ID="lblRating" runat="server" Text='<%# Eval("Dest_Rating") + " (" + Eval("Dest_Reviews") + ")" %>' />
                    </asp:Panel>
                  </asp:Panel>
                </asp:Panel>

                <asp:Panel ID="pnlFooter" runat="server" CssClass="dest-footer">
                  <asp:Panel ID="pnlPriceWrap" runat="server">
                    <asp:Label ID="lblCostTag" runat="server" style="font-size:11px; color:var(--text-muted); display:block; font-weight:700; text-transform:uppercase;" Text="Avg. Tour Cost" />
                    <asp:Label ID="lblPrice" runat="server" CssClass="dest-price-val" Text='<%# "₹" + Eval("Dest_Price", "{0:N0}") %>' />
                  </asp:Panel>
                  
                  <asp:LinkButton ID="btnExplore" runat="server" CssClass="btn btn-primary btn-sm" 
                                  CommandName="cmd_details" 
                                  CommandArgument='<%# Eval("Dest_PackageUrl") %>'>
                    Explore Packages <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
                  </asp:LinkButton>
                </asp:Panel>

              </asp:Panel>
            </ItemTemplate>
          </asp:DataList>

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

        const wrapper = (card.parentElement && card.parentElement.tagName === 'SPAN' && card.parentElement.id !== 'destinations-grid-container') ? card.parentElement : card;
        wrapper.style.display = match ? 'flex' : 'none';
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

      cards.forEach(c => {
        const target = (c.parentElement && c.parentElement.tagName === 'SPAN' && c.parentElement.id !== 'destinations-grid-container') ? c.parentElement : c;
        target.parentElement.appendChild(target);
      });
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
