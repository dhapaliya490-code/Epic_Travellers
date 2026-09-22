<%@ Page Title="Tour Packages – Epic-Travellers | Handcrafted India Tours" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="packages.aspx.cs" Inherits="Epic_Travelers.Pages.packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Book premium Indian tour packages with Epic-Travellers. Luxury honeymoons, family holidays, adventure expeditions, and heritage palace tours across India.">
  <meta name="keywords" content="India tour packages, Rajasthan heritage tour, Kerala houseboat package, Ladakh bike expedition, Goa holiday, Andaman islands, Kashmir tour">

  <style>
    .page-hero {
      background: linear-gradient(135deg, rgba(15,23,42,0.85) 0%, rgba(20,184,166,0.7) 100%),
                  url('../Content/images/img_45.jpg') center/cover no-repeat;
      padding: 150px 0 90px;
      color: white;
      text-align: center;
      position: relative;
    }

    .package-filter-card {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      padding: 28px;
      box-shadow: 0 20px 40px -15px rgba(0,0,0,0.12);
      border: 1px solid var(--gray-200);
      margin-top: -55px;
      position: relative;
      z-index: 10;
    }

    .category-pill {
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

    .category-pill:hover, .category-pill.active {
      background: var(--gradient-primary);
      color: white;
      border-color: transparent;
      box-shadow: 0 4px 14px rgba(14,165,233,0.35);
      transform: translateY(-2px);
    }

    .packages-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(360px, 1fr));
      gap: 32px;
    }

    .pkg-card {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      overflow: hidden;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      display: flex;
      flex-direction: column;
      transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.3s ease, border-color 0.2s;
    }

    .pkg-card:hover {
      transform: translateY(-6px);
      box-shadow: var(--shadow-xl);
      border-color: var(--primary);
    }

    .pkg-image-wrapper {
      position: relative;
      height: 230px;
      overflow: hidden;
    }

    .pkg-image-wrapper img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.6s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .pkg-card:hover .pkg-image-wrapper img {
      transform: scale(1.08);
    }

    .pkg-badges-top {
      position: absolute;
      top: 14px;
      left: 14px;
      display: flex;
      flex-direction: column;
      gap: 6px;
      z-index: 2;
    }

    .pkg-wishlist-btn {
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

    .pkg-wishlist-btn:hover {
      background: white;
      color: #ef4444;
      transform: scale(1.1);
    }

    .pkg-wishlist-btn.active {
      background: #ef4444;
      color: white;
    }

    .pkg-body {
      padding: 24px;
      display: flex;
      flex-direction: column;
      flex: 1;
    }

    .pkg-meta-row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      font-size: 12px;
      font-weight: 700;
      color: var(--primary);
      margin-bottom: 8px;
    }

    .pkg-title {
      font-size: 19px;
      font-weight: 800;
      color: var(--text-primary);
      margin-bottom: 10px;
      line-height: 1.35;
    }

    .pkg-inclusions-list {
      display: flex;
      flex-wrap: wrap;
      gap: 6px;
      margin-bottom: 14px;
    }

    .pkg-inclusion-pill {
      font-size: 11px;
      font-weight: 600;
      padding: 4px 10px;
      border-radius: var(--radius-sm);
      background: var(--bg-secondary);
      color: var(--text-secondary);
      border: 1px solid var(--gray-200);
    }

    .pkg-desc {
      font-size: 13px;
      color: var(--text-secondary);
      line-height: 1.6;
      margin-bottom: 18px;
      flex: 1;
    }

    .pkg-footer {
      padding: 16px 24px;
      background: var(--bg-secondary);
      border-top: 1px solid var(--gray-200);
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
    }

    .pkg-price-val {
      font-size: 22px;
      font-weight: 800;
      color: var(--primary);
      line-height: 1.1;
    }

    @media (max-width: 768px) {
      .packages-grid {
        grid-template-columns: 1fr;
      }
      .package-filter-card {
        padding: 20px;
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
          <span class="breadcrumb-item active" style="color:white;">Tour Packages</span>
        </div>
        
        <span class="badge" style="background:rgba(20,184,166,0.25); border:1px solid rgba(20,184,166,0.5); color:#2DD4BF; padding:6px 16px; font-size:12px; font-weight:700; border-radius:999px; margin-bottom:16px; display:inline-block;">
          ✨ Handcrafted Luxury &amp; Heritage Expeditions
        </span>

        <h1 class="section-title" style="color:white; font-size:clamp(32px, 5vw, 54px); margin-bottom:14px;">
          Explore Curated <span style="color:var(--accent-light);">India Tour Packages</span>
        </h1>
        <p style="color:rgba(255,255,255,0.9); max-width:640px; margin:0 auto; font-size:16px; line-height:1.7;">
          Choose from verified, all-inclusive luxury itineraries. Every package includes 4★/5★ heritage stays, private AC vehicle, expert local guides, and 24/7 dedicated support.
        </p>
      </div>
    </section>

    <!-- Main Filter Panel -->
    <section class="section" style="padding-top:0; padding-bottom:32px;">
      <div class="container">
        
        <div class="package-filter-card anim-fade-up">
          <div class="grid grid-4" style="gap:18px;">
            
            <!-- Filter 1: Search -->
            <div>
              <label class="form-label" for="pkg-search"><i class="fa-solid fa-magnifying-glass" style="color:var(--primary); margin-right:4px;"></i> Search Package</label>
              <input type="text" id="pkg-search" class="form-control" placeholder="Search Rajasthan, Kerala, Ladakh..." oninput="filterPackages()">
            </div>

            <!-- Filter 2: Travel Style -->
            <div>
              <label class="form-label" for="pkg-category"><i class="fa-solid fa-compass" style="color:var(--primary); margin-right:4px;"></i> Travel Style</label>
              <select id="pkg-category" class="form-control filter-select" onchange="filterPackages()">
                <option value="all">All Styles (9 Tours)</option>
                <option value="luxury">👑 Luxury Heritage</option>
                <option value="honeymoon">💑 Honeymoon Specials</option>
                <option value="adventure">🧗 Adventure &amp; Safari</option>
                <option value="family">👨‍👩‍👧 Family &amp; Beach</option>
                <option value="snow">❄️ Snow &amp; Mountains</option>
                <option value="island">🏝️ Islands &amp; Coastal</option>
                <option value="spiritual">🛕 Spiritual &amp; Cultural</option>
              </select>
            </div>

            <!-- Filter 3: Duration -->
            <div>
              <label class="form-label" for="pkg-duration"><i class="fa-regular fa-clock" style="color:var(--primary); margin-right:4px;"></i> Duration</label>
              <select id="pkg-duration" class="form-control filter-select" onchange="filterPackages()">
                <option value="all">Any Duration</option>
                <option value="short">1 – 4 Days (Quick Escape)</option>
                <option value="medium">5 – 8 Days (Standard Tour)</option>
                <option value="long">9+ Days (Grand Expedition)</option>
              </select>
            </div>

            <!-- Filter 4: Budget / Sort -->
            <div>
              <label class="form-label" for="pkg-sort"><i class="fa-solid fa-arrow-down-short-wide" style="color:var(--primary); margin-right:4px;"></i> Sort Results</label>
              <select id="pkg-sort" class="form-control filter-select" onchange="sortAndFilterPackages()">
                <option value="popular">Recommended / Popular</option>
                <option value="price-low">Price: Low to High</option>
                <option value="price-high">Price: High to Low</option>
                <option value="rating">Top Traveler Rating</option>
                <option value="duration">Duration: Longest First</option>
              </select>
            </div>

          </div>

          <!-- Bottom Filter Status & Reset -->
          <div class="flex-between mt-18 pt-16" style="border-top:1px solid var(--gray-200); font-size:13px;">
            <div style="color:var(--text-secondary);">
              <span id="resultsCount" style="font-weight:800; color:var(--text-primary);">Showing 9</span> verified tour packages
            </div>
            <button type="button" class="btn btn-secondary btn-sm" onclick="resetAllFilters()">
              <i class="fa-solid fa-rotate-left" style="margin-right:4px;"></i> Reset Filters
            </button>
          </div>
        </div>

        <!-- Quick Filter Pills -->
        <div class="flex-center gap-12 flex-wrap mt-32 mb-28" id="pill-filters">
          <button type="button" class="category-pill active" onclick="selectPill(this, 'all')">🌟 All Packages (9)</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'luxury')">👑 Luxury Heritage</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'honeymoon')">💑 Honeymoon</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'adventure')">🧗 Adventure</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'family')">🏖️ Beach &amp; Family</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'snow')">❄️ Snow &amp; Hills</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'island')">🏝️ Coral Islands</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'spiritual')">🛕 Spiritual</button>
        </div>

      </div>
    </section>

    <!-- Packages List Grid -->
    <section class="section" style="padding-top:0; padding-bottom:80px;">
      <div class="container">
        
        <div class="packages-grid stagger-children" id="packages-grid">

          <!-- Package 1: Rajasthan -->
          <article class="pkg-card anim-fade-up" data-title="royal rajasthan expedition jaipur udaipur jodhpur" data-style="luxury" data-days="8" data-price="45000" data-rating="4.9" data-reviews="420">
            <div class="pkg-image-wrapper">
              <img src="../Content/images/img_48.jpg" alt="Royal Rajasthan Expedition" loading="lazy">
              <div class="pkg-badges-top">
                <span class="badge badge-accent" style="font-size:11px;">⭐ Bestseller</span>
                <span class="badge badge-dark" style="font-size:10px;">👑 Luxury Heritage</span>
              </div>
              <button type="button" class="pkg-wishlist-btn" onclick="toggleWishlist(this, 'Royal Rajasthan Expedition', '₹45,000', '../Content/images/img_48.jpg', '/Pages/package-details.aspx?id=royal-rajasthan')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="pkg-body">
              <div class="pkg-meta-row">
                <span><i class="fa-regular fa-clock"></i> 8 Days / 7 Nights</span>
                <span><i class="fa-solid fa-map-location-dot"></i> Jaipur, Udaipur, Jodhpur</span>
              </div>
              <h3 class="pkg-title">Royal Rajasthan Heritage Expedition</h3>
              <div class="pkg-inclusions-list">
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-hotel"></i> 4★ Haveli Stays</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-car-side"></i> Private AC SUV</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-utensils"></i> Breakfast &amp; Dinner</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-campground"></i> Desert Safari</span>
              </div>
              <p class="pkg-desc">
                Experience royal Rajasthani hospitality with luxury palace hotels, camel safari over Thar sand dunes, and sunset boat cruises on Lake Pichola.
              </p>
              <div style="display:flex; align-items:center; justify-content:space-between; margin-top:auto;">
                <div style="font-size:13px; color:#F59E0B; font-weight:700;">
                  ★ 4.9 <span style="color:var(--text-muted); font-size:12px; font-weight:500;">(420 reviews)</span>
                </div>
                <span class="badge badge-success" style="font-size:10px;">Instant Confirm</span>
              </div>
            </div>
            <div class="pkg-footer">
              <div>
                <div style="font-size:11px; text-transform:uppercase; color:var(--text-muted); font-weight:700;">Starting From</div>
                <div class="pkg-price-val">₹45,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=royal-rajasthan" class="btn btn-primary btn-sm">
                View Itinerary <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Package 2: Kerala -->
          <article class="pkg-card anim-fade-up" data-title="kerala backwaters romantic bliss munnar alleppey kovalam" data-style="honeymoon" data-days="6" data-price="36000" data-rating="4.9" data-reviews="310">
            <div class="pkg-image-wrapper">
              <img src="../Content/images/img_55.jpg" alt="Kerala Backwaters" loading="lazy">
              <div class="pkg-badges-top">
                <span class="badge badge-secondary" style="font-size:11px;">💑 Honeymoon Special</span>
                <span class="badge badge-success" style="font-size:10px;">🌿 Nature &amp; Backwaters</span>
              </div>
              <button type="button" class="pkg-wishlist-btn" onclick="toggleWishlist(this, 'Kerala Backwaters Romantic Bliss', '₹36,000', '../Content/images/img_55.jpg', '/Pages/package-details.aspx?id=kerala')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="pkg-body">
              <div class="pkg-meta-row">
                <span><i class="fa-regular fa-clock"></i> 6 Days / 5 Nights</span>
                <span><i class="fa-solid fa-map-location-dot"></i> Munnar, Alleppey, Kovalam</span>
              </div>
              <h3 class="pkg-title">Kerala Backwaters Romantic Bliss</h3>
              <div class="pkg-inclusions-list">
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-ship"></i> AC Houseboat</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-mug-hot"></i> Tea Plantation Stay</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-spa"></i> Ayurvedic Spa</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-wine-glass"></i> Candlelight Dinner</span>
              </div>
              <p class="pkg-desc">
                Cruise on private air-conditioned houseboats, stroll through lush mist-covered tea estates in Munnar, and relax along golden Kovalam coastline.
              </p>
              <div style="display:flex; align-items:center; justify-content:space-between; margin-top:auto;">
                <div style="font-size:13px; color:#F59E0B; font-weight:700;">
                  ★ 4.9 <span style="color:var(--text-muted); font-size:12px; font-weight:500;">(310 reviews)</span>
                </div>
                <span class="badge badge-success" style="font-size:10px;">Couple Favorite</span>
              </div>
            </div>
            <div class="pkg-footer">
              <div>
                <div style="font-size:11px; text-transform:uppercase; color:var(--text-muted); font-weight:700;">Starting From</div>
                <div class="pkg-price-val">₹36,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=kerala" class="btn btn-primary btn-sm">
                View Itinerary <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Package 3: Ladakh -->
          <article class="pkg-card anim-fade-up" data-title="ladakh high altitude bike expedition leh khardung la pangong nubra" data-style="adventure" data-days="10" data-price="32000" data-rating="4.8" data-reviews="290">
            <div class="pkg-image-wrapper">
              <img src="../Content/images/img_14.jpg" alt="Ladakh Bike Expedition" loading="lazy">
              <div class="pkg-badges-top">
                <span class="badge badge-danger" style="font-size:11px;">🧗 High Altitude</span>
                <span class="badge badge-dark" style="font-size:10px;">🏍️ Royal Enfield</span>
              </div>
              <button type="button" class="pkg-wishlist-btn" onclick="toggleWishlist(this, 'Ladakh High Altitude Bike Expedition', '₹32,000', '../Content/images/img_14.jpg', '/Pages/package-details.aspx?id=ladakh-adventure')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="pkg-body">
              <div class="pkg-meta-row">
                <span><i class="fa-regular fa-clock"></i> 10 Days / 9 Nights</span>
                <span><i class="fa-solid fa-map-location-dot"></i> Leh, Khardung La, Pangong</span>
              </div>
              <h3 class="pkg-title">Ladakh High Altitude Bike Expedition</h3>
              <div class="pkg-inclusions-list">
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-motorcycle"></i> Himalayan 411cc</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-campground"></i> Pangong Camp Stay</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-wrench"></i> Mechanic Backup</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-passport"></i> Inner Line Permits</span>
              </div>
              <p class="pkg-desc">
                Conquer the world's highest motorable pass at Khardung La, camp beside the color-changing Pangong Lake, and explore surreal Nubra sand dunes.
              </p>
              <div style="display:flex; align-items:center; justify-content:space-between; margin-top:auto;">
                <div style="font-size:13px; color:#F59E0B; font-weight:700;">
                  ★ 4.8 <span style="color:var(--text-muted); font-size:12px; font-weight:500;">(290 reviews)</span>
                </div>
                <span class="badge badge-primary" style="font-size:10px;">Extreme Thrill</span>
              </div>
            </div>
            <div class="pkg-footer">
              <div>
                <div style="font-size:11px; text-transform:uppercase; color:var(--text-muted); font-weight:700;">Starting From</div>
                <div class="pkg-price-val">₹32,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=ladakh-adventure" class="btn btn-primary btn-sm">
                View Itinerary <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Package 4: Kashmir -->
          <article class="pkg-card anim-fade-up" data-title="kashmir paradise srinagar gulmarg pahalgam dal lake" data-style="luxury" data-days="7" data-price="38000" data-rating="5.0" data-reviews="610">
            <div class="pkg-image-wrapper">
              <img src="../Content/images/img_13.jpg" alt="Kashmir Paradise" loading="lazy">
              <div class="pkg-badges-top">
                <span class="badge badge-accent" style="font-size:11px;">👑 Crown of India</span>
                <span class="badge badge-success" style="font-size:10px;">⭐ 5.0 Top Rated</span>
              </div>
              <button type="button" class="pkg-wishlist-btn" onclick="toggleWishlist(this, 'Kashmir Paradise: Srinagar, Gulmarg & Pahalgam', '₹38,000', '../Content/images/img_13.jpg', '/Pages/package-details.aspx?id=kashmir-paradise')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="pkg-body">
              <div class="pkg-meta-row">
                <span><i class="fa-regular fa-clock"></i> 7 Days / 6 Nights</span>
                <span><i class="fa-solid fa-map-location-dot"></i> Srinagar, Gulmarg, Pahalgam</span>
              </div>
              <h3 class="pkg-title">Kashmir Paradise: Srinagar &amp; Gulmarg</h3>
              <div class="pkg-inclusions-list">
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-sailboat"></i> Dal Lake Houseboat</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-mountain"></i> Gondola Tickets</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-car"></i> AC Innova Private</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-utensils"></i> Kashmiri Wazwan</span>
              </div>
              <p class="pkg-desc">
                Experience heaven on Earth with luxury Dal Lake Shikara rides, snow activities at Gulmarg Gondola, and walks through Betaab Valley in Pahalgam.
              </p>
              <div style="display:flex; align-items:center; justify-content:space-between; margin-top:auto;">
                <div style="font-size:13px; color:#F59E0B; font-weight:700;">
                  ★ 5.0 <span style="color:var(--text-muted); font-size:12px; font-weight:500;">(610 reviews)</span>
                </div>
                <span class="badge badge-success" style="font-size:10px;">All-Inclusive</span>
              </div>
            </div>
            <div class="pkg-footer">
              <div>
                <div style="font-size:11px; text-transform:uppercase; color:var(--text-muted); font-weight:700;">Starting From</div>
                <div class="pkg-price-val">₹38,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=kashmir-paradise" class="btn btn-primary btn-sm">
                View Itinerary <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Package 5: Goa -->
          <article class="pkg-card anim-fade-up" data-title="goa beach resort cruise retreat calangute baga panaji" data-style="family" data-days="5" data-price="18000" data-rating="4.7" data-reviews="520">
            <div class="pkg-image-wrapper">
              <img src="../Content/images/img_21.jpg" alt="Goa Beach Resort" loading="lazy">
              <div class="pkg-badges-top">
                <span class="badge badge-primary" style="font-size:11px;">🏖️ Beach Holiday</span>
                <span class="badge badge-secondary" style="font-size:10px;">🍹 Nightlife &amp; Cruise</span>
              </div>
              <button type="button" class="pkg-wishlist-btn" onclick="toggleWishlist(this, 'Goa Beach Resort & Cruise Retreat', '₹18,000', '../Content/images/img_21.jpg', '/Pages/package-details.aspx?id=goa-beach')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="pkg-body">
              <div class="pkg-meta-row">
                <span><i class="fa-regular fa-clock"></i> 5 Days / 4 Nights</span>
                <span><i class="fa-solid fa-map-location-dot"></i> Calangute, Baga, Panaji</span>
              </div>
              <h3 class="pkg-title">Goa Beach Resort &amp; Cruise Retreat</h3>
              <div class="pkg-inclusions-list">
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-umbrella-beach"></i> 4★ Beachfront</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-ship"></i> Mandovi Cruise</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-water"></i> Water Sports</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-van-shuttle"></i> Airport Transfers</span>
              </div>
              <p class="pkg-desc">
                Soak in tropical sunshine at luxury beachfront resorts, enjoy a luxury sunset dinner cruise on Mandovi river, and explore historic Old Goa churches.
              </p>
              <div style="display:flex; align-items:center; justify-content:space-between; margin-top:auto;">
                <div style="font-size:13px; color:#F59E0B; font-weight:700;">
                  ★ 4.7 <span style="color:var(--text-muted); font-size:12px; font-weight:500;">(520 reviews)</span>
                </div>
                <span class="badge badge-primary" style="font-size:10px;">Family &amp; Friends</span>
              </div>
            </div>
            <div class="pkg-footer">
              <div>
                <div style="font-size:11px; text-transform:uppercase; color:var(--text-muted); font-weight:700;">Starting From</div>
                <div class="pkg-price-val">₹18,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=goa-beach" class="btn btn-primary btn-sm">
                View Itinerary <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Package 6: Manali & Shimla -->
          <article class="pkg-card anim-fade-up" data-title="manali shimla himalayan snow explorer kufri solang rohtang" data-style="snow" data-days="7" data-price="24000" data-rating="4.8" data-reviews="180">
            <div class="pkg-image-wrapper">
              <img src="../Content/images/img_43.jpg" alt="Manali Snow" loading="lazy">
              <div class="pkg-badges-top">
                <span class="badge badge-secondary" style="font-size:11px;">❄️ Snow &amp; Mountains</span>
                <span class="badge badge-dark" style="font-size:10px;">🌲 Pine Valley</span>
              </div>
              <button type="button" class="pkg-wishlist-btn" onclick="toggleWishlist(this, 'Manali-Shimla Himalayan Snow Explorer', '₹24,000', '../Content/images/img_43.jpg', '/Pages/package-details.aspx?id=manali-shimla')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="pkg-body">
              <div class="pkg-meta-row">
                <span><i class="fa-regular fa-clock"></i> 7 Days / 6 Nights</span>
                <span><i class="fa-solid fa-map-location-dot"></i> Shimla, Kufri, Manali</span>
              </div>
              <h3 class="pkg-title">Manali-Shimla Snow Explorer</h3>
              <div class="pkg-inclusions-list">
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-bus"></i> Volvo Luxury Coach</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-snowflake"></i> Solang Snow Pass</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-tree"></i> Valley View Resort</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-fire"></i> Campfire Night</span>
              </div>
              <p class="pkg-desc">
                Trek through fragrant cedar pine forests, experience skiing in Solang Valley, visit historic Hadimba Temple, and shop on Shimla Mall Road.
              </p>
              <div style="display:flex; align-items:center; justify-content:space-between; margin-top:auto;">
                <div style="font-size:13px; color:#F59E0B; font-weight:700;">
                  ★ 4.8 <span style="color:var(--text-muted); font-size:12px; font-weight:500;">(180 reviews)</span>
                </div>
                <span class="badge badge-secondary" style="font-size:10px;">Year-Round Snow</span>
              </div>
            </div>
            <div class="pkg-footer">
              <div>
                <div style="font-size:11px; text-transform:uppercase; color:var(--text-muted); font-weight:700;">Starting From</div>
                <div class="pkg-price-val">₹24,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=manali-shimla" class="btn btn-primary btn-sm">
                View Itinerary <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Package 7: Andaman -->
          <article class="pkg-card anim-fade-up" data-title="andaman luxury coral island tour port blair havelock neil" data-style="island" data-days="6" data-price="42000" data-rating="4.9" data-reviews="240">
            <div class="pkg-image-wrapper">
              <img src="../Content/images/img_33.jpg" alt="Andaman Island Tour" loading="lazy">
              <div class="pkg-badges-top">
                <span class="badge badge-accent" style="font-size:11px;">🏝️ Island Luxury</span>
                <span class="badge badge-success" style="font-size:10px;">🤿 Scuba &amp; Coral</span>
              </div>
              <button type="button" class="pkg-wishlist-btn" onclick="toggleWishlist(this, 'Andaman Luxury Coral Island Tour', '₹42,000', '../Content/images/img_33.jpg', '/Pages/package-details.aspx?id=andaman')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="pkg-body">
              <div class="pkg-meta-row">
                <span><i class="fa-regular fa-clock"></i> 6 Days / 5 Nights</span>
                <span><i class="fa-solid fa-map-location-dot"></i> Port Blair, Havelock, Neil</span>
              </div>
              <h3 class="pkg-title">Andaman Luxury Coral Island Tour</h3>
              <div class="pkg-inclusions-list">
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-ferry"></i> Catamaran Ferry</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-fish"></i> Scuba Diving</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-hotel"></i> 5★ Beach Villa</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-sun"></i> Radhanagar Sunset</span>
              </div>
              <p class="pkg-desc">
                Swim in crystal clear turquoise waters, witness glowing bioluminescence, explore vibrant coral reefs, and relax on Asia's cleanest beaches.
              </p>
              <div style="display:flex; align-items:center; justify-content:space-between; margin-top:auto;">
                <div style="font-size:13px; color:#F59E0B; font-weight:700;">
                  ★ 4.9 <span style="color:var(--text-muted); font-size:12px; font-weight:500;">(240 reviews)</span>
                </div>
                <span class="badge badge-accent" style="font-size:10px;">Island VIP</span>
              </div>
            </div>
            <div class="pkg-footer">
              <div>
                <div style="font-size:11px; text-transform:uppercase; color:var(--text-muted); font-weight:700;">Starting From</div>
                <div class="pkg-price-val">₹42,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=andaman" class="btn btn-primary btn-sm">
                View Itinerary <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Package 8: Golden Triangle -->
          <article class="pkg-card anim-fade-up" data-title="golden triangle delhi agra jaipur taj mahal amber fort" data-style="luxury" data-days="6" data-price="28000" data-rating="4.9" data-reviews="490">
            <div class="pkg-image-wrapper">
              <img src="../Content/images/img_32.jpg" alt="Golden Triangle Tour" loading="lazy">
              <div class="pkg-badges-top">
                <span class="badge badge-accent" style="font-size:11px;">🏛️ World Heritage</span>
                <span class="badge badge-dark" style="font-size:10px;">🕌 Taj Mahal VIP</span>
              </div>
              <button type="button" class="pkg-wishlist-btn" onclick="toggleWishlist(this, 'Golden Triangle (Delhi – Agra – Jaipur)', '₹28,000', '../Content/images/img_32.jpg', '/Pages/package-details.aspx?id=golden-triangle')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="pkg-body">
              <div class="pkg-meta-row">
                <span><i class="fa-regular fa-clock"></i> 6 Days / 5 Nights</span>
                <span><i class="fa-solid fa-map-location-dot"></i> Delhi, Agra, Jaipur</span>
              </div>
              <h3 class="pkg-title">Golden Triangle: Delhi, Agra &amp; Jaipur</h3>
              <div class="pkg-inclusions-list">
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-landmark"></i> Sunrise Taj Mahal</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-car"></i> Private Chauffeur</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-hotel"></i> 4★ Heritage Hotels</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-id-card"></i> Historian Guide</span>
              </div>
              <p class="pkg-desc">
                Marvel at the breathtaking Taj Mahal at sunrise, explore colossal Mughal forts in Agra, and witness the Pink City's majestic Amber Fort palaces.
              </p>
              <div style="display:flex; align-items:center; justify-content:space-between; margin-top:auto;">
                <div style="font-size:13px; color:#F59E0B; font-weight:700;">
                  ★ 4.9 <span style="color:var(--text-muted); font-size:12px; font-weight:500;">(490 reviews)</span>
                </div>
                <span class="badge badge-success" style="font-size:10px;">Iconic India</span>
              </div>
            </div>
            <div class="pkg-footer">
              <div>
                <div style="font-size:11px; text-transform:uppercase; color:var(--text-muted); font-weight:700;">Starting From</div>
                <div class="pkg-price-val">₹28,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=golden-triangle" class="btn btn-primary btn-sm">
                View Itinerary <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

          <!-- Package 9: Varanasi -->
          <article class="pkg-card anim-fade-up" data-title="spiritual varanasi ganges cultural journey sarnath ganga aarti" data-style="spiritual" data-days="4" data-price="16000" data-rating="4.9" data-reviews="350">
            <div class="pkg-image-wrapper">
              <img src="../Content/images/img_39.jpg" alt="Varanasi Spiritual Tour" loading="lazy">
              <div class="pkg-badges-top">
                <span class="badge badge-secondary" style="font-size:11px;">🛕 Spiritual Journey</span>
                <span class="badge badge-dark" style="font-size:10px;">🕯️ Ganga Aarti VIP</span>
              </div>
              <button type="button" class="pkg-wishlist-btn" onclick="toggleWishlist(this, 'Spiritual Varanasi & Ganges Cultural Journey', '₹16,000', '../Content/images/img_39.jpg', '/Pages/package-details.aspx?id=varanasi-spiritual')" aria-label="Add to wishlist">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="pkg-body">
              <div class="pkg-meta-row">
                <span><i class="fa-regular fa-clock"></i> 4 Days / 3 Nights</span>
                <span><i class="fa-solid fa-map-location-dot"></i> Varanasi, Sarnath, Ganges</span>
              </div>
              <h3 class="pkg-title">Spiritual Varanasi &amp; Ganges Odyssey</h3>
              <div class="pkg-inclusions-list">
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-sailboat"></i> Sunrise Ganges Boat</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-fire"></i> VIP Aarti Seating</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-hotel"></i> Ghat-side Heritage</span>
                <span class="pkg-inclusion-pill"><i class="fa-solid fa-dharmachakra"></i> Sarnath Tour</span>
              </div>
              <p class="pkg-desc">
                Immerse in the eternal city of Varanasi with private dawn boat rows, the mystical evening Ganga Aarti ceremony, and Buddhist heritage at Sarnath.
              </p>
              <div style="display:flex; align-items:center; justify-content:space-between; margin-top:auto;">
                <div style="font-size:13px; color:#F59E0B; font-weight:700;">
                  ★ 4.9 <span style="color:var(--text-muted); font-size:12px; font-weight:500;">(350 reviews)</span>
                </div>
                <span class="badge badge-secondary" style="font-size:10px;">Cultural Classic</span>
              </div>
            </div>
            <div class="pkg-footer">
              <div>
                <div style="font-size:11px; text-transform:uppercase; color:var(--text-muted); font-weight:700;">Starting From</div>
                <div class="pkg-price-val">₹16,000</div>
              </div>
              <a href="/Pages/package-details.aspx?id=varanasi-spiritual" class="btn btn-primary btn-sm">
                View Itinerary <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
              </a>
            </div>
          </article>

        </div>

        <!-- No Results Fallback Card -->
        <div id="noResultsCard" class="card p-32 text-center" style="display:none; padding:48px 24px; border:2px dashed var(--gray-300); margin-top:20px;">
          <div style="font-size:52px; margin-bottom:12px;">🔍</div>
          <h3 style="font-size:20px; font-weight:800; color:var(--text-primary); margin-bottom:6px;">No Matching Tour Packages Found</h3>
          <p style="font-size:14px; color:var(--text-secondary); max-width:440px; margin:0 auto 20px;">
            We couldn't find packages matching your current filter criteria. Try changing your search query or reset filters.
          </p>
          <button type="button" class="btn btn-primary" onclick="resetAllFilters()">
            <i class="fa-solid fa-rotate-left" style="margin-right:6px;"></i> Show All 9 Packages
          </button>
        </div>

      </div>
    </section>

    <!-- Custom Trip Inquiry CTA Banner -->
    <section class="section" style="background:linear-gradient(135deg, #0b1329 0%, #1e293b 100%); color:white; padding:70px 0;">
      <div class="container text-center">
        <div class="anim-fade-up">
          <span class="badge" style="background:rgba(14,165,233,0.2); border:1px solid rgba(14,165,233,0.4); color:#38BDF8; padding:6px 18px; font-size:12px; font-weight:700; border-radius:999px; margin-bottom:14px; display:inline-block;">
            ✨ Tailor-Made Private Itineraries
          </span>
          <h2 class="section-title" style="color:white; font-size:clamp(28px, 4vw, 44px); margin-top:8px; margin-bottom:12px;">Want a Custom Handcrafted India Tour?</h2>
          <p style="color:rgba(255,255,255,0.85); max-width:580px; margin:0 auto 28px; font-size:16px; line-height:1.7;">
            Tell our senior curators your dream destinations, group size, and budget. We will design a custom luxury itinerary within 30 minutes.
          </p>
          <div style="display:flex; justify-content:center; gap:16px; flex-wrap:wrap;">
            <a href="/Pages/contact.aspx" class="btn btn-primary btn-lg" style="box-shadow:0 6px 20px rgba(14,165,233,0.4);">
              <i class="fa-solid fa-paper-plane" style="margin-right:8px;"></i> Request Custom Itinerary
            </a>
            <a href="tel:+919099107637" class="btn btn-secondary btn-lg" style="background:rgba(255,255,255,0.1); color:white; border-color:rgba(255,255,255,0.3);">
              <i class="fa-solid fa-phone-volume" style="margin-right:8px; color:#38BDF8;"></i> Call +91 90991 07637
            </a>
          </div>
        </div>
      </div>
    </section>

  <script>
    // Live Multi-Filter & Search Engine
    function filterPackages() {
      const search = document.getElementById('pkg-search').value.toLowerCase().trim();
      const style = document.getElementById('pkg-category').value;
      const duration = document.getElementById('pkg-duration').value;

      const cards = Array.from(document.querySelectorAll('#packages-grid .pkg-card'));
      let visibleCount = 0;

      cards.forEach(card => {
        const title = (card.dataset.title || '').toLowerCase();
        const cardStyle = card.dataset.style;
        const days = parseInt(card.dataset.days || 0);

        let match = true;

        if (search && !title.includes(search)) match = false;
        if (style !== 'all' && cardStyle !== style) match = false;

        if (duration === 'short' && days > 4) match = false;
        if (duration === 'medium' && (days < 5 || days > 8)) match = false;
        if (duration === 'long' && days < 9) match = false;

        card.style.display = match ? 'flex' : 'none';
        if (match) visibleCount++;
      });

      // Update Results Counter
      const counter = document.getElementById('resultsCount');
      if (counter) counter.innerText = `Showing ${visibleCount}`;

      // Show/Hide No Results Card
      const noRes = document.getElementById('noResultsCard');
      if (noRes) noRes.style.display = visibleCount === 0 ? 'block' : 'none';
    }

    // Sort & Filter
    function sortAndFilterPackages() {
      const sortType = document.getElementById('pkg-sort').value;
      const grid = document.getElementById('packages-grid');
      const cards = Array.from(grid.querySelectorAll('.pkg-card'));

      cards.sort((a, b) => {
        const priceA = parseInt(a.dataset.price || 0);
        const priceB = parseInt(b.dataset.price || 0);
        const ratingA = parseFloat(a.dataset.rating || 0);
        const ratingB = parseFloat(b.dataset.rating || 0);
        const daysA = parseInt(a.dataset.days || 0);
        const daysB = parseInt(b.dataset.days || 0);
        const reviewsA = parseInt(a.dataset.reviews || 0);
        const reviewsB = parseInt(b.dataset.reviews || 0);

        if (sortType === 'price-low') return priceA - priceB;
        if (sortType === 'price-high') return priceB - priceA;
        if (sortType === 'rating') return ratingB - ratingA;
        if (sortType === 'duration') return daysB - daysA;
        return reviewsB - reviewsA; // 'popular'
      });

      cards.forEach(card => grid.appendChild(card));
      filterPackages();
    }

    // Quick Filter Pill Selection
    function selectPill(btn, style) {
      document.querySelectorAll('#pill-filters .category-pill').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      document.getElementById('pkg-category').value = style;
      filterPackages();
    }

    // Reset All Filters
    function resetAllFilters() {
      document.getElementById('pkg-search').value = '';
      document.getElementById('pkg-category').value = 'all';
      document.getElementById('pkg-duration').value = 'all';
      document.getElementById('pkg-sort').value = 'popular';

      document.querySelectorAll('#pill-filters .category-pill').forEach(b => b.classList.remove('active'));
      const firstPill = document.querySelector('#pill-filters .category-pill');
      if (firstPill) firstPill.classList.add('active');

      sortAndFilterPackages();
      Toast.show('All package filters reset', 'info');
    }

    // Wishlist Persistence in localStorage
    function toggleWishlist(btn, title, price, image, href) {
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

    // Initialize Wishlist active states and URL query parameters on load
    document.addEventListener('DOMContentLoaded', () => {
      const user = window.EPIC_USER || {};
      const email = (user.email || 'guest').toLowerCase();
      const key = 'epic_wishlist_' + email;

      try {
        const wishlist = JSON.parse(localStorage.getItem(key) || '[]');
        const wishTitles = wishlist.map(w => w.title);

        document.querySelectorAll('.pkg-card').forEach(card => {
          const title = card.querySelector('.pkg-title')?.innerText.trim();
          const btn = card.querySelector('.pkg-wishlist-btn');
          if (title && wishTitles.includes(title) && btn) {
            btn.classList.add('active');
            btn.innerHTML = '<i class="fa-solid fa-heart"></i>';
          }
        });
      } catch(e) {}

      // Handle URL parameter e.g. ?type=luxury
      const params = new URLSearchParams(window.location.search);
      const type = params.get('type');
      if (type) {
        const catSelect = document.getElementById('pkg-category');
        if (catSelect) catSelect.value = type;
        
        const pill = Array.from(document.querySelectorAll('#pill-filters .category-pill')).find(p => p.getAttribute('onclick')?.includes(`'${type}'`));
        if (pill) {
          document.querySelectorAll('#pill-filters .category-pill').forEach(b => b.classList.remove('active'));
          pill.classList.add('active');
        }
        filterPackages();
      }
    });
  </script>
</asp:Content>

