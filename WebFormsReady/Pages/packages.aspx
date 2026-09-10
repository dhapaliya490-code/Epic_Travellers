<%@ Page Title="Tour Packages – Epic-Travellers | Handcrafted India Tours" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="packages.aspx.cs" Inherits="Epic_Travelers.Pages.packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Book premium Indian tour packages with Epic-Travellers. Family holidays, luxury honeymoons, adventure expeditions, and solo travel packages across Incredible India.">
  <meta name="keywords" content="India tour packages, honeymoon packages, family trips India, adventure tour India, luxury Rajasthan package, Kerala holiday package">

  <style>
    .page-hero {
      background: linear-gradient(135deg, rgba(15,23,42,0.85) 0%, rgba(20,184,166,0.7) 100%),
                  url('../Content/images/img_45.jpg') center/cover;
      padding: 140px 0 80px;
      color: white;
      text-align: center;
    }

    .package-filter-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 24px;
      box-shadow: var(--shadow-lg);
      border: 1px solid var(--gray-200);
      margin-top: -50px;
      position: relative;
      z-index: 10;
    }

    .category-pill {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 10px 20px;
      border-radius: var(--radius-full);
      background: var(--gray-100);
      color: var(--text-secondary);
      font-weight: 600;
      font-size: 14px;
      cursor: pointer;
      border: 1px solid var(--gray-200);
      transition: var(--transition-fast);
    }

    .category-pill:hover, .category-pill.active {
      background: var(--gradient-primary);
      color: white;
      border-color: transparent;
      box-shadow: var(--shadow-md);
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
        <h1 class="section-title" style="color:white; font-size:clamp(32px, 5vw, 54px);">
          Handcrafted <span style="color:var(--accent-light);">India Packages</span>
        </h1>
        <p style="color:rgba(255,255,255,0.85); max-width:600px; margin:0 auto; font-size:16px;">
          Choose from 200+ curated tour itineraries. All packages include luxury stays, expert local guides, and 24/7 support.
        </p>
      </div>
    </section>

    <!-- Filter Card -->
    <section class="section" style="padding-top:0;">
      <div class="container">
        <div class="package-filter-card anim-fade-up">
          <div class="grid grid-4" style="gap:16px;">
            <div>
              <label class="form-label" for="pkg-search"><i class="fa-solid fa-magnifying-glass"></i> Package Name</label>
              <input type="text" id="pkg-search" class="form-control" placeholder="Search packages..." oninput="filterPackages()">
            </div>
            <div>
              <label class="form-label" for="pkg-category"><i class="fa-solid fa-list"></i> Travel Style</label>
              <select id="pkg-category" class="form-control filter-select" onchange="filterPackages()">
                <option value="all">All Styles</option>
                <option value="luxury">👑 Luxury Packages</option>
                <option value="family">👨‍👩‍👧 Family Trips</option>
                <option value="honeymoon">💑 Honeymoon Specials</option>
                <option value="adventure">🧗 Adventure & Wildlife</option>
                <option value="solo">🧳 Solo Travel</option>
                <option value="group">👥 Group Tours</option>
              </select>
            </div>
            <div>
              <label class="form-label" for="pkg-duration"><i class="fa-regular fa-clock"></i> Duration</label>
              <select id="pkg-duration" class="form-control filter-select" onchange="filterPackages()">
                <option value="all">Any Duration</option>
                <option value="short">1 - 4 Days</option>
                <option value="medium">5 - 8 Days</option>
                <option value="long">9+ Days</option>
              </select>
            </div>
            <div>
              <label class="form-label" for="pkg-budget"><i class="fa-solid fa-tag"></i> Max Price / Person</label>
              <select id="pkg-budget" class="form-control filter-select" onchange="filterPackages()">
                <option value="all">Any Price</option>
                <option value="15000">Under ₹15,000</option>
                <option value="25000">Under ₹25,000</option>
                <option value="40000">Under ₹40,000</option>
              </select>
            </div>
          </div>
        </div>

        <!-- Quick Filter Pills -->
        <div class="flex-center gap-12 flex-wrap mt-32 mb-32" id="pill-filters">
          <button type="button" class="category-pill active" onclick="selectPill(this, 'all')">🌟 All Packages</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'luxury')">👑 Luxury</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'family')">👨‍👩‍👧 Family</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'honeymoon')">💑 Honeymoon</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'adventure')">🧗 Adventure</button>
          <button type="button" class="category-pill" onclick="selectPill(this, 'solo')">🧳 Solo</button>
        </div>
      </div>
    </section>

    <!-- Packages List Grid -->
    <section class="section" style="padding-top:0;">
      <div class="container">
        <div class="grid grid-3 stagger-children" id="packages-grid">

          <!-- Package 1 -->
          <article class="package-card anim-fade-up" data-title="royal rajasthan expedition" data-style="luxury" data-days="8" data-price="25000">
            <div class="package-card-image">
              <img src="../Content/images/img_48.jpg" alt="Royal Rajasthan" loading="lazy">
              <div class="package-card-badges">
                <span class="badge badge-accent">⭐ Bestseller</span>
                <span class="badge badge-dark">👑 Luxury</span>
              </div>
              <button type="button" class="destination-card-wishlist wishlist-btn" data-id="pkg-rajasthan" aria-label="Wishlist Royal Rajasthan">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="package-card-body">
              <h3 class="package-card-title">Royal Rajasthan Expedition</h3>
              <div class="package-card-highlights">
                <span class="package-highlight"><i class="fa-regular fa-clock"></i> 8 Days / 7 Nights</span>
                <span class="package-highlight"><i class="fa-solid fa-location-dot"></i> Jaipur, Udaipur, Jodhpur</span>
              </div>
              <div class="package-features">
                <span class="package-feature">✓ Heritage Hotels</span>
                <span class="package-feature">✓ Desert Safari</span>
                <span class="package-feature">✓ All Meals</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); margin-top:12px; line-height:1.6;">
                Experience royal Indian hospitality with stay at luxury palaces, camel safari in Thar desert, and private guided fort tours.
              </p>
              <div class="stars mt-12">★★★★★ <span style="font-size:12px; color:var(--text-muted);">(328 reviews)</span></div>
            </div>
            <div class="package-card-footer">
              <div class="package-price">
                <small>Starting from</small>
                <strong data-price-inr="25000">₹25,000</strong>
              </div>
              <a href="/Pages/package-details.aspx?id=royal-rajasthan" class="btn btn-primary btn-sm">View Details</a>
            </div>
          </article>

          <!-- Package 2 -->
          <article class="package-card anim-fade-up" data-title="kerala backwaters honeymoon" data-style="honeymoon" data-days="6" data-price="18000">
            <div class="package-card-image">
              <img src="../Content/images/img_55.jpg" alt="Kerala Houseboat" loading="lazy">
              <div class="package-card-badges">
                <span class="badge badge-secondary">💑 Honeymoon</span>
              </div>
              <button type="button" class="destination-card-wishlist wishlist-btn" data-id="pkg-kerala" aria-label="Wishlist Kerala">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="package-card-body">
              <h3 class="package-card-title">Kerala Backwaters Romantic Bliss</h3>
              <div class="package-card-highlights">
                <span class="package-highlight"><i class="fa-regular fa-clock"></i> 6 Days / 5 Nights</span>
                <span class="package-highlight"><i class="fa-solid fa-location-dot"></i> Munnar, Alleppey, Kovalam</span>
              </div>
              <div class="package-features">
                <span class="package-feature">✓ Private Houseboat</span>
                <span class="package-feature">✓ Candlelight Dinner</span>
                <span class="package-feature">✓ Spa</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); margin-top:12px; line-height:1.6;">
                Unwind on a luxury houseboat cruise, wander tea garden trails in Munnar, and relax on Kovalam beach.
              </p>
              <div class="stars mt-12">★★★★★ <span style="font-size:12px; color:var(--text-muted);">(412 reviews)</span></div>
            </div>
            <div class="package-card-footer">
              <div class="package-price">
                <small>Starting from</small>
                <strong data-price-inr="18000">₹18,000</strong>
              </div>
              <a href="/Pages/package-details.aspx?id=kerala" class="btn btn-primary btn-sm">View Details</a>
            </div>
          </article>

          <!-- Package 3 -->
          <article class="package-card anim-fade-up" data-title="ladakh bike adventure" data-style="adventure" data-days="10" data-price="32000">
            <div class="package-card-image">
              <img src="../Content/images/img_14.jpg" alt="Ladakh Bike" loading="lazy">
              <div class="package-card-badges">
                <span class="badge badge-danger">🧗 Extreme Adventure</span>
              </div>
              <button type="button" class="destination-card-wishlist wishlist-btn" data-id="pkg-ladakh" aria-label="Wishlist Ladakh">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="package-card-body">
              <h3 class="package-card-title">Ladakh High Altitude Bike Expedition</h3>
              <div class="package-card-highlights">
                <span class="package-highlight"><i class="fa-regular fa-clock"></i> 10 Days / 9 Nights</span>
                <span class="package-highlight"><i class="fa-solid fa-location-dot"></i> Leh, Khardung La, Nubra</span>
              </div>
              <div class="package-features">
                <span class="package-feature">✓ Himalayan Bike</span>
                <span class="package-feature">✓ Camping Stays</span>
                <span class="package-feature">✓ Support Vehicle</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); margin-top:12px; line-height:1.6;">
                Ride across world's highest motorable passes, camp under starry skies at Pangong Lake, and explore Nubra Valley.
              </p>
              <div class="stars mt-12">★★★★★ <span style="font-size:12px; color:var(--text-muted);">(289 reviews)</span></div>
            </div>
            <div class="package-card-footer">
              <div class="package-price">
                <small>Starting from</small>
                <strong data-price-inr="32000">₹32,000</strong>
              </div>
              <a href="/Pages/package-details.aspx?id=ladakh-adventure" class="btn btn-primary btn-sm">View Details</a>
            </div>
          </article>

          <!-- Package 4 -->
          <article class="package-card anim-fade-up" data-title="goa beach carnival family" data-style="family" data-days="5" data-price="12000">
            <div class="package-card-image">
              <img src="../Content/images/img_21.jpg" alt="Goa Family" loading="lazy">
              <div class="package-card-badges">
                <span class="badge badge-primary">👨‍👩‍👧 Family Fun</span>
              </div>
              <button type="button" class="destination-card-wishlist wishlist-btn" data-id="pkg-goa" aria-label="Wishlist Goa">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="package-card-body">
              <h3 class="package-card-title">Goa Beach Resort & Cruise Retreat</h3>
              <div class="package-card-highlights">
                <span class="package-highlight"><i class="fa-regular fa-clock"></i> 5 Days / 4 Nights</span>
                <span class="package-highlight"><i class="fa-solid fa-location-dot"></i> Calangute, Baga, Panaji</span>
              </div>
              <div class="package-features">
                <span class="package-feature">✓ 4★ Beach Resort</span>
                <span class="package-feature">✓ Sunset Cruise</span>
                <span class="package-feature">✓ Water Sports</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); margin-top:12px; line-height:1.6;">
                Perfect family getaway with beachfront pool, Mandovi river cruise, spice plantation tour, and water activities.
              </p>
              <div class="stars mt-12">★★★★★ <span style="font-size:12px; color:var(--text-muted);">(521 reviews)</span></div>
            </div>
            <div class="package-card-footer">
              <div class="package-price">
                <small>Starting from</small>
                <strong data-price-inr="12000">₹12,000</strong>
              </div>
              <a href="/Pages/package-details.aspx?id=goa-beach" class="btn btn-primary btn-sm">View Details</a>
            </div>
          </article>

          <!-- Package 5 -->
          <article class="package-card anim-fade-up" data-title="manali shimla snow solo group" data-style="solo" data-days="7" data-price="16000">
            <div class="package-card-image">
              <img src="../Content/images/img_43.jpg" alt="Manali Snow" loading="lazy">
              <div class="package-card-badges">
                <span class="badge badge-secondary">❄️ Hill & Snow</span>
              </div>
              <button type="button" class="destination-card-wishlist wishlist-btn" data-id="pkg-manali" aria-label="Wishlist Manali">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="package-card-body">
              <h3 class="package-card-title">Manali-Shimla Himalayan Solo Explorer</h3>
              <div class="package-card-highlights">
                <span class="package-highlight"><i class="fa-regular fa-clock"></i> 7 Days / 6 Nights</span>
                <span class="package-highlight"><i class="fa-solid fa-location-dot"></i> Shimla, Kufri, Manali</span>
              </div>
              <div class="package-features">
                <span class="package-feature">✓ Volvo Transfers</span>
                <span class="package-feature">✓ Solang Adventure</span>
                <span class="package-feature">✓ Hotel Stay</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); margin-top:12px; line-height:1.6;">
                Walk through pine forests, experience snow sports in Solang Valley, visit Hadimba Temple, and shop at Mall Road.
              </p>
              <div class="stars mt-12">★★★★★ <span style="font-size:12px; color:var(--text-muted);">(367 reviews)</span></div>
            </div>
            <div class="package-card-footer">
              <div class="package-price">
                <small>Starting from</small>
                <strong data-price-inr="16000">₹16,000</strong>
              </div>
              <a href="/Pages/package-details.aspx?id=manali-shimla" class="btn btn-primary btn-sm">View Details</a>
            </div>
          </article>

          <!-- Package 6 -->
          <article class="package-card anim-fade-up" data-title="andaman island escape luxury" data-style="luxury" data-days="6" data-price="22000">
            <div class="package-card-image">
              <img src="../Content/images/img_33.jpg" alt="Andaman Island" loading="lazy">
              <div class="package-card-badges">
                <span class="badge badge-accent">🏝️ Island Paradise</span>
              </div>
              <button type="button" class="destination-card-wishlist wishlist-btn" data-id="pkg-andaman" aria-label="Wishlist Andaman">
                <i class="fa-regular fa-heart"></i>
              </button>
            </div>
            <div class="package-card-body">
              <h3 class="package-card-title">Andaman Luxury Coral Island Tour</h3>
              <div class="package-card-highlights">
                <span class="package-highlight"><i class="fa-regular fa-clock"></i> 6 Days / 5 Nights</span>
                <span class="package-highlight"><i class="fa-solid fa-location-dot"></i> Port Blair, Havelock, Neil</span>
              </div>
              <div class="package-features">
                <span class="package-feature">✓ Catamaran Ferry</span>
                <span class="package-feature">✓ Scuba & Snorkel</span>
                <span class="package-feature">✓ Beach Resort</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); margin-top:12px; line-height:1.6;">
                Explore turquoise waters, underwater marine life, Elephant beach glass-bottom boat, and Radhanagar beach sunset.
              </p>
              <div class="stars mt-12">★★★★★ <span style="font-size:12px; color:var(--text-muted);">(198 reviews)</span></div>
            </div>
            <div class="package-card-footer">
              <div class="package-price">
                <small>Starting from</small>
                <strong data-price-inr="22000">₹22,000</strong>
              </div>
              <a href="/Pages/package-details.aspx?id=andaman" class="btn btn-primary btn-sm">View Details</a>
            </div>
          </article>

        </div>
      </div>
    </section>

    <!-- Custom Trip CTA -->
    <section class="section" style="background:linear-gradient(135deg, #0f172a 0%, #1e293b 100%); color:white;">
      <div class="container text-center">
        <div class="anim-fade-up">
          <div class="section-label" style="background:rgba(255,255,255,0.1); border-color:rgba(255,255,255,0.2); color:var(--primary-light);">
            ✨ Custom Packages
          </div>
          <h2 class="section-title" style="color:white; margin-top:16px;">Want a Custom Tailored Trip?</h2>
          <p style="color:rgba(255,255,255,0.8); max-width:550px; margin:0 auto 32px; font-size:16px;">
            Tell our travel specialists your dream Indian destinations, group size, and budget. We'll design a customized itinerary within 2 hours.
          </p>
          <a href="/Pages/contact.aspx" class="btn btn-primary btn-lg">Request Custom Itinerary <i class="fa-solid fa-paper-plane"></i></a>
        </div>
      </div>
    </section>
  <script>
    function filterPackages() {
      const search = document.getElementById('pkg-search').value.toLowerCase().trim();
      const style = document.getElementById('pkg-category').value;
      const duration = document.getElementById('pkg-duration').value;
      const budget = document.getElementById('pkg-budget').value;

      const cards = document.querySelectorAll('#packages-grid .package-card');

      cards.forEach(card => {
        const title = card.dataset.title.toLowerCase();
        const cardStyle = card.dataset.style;
        const days = parseInt(card.dataset.days);
        const price = parseInt(card.dataset.price);

        let match = true;

        if (search && !title.includes(search)) match = false;
        if (style !== 'all' && cardStyle !== style) match = false;

        if (duration === 'short' && days > 4) match = false;
        if (duration === 'medium' && (days < 5 || days > 8)) match = false;
        if (duration === 'long' && days < 9) match = false;

        if (budget !== 'all' && price > parseInt(budget)) match = false;

        card.style.display = match ? 'flex' : 'none';
      });
    }

    function selectPill(btn, style) {
      document.querySelectorAll('#pill-filters .category-pill').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      document.getElementById('pkg-category').value = style;
      filterPackages();
    }

    // Auto set parameter if passed via URL
    document.addEventListener('DOMContentLoaded', () => {
      const params = new URLSearchParams(window.location.search);
      const type = params.get('type');
      if (type) {
        document.getElementById('pkg-category').value = type;
        const pill = Array.from(document.querySelectorAll('#pill-filters .category-pill')).find(p => p.getAttribute('onclick').includes(`'${type}'`));
        if (pill) {
          document.querySelectorAll('#pill-filters .category-pill').forEach(b => b.classList.remove('active'));
          pill.classList.add('active');
        }
        filterPackages();
      }
    });
  </script>
</asp:Content>
