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
      display: grid !important;
      grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
      gap: 30px !important;
      align-items: stretch !important;
      width: 100%;
    }

    /* Seamless DataList Integration: flatten outer span, stretch item wrapper spans */
    #packages-grid > span[id$="DataList1"] {
      display: contents !important;
    }

    #packages-grid > span:not([id$="DataList1"]),
    #packages-grid > span > span {
      display: flex;
      flex-direction: column;
      height: 100%;
      min-width: 0;
    }

    /* Hide any <br> tags emitted by DataList so they never occupy grid cells */
    #packages-grid br,
    #packages-grid span br {
      display: none !important;
    }

    .pkg-card {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      overflow: hidden;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      display: flex;
      flex-direction: column;
      height: 100%;
      width: 100%;
      flex: 1;
      min-width: 0;
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
      flex-shrink: 0;
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
      text-decoration: none !important;
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
      gap: 8px;
      font-size: 12px;
      font-weight: 700;
      color: var(--primary);
      margin-bottom: 8px;
      min-height: 20px;
    }

    .pkg-meta-row > div:first-child {
      flex-shrink: 0;
    }

    .pkg-meta-row > div:last-child {
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      text-align: right;
    }

    .pkg-title {
      font-size: 19px;
      font-weight: 800;
      color: var(--text-primary);
      margin-bottom: 12px;
      line-height: 1.35;
      min-height: 52px;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }

    .pkg-inclusions-list {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 6px 8px;
      margin-bottom: 14px;
      min-height: 58px;
    }

    .pkg-inclusion-pill {
      font-size: 11px;
      font-weight: 600;
      padding: 4px 8px;
      border-radius: var(--radius-sm);
      background: var(--bg-secondary);
      color: var(--text-secondary);
      border: 1px solid var(--gray-200);
      display: flex;
      align-items: center;
      gap: 5px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      min-width: 0;
      height: 26px;
      box-sizing: border-box;
    }

    .pkg-inclusion-pill i {
      flex-shrink: 0;
      color: var(--primary);
      font-size: 11px;
    }

    .pkg-inclusion-pill span {
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    .pkg-desc {
      font-size: 13px;
      color: var(--text-secondary);
      line-height: 1.6;
      margin-bottom: 16px;
      min-height: 63px;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }

    .pkg-rating-row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-top: auto;
      padding-top: 10px;
      min-height: 28px;
    }

    .pkg-footer {
      padding: 16px 24px;
      background: var(--bg-secondary);
      border-top: 1px solid var(--gray-200);
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      min-height: 74px;
      box-sizing: border-box;
      margin-top: auto;
      flex-shrink: 0;
    }

    .pkg-price-val {
      font-size: 22px;
      font-weight: 800;
      color: var(--primary);
      line-height: 1.1;
    }

    @media (max-width: 1100px) {
      .packages-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
      }
    }

    @media (max-width: 768px) {
      .packages-grid {
        grid-template-columns: 1fr !important;
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

          <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
              <asp:Panel ID="pnlCard" runat="server" CssClass="pkg-card anim-fade-up" 
                         data-title='<%# Eval("Pkg_SearchKeywords") %>' 
                         data-style='<%# Eval("Pkg_Style") %>' 
                         data-days='<%# Eval("Pkg_Days") %>' 
                         data-price='<%# Eval("Pkg_Price") %>' 
                         data-rating='<%# Eval("Pkg_Rating") %>' 
                         data-reviews='<%# Eval("Pkg_Reviews") %>'>
                
                <asp:Panel ID="pnlImageWrapper" runat="server" CssClass="pkg-image-wrapper">
                  <asp:Image ID="imgPkg" runat="server" ImageUrl='<%# Eval("Pkg_Image") %>' AlternateText='<%# Eval("Pkg_Title") %>' />
                  <asp:Panel ID="pnlBadgesTop" runat="server" CssClass="pkg-badges-top">
                    <asp:Label ID="lblBadge1" runat="server" CssClass='<%# "badge " + Eval("Pkg_Badge1_Class") %>' Text='<%# Eval("Pkg_Badge1") %>' style="font-size:11px;" />
                    <asp:Label ID="lblBadge2" runat="server" CssClass='<%# "badge " + Eval("Pkg_Badge2_Class") %>' Text='<%# Eval("Pkg_Badge2") %>' style="font-size:10px;" />
                  </asp:Panel>
                  <asp:LinkButton ID="btnWishlist" runat="server" CssClass="pkg-wishlist-btn" 
                                  OnClientClick='<%# "toggleWishlist(this, \"" + Eval("Pkg_Title") + "\", \"₹" + Eval("Pkg_Price", "{0:N0}") + "\", \"" + Eval("Pkg_Image") + "\", \"" + Eval("Pkg_DetailsUrl") + "\"); return false;" %>' 
                                  aria-label="Add to wishlist">
                    <i class="fa-regular fa-heart"></i>
                  </asp:LinkButton>
                </asp:Panel>

                <asp:Panel ID="pnlBody" runat="server" CssClass="pkg-body">
                  <asp:Panel ID="pnlMetaRow" runat="server" CssClass="pkg-meta-row">
                    <asp:Panel ID="pnlDuration" runat="server">
                      <i class="fa-regular fa-clock"></i>
                      <asp:Label ID="lblDuration" runat="server" Text='<%# " " + Eval("Pkg_Duration") %>' />
                    </asp:Panel>
                    <asp:Panel ID="pnlLocation" runat="server">
                      <i class="fa-solid fa-map-location-dot"></i>
                      <asp:Label ID="lblLocation" runat="server" Text='<%# " " + Eval("Pkg_Location") %>' />
                    </asp:Panel>
                  </asp:Panel>

                  <asp:Label ID="lblTitle" runat="server" CssClass="pkg-title" Text='<%# Eval("Pkg_Title") %>' />

                  <asp:Panel ID="pnlInclusions" runat="server" CssClass="pkg-inclusions-list">
                    <asp:Panel ID="pnlInc1" runat="server" CssClass="pkg-inclusion-pill">
                      <i class='<%# "fa-solid " + Eval("Pkg_Inclusion1_Icon") %>'></i>
                      <asp:Label ID="lblInc1" runat="server" Text='<%# " " + Eval("Pkg_Inclusion1_Text") %>' />
                    </asp:Panel>
                    <asp:Panel ID="pnlInc2" runat="server" CssClass="pkg-inclusion-pill">
                      <i class='<%# "fa-solid " + Eval("Pkg_Inclusion2_Icon") %>'></i>
                      <asp:Label ID="lblInc2" runat="server" Text='<%# " " + Eval("Pkg_Inclusion2_Text") %>' />
                    </asp:Panel>
                    <asp:Panel ID="pnlInc3" runat="server" CssClass="pkg-inclusion-pill">
                      <i class='<%# "fa-solid " + Eval("Pkg_Inclusion3_Icon") %>'></i>
                      <asp:Label ID="lblInc3" runat="server" Text='<%# " " + Eval("Pkg_Inclusion3_Text") %>' />
                    </asp:Panel>
                    <asp:Panel ID="pnlInc4" runat="server" CssClass="pkg-inclusion-pill">
                      <i class='<%# "fa-solid " + Eval("Pkg_Inclusion4_Icon") %>'></i>
                      <asp:Label ID="lblInc4" runat="server" Text='<%# " " + Eval("Pkg_Inclusion4_Text") %>' />
                    </asp:Panel>
                  </asp:Panel>

                  <asp:Label ID="lblDesc" runat="server" CssClass="pkg-desc" Text='<%# Eval("Pkg_Description") %>' />

                  <asp:Panel ID="pnlRatingRow" runat="server" CssClass="pkg-rating-row">
                    <asp:Panel ID="pnlRatingWrap" runat="server" style="font-size:13px; color:#F59E0B; font-weight:700;">
                      <asp:Label ID="lblRating" runat="server" Text='<%# "★ " + Eval("Pkg_Rating") %>' />
                      <asp:Label ID="lblReviews" runat="server" style="color:var(--text-muted); font-size:12px; font-weight:500;" Text='<%# " (" + Eval("Pkg_Reviews") + " reviews)" %>' />
                    </asp:Panel>
                    <asp:Label ID="lblBottomBadge" runat="server" CssClass='<%# "badge " + Eval("Pkg_BottomBadge_Class") %>' style="font-size:10px;" Text='<%# Eval("Pkg_BottomBadge") %>' />
                  </asp:Panel>
                </asp:Panel>

                <asp:Panel ID="pnlFooter" runat="server" CssClass="pkg-footer">
                  <asp:Panel ID="pnlPriceWrap" runat="server">
                    <asp:Label ID="lblStartFrom" runat="server" style="font-size:11px; text-transform:uppercase; color:var(--text-muted); font-weight:700; display:block;" Text="Starting From" />
                    <asp:Label ID="lblPrice" runat="server" CssClass="pkg-price-val" Text='<%# "₹" + Eval("Pkg_Price", "{0:N0}") %>' />
                  </asp:Panel>

                  <asp:LinkButton ID="btnItinerary" runat="server" CssClass="btn btn-primary btn-sm" 
                                  CommandName="cmd_details" 
                                  CommandArgument='<%# Eval("Pkg_DetailsUrl") %>'>
                    View Itinerary <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
                  </asp:LinkButton>
                </asp:Panel>

              </asp:Panel>
            </ItemTemplate>
          </asp:DataList>

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

        const wrapper = (card.parentElement && card.parentElement.tagName === 'SPAN' && card.parentElement.id !== 'packages-grid') ? card.parentElement : card;
        wrapper.style.display = match ? 'flex' : 'none';
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

      cards.forEach(card => {
        const wrapper = (card.parentElement && card.parentElement.tagName === 'SPAN' && card.parentElement.id !== 'packages-grid') ? card.parentElement : card;
        grid.appendChild(wrapper);
      });
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

