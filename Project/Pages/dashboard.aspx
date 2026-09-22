<%@ Page Title="User Dashboard – Epic-Travellers | My Trips & Bookings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Epic_Travelers.Pages.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="User Dashboard – Manage your Epic-Travellers bookings, saved wishlists, payment invoices, and user profile.">

  <style>
    .dashboard-layout {
      display: grid;
      grid-template-columns: 280px 1fr;
      gap: 32px;
      padding-top: calc(var(--header-height) + 32px);
      padding-bottom: 80px;
    }

    .dashboard-sidebar {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 24px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      height: max-content;
      position: sticky;
      top: calc(var(--header-height) + 24px);
    }

    .dash-menu-item {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 12px 16px;
      border-radius: var(--radius-md);
      font-size: 14px;
      font-weight: 500;
      color: var(--text-secondary);
      cursor: pointer;
      transition: var(--transition-fast);
      text-decoration: none;
      margin-bottom: 6px;
      border: none;
      background: transparent;
      width: 100%;
      text-align: left;
    }

    .dash-menu-item i {
      width: 18px;
      text-align: center;
    }

    .dash-menu-item:hover, .dash-menu-item.active {
      background: rgba(14,165,233,0.1);
      color: var(--primary);
      font-weight: 700;
    }

    .booking-history-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 20px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      display: flex;
      align-items: center;
      gap: 20px;
      margin-bottom: 16px;
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .booking-history-card:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow-md);
    }

    .empty-state-card {
      text-align: center;
      padding: 48px 24px;
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      border: 2px dashed var(--gray-300);
      margin-top: 12px;
    }

    @media (max-width: 992px) {
      .dashboard-layout { grid-template-columns: 1fr; }
      .booking-history-card { flex-direction: column; align-items: flex-start; }
      .dashboard-sidebar { position: static; }
    }

    /* ===================================================
       PREMIUM TAX INVOICE & TRAVEL VOUCHER MODAL
    =================================================== */
    .invoice-modal-backdrop {
      position: fixed;
      inset: 0;
      background: rgba(15, 23, 42, 0.8);
      backdrop-filter: blur(6px);
      z-index: 99999;
      display: none;
      align-items: center;
      justify-content: center;
      padding: 20px;
      overflow-y: auto;
    }

    .invoice-modal-backdrop.open {
      display: flex;
    }

    .invoice-modal-container {
      background: #FFFFFF;
      border-radius: var(--radius-2xl);
      max-width: 860px;
      width: 100%;
      box-shadow: 0 25px 60px -12px rgba(0, 0, 0, 0.45);
      border: 1px solid rgba(255,255,255,0.2);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      max-height: 92vh;
      animation: modalSlideUp 0.3s cubic-bezier(0.16, 1, 0.3, 1);
    }

    @keyframes modalSlideUp {
      from { opacity: 0; transform: translateY(20px) scale(0.98); }
      to { opacity: 1; transform: translateY(0) scale(1); }
    }

    .invoice-top-actions {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 14px 24px;
      background: #0b1329;
      color: #FFFFFF;
      border-bottom: 1px solid rgba(255,255,255,0.1);
    }

    .invoice-paper-wrapper {
      padding: 36px 40px;
      overflow-y: auto;
      background: #FFFFFF;
      color: #0F172A;
      font-family: 'Outfit', 'Inter', -apple-system, sans-serif;
    }

    .inv-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 20px;
      margin-bottom: 20px;
    }

    .inv-brand-title {
      font-size: 22px;
      font-weight: 800;
      color: #0284c7;
      letter-spacing: -0.5px;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .inv-company-details {
      font-size: 11px;
      color: #64748B;
      line-height: 1.5;
      margin-top: 6px;
    }

    .inv-title-badge {
      display: inline-block;
      font-size: 11px;
      font-weight: 800;
      text-transform: uppercase;
      letter-spacing: 1px;
      background: #0284c7;
      color: #FFFFFF;
      padding: 6px 14px;
      border-radius: 6px;
      margin-bottom: 8px;
    }

    .inv-divider {
      height: 3px;
      background: linear-gradient(90deg, #0284c7, #6366f1, #10b981);
      border-radius: 999px;
      margin: 16px 0 22px;
    }

    .inv-grid-2 {
      display: grid;
      grid-template-columns: 1.1fr 0.9fr;
      gap: 20px;
      margin-bottom: 24px;
      background: #F8FAFC;
      border: 1px solid #E2E8F0;
      border-radius: 12px;
      padding: 16px 18px;
    }

    .inv-section-label {
      font-size: 11px;
      font-weight: 800;
      text-transform: uppercase;
      letter-spacing: 0.8px;
      color: #64748B;
      margin-bottom: 8px;
    }

    .inv-table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
      font-size: 13px;
    }

    .inv-table th {
      background: #F1F5F9;
      color: #334155;
      font-weight: 700;
      text-align: left;
      padding: 10px 14px;
      border-bottom: 2px solid #CBD5E1;
      font-size: 11px;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .inv-table td {
      padding: 12px 14px;
      border-bottom: 1px solid #E2E8F0;
      color: #1E293B;
      vertical-align: top;
    }

    .inv-financials {
      display: flex;
      justify-content: flex-end;
      margin-bottom: 24px;
    }

    .inv-summary-table {
      width: 340px;
      font-size: 13px;
    }

    .inv-summary-row {
      display: flex;
      justify-content: space-between;
      padding: 5px 0;
      color: #475569;
    }

    .inv-total-row {
      display: flex;
      justify-content: space-between;
      padding: 10px 0 4px;
      border-top: 2px solid #0284c7;
      font-size: 16px;
      font-weight: 800;
      color: #0284c7;
    }

    .inv-stamp-badge {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      padding: 6px 12px;
      border: 1.5px solid #16A34A;
      color: #16A34A;
      font-weight: 800;
      border-radius: 6px;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      background: rgba(22, 163, 74, 0.08);
      font-size: 11px;
    }

    /* Print media rule */
    @media print {
      body * {
        visibility: hidden !important;
      }
      #invoiceModal, #invoiceModal * {
        visibility: visible !important;
      }
      #invoiceModal {
        position: fixed !important;
        inset: 0 !important;
        background: white !important;
        padding: 0 !important;
        display: block !important;
        z-index: 999999 !important;
      }
      .invoice-modal-container {
        border: none !important;
        box-shadow: none !important;
        max-width: 100% !important;
        max-height: none !important;
        border-radius: 0 !important;
      }
      .invoice-top-actions {
        display: none !important;
      }
      .invoice-paper-wrapper {
        padding: 20px !important;
      }
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="container">
    <div class="dashboard-layout">

      <!-- Sidebar -->
      <aside class="dashboard-sidebar anim-fade-left">
        <div style="text-align:center; padding-bottom:20px; border-bottom:1px solid var(--gray-200); margin-bottom:20px;">
          <div style="width:76px; height:76px; border-radius:50%; background:var(--gradient-primary); display:flex; align-items:center; justify-content:center; margin:0 auto 12px; border:3px solid var(--primary); font-size:26px; color:white; font-weight:800;" id="userAvatar">
            👤
          </div>
          <h3 style="font-size:18px; font-weight:700; color:var(--text-primary); margin-bottom:2px;" id="sidebarUserName">
            <asp:Literal ID="litUserName" runat="server" Text="Traveler" />
          </h3>
          <div style="font-size:12px; color:var(--text-muted); word-break:break-all;" id="sidebarUserEmail">
            <asp:Literal ID="litUserEmail" runat="server" Text="" />
          </div>
          <span class="badge badge-primary" style="margin-top:8px;">🌏 Verified Traveler</span>
        </div>

        <nav style="display:flex; flex-direction:column;">
          <button type="button" class="dash-menu-item active" onclick="showTab('tab-bookings', this)"><i class="fa-solid fa-suitcase"></i> My Bookings</button>
          <button type="button" class="dash-menu-item" onclick="showTab('tab-wishlist', this)"><i class="fa-solid fa-heart"></i> Saved Wishlist</button>
          <button type="button" class="dash-menu-item" onclick="showTab('tab-payments', this)"><i class="fa-solid fa-receipt"></i> Payment History</button>
          <button type="button" class="dash-menu-item" onclick="showTab('tab-profile', this)"><i class="fa-solid fa-user-gear"></i> Profile Settings</button>
          
          <!-- Single Dedicated Sign Out Button in Sidebar -->
          <div style="margin-top:16px; padding-top:16px; border-top:1px solid var(--gray-200);">
            <a href="/Pages/logout.aspx" class="dash-menu-item"
              style="color:#EF4444; background:rgba(239,68,68,0.06); border-radius:var(--radius-md); font-weight:700; padding:12px 16px; text-decoration:none; display:flex; align-items:center; gap:10px; transition:all 0.2s;">
              <i class="fa-solid fa-arrow-right-from-bracket"></i> Sign Out
            </a>
          </div>
        </nav>
      </aside>

      <!-- Main Dashboard Panels -->
      <section class="anim-fade-right">

        <!-- Tab 1: Bookings -->
        <div id="tab-bookings" class="dash-tab-content">
          <div class="flex-between mb-24 flex-wrap gap-12">
            <div>
              <h2 style="font-size:24px; font-weight:700; color:var(--text-primary);">My Tour Bookings</h2>
              <p style="font-size:14px; color:var(--text-secondary);">Manage your confirmed and upcoming travel itineraries</p>
            </div>
            <a href="/Pages/packages.aspx" class="btn btn-primary btn-sm">+ Book New Tour</a>
          </div>

          <!-- Dynamic Bookings Container -->
          <div id="bookings-list-container">
            <!-- Rendered by client JS based on user's real selections -->
          </div>
        </div>

        <!-- Tab 2: Wishlist -->
        <div id="tab-wishlist" class="dash-tab-content" style="display:none;">
          <div class="flex-between mb-24 flex-wrap gap-12">
            <div>
              <h2 style="font-size:24px; font-weight:700; color:var(--text-primary);">Saved Wishlist</h2>
              <p style="font-size:14px; color:var(--text-secondary);">Destinations and packages you have saved for later</p>
            </div>
            <a href="/Pages/destinations.aspx" class="btn btn-secondary btn-sm">Explore Destinations</a>
          </div>

          <div id="wishlist-list-container">
            <!-- Rendered dynamically -->
          </div>
        </div>

        <!-- Tab 3: Payments -->
        <div id="tab-payments" class="dash-tab-content" style="display:none;">
          <div class="flex-between mb-24 flex-wrap gap-12">
            <div>
              <h2 style="font-size:24px; font-weight:700; color:var(--text-primary);">Payment Invoices</h2>
              <p style="font-size:14px; color:var(--text-secondary);">Transaction receipts for your confirmed bookings</p>
            </div>
          </div>

          <div id="payments-list-container">
            <!-- Rendered dynamically -->
          </div>
        </div>

        <!-- Tab 4: Profile -->
        <div id="tab-profile" class="dash-tab-content" style="display:none;">
          <h2 style="font-size:24px; font-weight:700; color:var(--text-primary); margin-bottom:16px;">Account Profile</h2>
          <div class="card p-24" style="padding:28px;">
            <div class="grid grid-2" style="gap:18px;">
              <div class="form-group">
                <label class="form-label">Full Name</label>
                <input type="text" class="form-control" id="profileFullName" value="<asp:Literal ID="litProfileName" runat="server" Text="" />">
              </div>
              <div class="form-group">
                <label class="form-label">Email Address</label>
                <input type="email" class="form-control" id="profileEmail" value="<asp:Literal ID="litProfileEmail" runat="server" Text="" />" readonly style="background:var(--gray-100); cursor:not-allowed;">
              </div>
              <div class="form-group">
                <label class="form-label">Phone Number</label>
                <input type="tel" class="form-control" id="profilePhone" placeholder="+91 90991 07637" value="+91 90991 07637">
              </div>
              <div class="form-group">
                <label class="form-label">Preferred Currency</label>
                <select class="form-control filter-select" id="profileCurrency">
                  <option value="INR" selected>₹ INR (Indian Rupee)</option>
                  <option value="USD">$ USD (US Dollar)</option>
                  <option value="EUR">€ EUR (Euro)</option>
                  <option value="GBP">£ GBP (British Pound)</option>
                </select>
              </div>
            </div>
            <button type="button" onclick="saveUserProfile()" class="btn btn-primary mt-20">
              <i class="fa-solid fa-floppy-disk" style="margin-right:6px;"></i> Save Profile Changes
            </button>
          </div>
        </div>

      </section>

    </div>
  </div>

  <!-- ===================================================
       PREMIUM TAX INVOICE & TRAVEL VOUCHER MODAL
  =================================================== -->
  <div id="invoiceModal" class="invoice-modal-backdrop" onclick="if(event.target === this) closeInvoiceModal()">
    <div class="invoice-modal-container">
      
      <!-- Modal Top Action Header -->
      <div class="invoice-top-actions">
        <div style="display:flex; align-items:center; gap:10px; font-weight:700; font-size:15px;">
          <i class="fa-solid fa-file-invoice" style="color:#38BDF8; font-size:18px;"></i>
          <span>Official Tax Invoice &amp; Travel Voucher</span>
        </div>
        <div style="display:flex; align-items:center; gap:10px;">
          <button type="button" class="btn btn-primary btn-sm" onclick="printInvoice()">
            <i class="fa-solid fa-print" style="margin-right:6px;"></i> Print / Save PDF
          </button>
          <button type="button" class="btn btn-secondary btn-sm" onclick="closeInvoiceModal()" style="background:rgba(255,255,255,0.1); color:white; border-color:rgba(255,255,255,0.2);">
            <i class="fa-solid fa-xmark"></i> Close
          </button>
        </div>
      </div>

      <!-- Printable Invoice Document Canvas -->
      <div class="invoice-paper-wrapper" id="printableInvoice">
        
        <!-- Header: Company Brand & Tax Invoice Meta -->
        <div class="inv-header">
          <div>
            <div class="inv-brand-title">
              <span>✈️ EPIC-TRAVELLERS INDIA</span>
            </div>
            <div class="inv-company-details">
              <strong>Epic Travellers India Tourism Pvt. Ltd.</strong><br>
              Ministry of Tourism Recognized Luxury Tour Operator<br>
              Regd. Office: 108 Royal Heritage Tower, MG Road, New Delhi 110001<br>
              <strong>GSTIN:</strong> 07AAECE1234F1Z8 &nbsp;|&nbsp; <strong>PAN:</strong> AAECE1234F<br>
              <strong>Support:</strong> support@epictravellers.com &nbsp;|&nbsp; <strong>24x7 Helpline:</strong> +91 90991 07637
            </div>
          </div>

          <div class="inv-meta-badge">
            <span class="inv-title-badge">Tax Invoice &amp; Tour Voucher</span>
            <div style="font-size:12px; color:#475569; margin-top:4px;">
              <div><strong>Invoice No:</strong> <span id="invNo" style="color:#0284c7; font-weight:700;">INV-EPIC-2025-8910</span></div>
              <div><strong>Invoice Date:</strong> <span id="invDate">10 Sep 2025</span></div>
              <div><strong>Booking Ref:</strong> <span id="invBookingId" style="font-weight:700;">#EPIC-89210</span></div>
              <div style="margin-top:6px;"><span class="inv-stamp-badge">✓ Payment Confirmed</span></div>
            </div>
          </div>
        </div>

        <!-- Decorative Divider -->
        <div class="inv-divider"></div>

        <!-- 2-Column Info Grid: Billed To & Trip Specifications -->
        <div class="inv-grid-2">
          <div>
            <div class="inv-section-label"><i class="fa-solid fa-user-check" style="color:#0284c7;"></i> Billed To / Primary Traveler</div>
            <div style="font-size:15px; font-weight:800; color:#0F172A;" id="invTravelerName">Darshan Hapaliya</div>
            <div style="font-size:13px; color:#475569; margin-top:3px;" id="invTravelerEmail">darshan@example.com</div>
            <div style="font-size:13px; color:#475569;" id="invTravelerPhone">+91 90991 07637</div>
            <div style="font-size:12px; color:#64748B; margin-top:4px;">Country: <strong>India</strong> &nbsp;|&nbsp; Status: <strong>Verified Traveler</strong></div>
          </div>

          <div>
            <div class="inv-section-label"><i class="fa-solid fa-map-location-dot" style="color:#0284c7;"></i> Trip &amp; Itinerary Specifications</div>
            <div style="font-size:14px; font-weight:700; color:#0F172A;" id="invTourTitle">Royal Rajasthan Expedition</div>
            <div style="font-size:12px; color:#475569; margin-top:3px;"><strong>Duration:</strong> <span id="invDuration">8 Days / 7 Nights</span></div>
            <div style="font-size:12px; color:#475569;"><strong>Travel Schedule:</strong> <span id="invTravelDates">Upcoming Holiday Season</span></div>
            <div style="font-size:12px; color:#475569;"><strong>Traveler Party:</strong> <span id="invGuests">2 Adults</span> (Confirmed)</div>
          </div>
        </div>

        <!-- Itemized Itinerary Table -->
        <table class="inv-table">
          <thead>
            <tr>
              <th style="width:45%;">Itinerary Package &amp; Inclusions</th>
              <th style="width:20%;">Duration / Scope</th>
              <th style="width:15%; text-align:center;">Guests</th>
              <th style="width:20%; text-align:right;">Amount (INR)</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <strong id="invTableTitle" style="color:#0F172A; font-size:14px;">Royal Rajasthan Expedition</strong>
                <div style="font-size:11px; color:#64748B; margin-top:4px; line-height:1.4;" id="invInclusions">
                  Includes 4★ Heritage Haveli Stays, Private AC SUV with Chauffeur, Daily Breakfast &amp; Gourmet Dinners, Thar Desert Camel Safari &amp; Tent Stay, Guided City Sightseeing &amp; Monument Entries.
                </div>
              </td>
              <td id="invTableDuration" style="font-weight:600; color:#475569;">8 Days / 7 Nights</td>
              <td id="invTableGuests" style="text-align:center; font-weight:600;">2 Adults</td>
              <td id="invTablePrice" style="text-align:right; font-weight:800; color:#0284c7; font-size:15px;">₹45,000</td>
            </tr>
          </tbody>
        </table>

        <!-- Financial Summary Breakdown -->
        <div class="inv-financials">
          <div class="inv-summary-table">
            <div class="inv-summary-row">
              <span>Package Subtotal:</span>
              <strong id="invSubtotal">₹42,857</strong>
            </div>
            <div class="inv-summary-row">
              <span>GST / Tourism Tax (5%):</span>
              <strong id="invGst">₹2,143</strong>
            </div>
            <div class="inv-summary-row">
              <span>Convenience &amp; Booking Fee:</span>
              <strong style="color:#16A34A;">₹0 (Free Promo)</strong>
            </div>
            <div class="inv-total-row">
              <span>Total Paid Amount:</span>
              <span id="invTotalPaid">₹45,000</span>
            </div>
            <div style="font-size:11px; color:#64748B; text-align:right; margin-top:2px;" id="invPaymentMode">
              Paid Online via UPI / NetBanking • Instant Authorization
            </div>
          </div>
        </div>

        <!-- Official Signatory & Traveler Instructions -->
        <div class="inv-footer">
          <div style="max-width:440px;">
            <strong style="color:#0F172A; display:block; margin-bottom:2px;">Important Traveler Guidelines:</strong>
            1. Please present this tax invoice voucher with a valid government photo ID at the time of hotel check-in.<br>
            2. Dedicated Chauffeur details and pickup itinerary will be dispatched 24 hours prior to travel.<br>
            3. For 24x7 emergency road assistance or itinerary adjustments, call <strong>+91 90991 07637</strong>.
          </div>
          <div style="text-align:right;">
            <div style="font-size:10px; text-transform:uppercase; font-weight:700; color:#64748B; margin-bottom:4px;">Authorized Signatory</div>
            <div style="font-family:cursive; font-size:18px; font-weight:700; color:#0284c7; margin-bottom:2px;">Epic-Travellers Ltd.</div>
            <span class="inv-stamp-badge" style="font-size:10px; padding:3px 8px;">✓ Digitally Certified</span>
          </div>
        </div>

      </div>

    </div>
  </div>

  <script>
    function showTab(tabId, element) {
      document.querySelectorAll('.dash-tab-content').forEach(tab => tab.style.display = 'none');
      document.querySelectorAll('.dash-menu-item').forEach(btn => btn.classList.remove('active'));
      const t = document.getElementById(tabId);
      if (t) t.style.display = 'block';
      if (element) element.classList.add('active');
    }

    function getUserEmail() {
      var el = document.getElementById('sidebarUserEmail');
      return el ? el.innerText.trim().toLowerCase() : '';
    }

    function getUserName() {
      var el = document.getElementById('sidebarUserName');
      return el ? el.innerText.trim() : 'Valued Traveler';
    }

    // Render Dynamic User-Selected Bookings (or Empty State)
    function renderUserBookings() {
      const email = getUserEmail();
      const container = document.getElementById('bookings-list-container');
      if (!container) return;

      let bookings = [];
      try {
        const raw = localStorage.getItem('epic_bookings_' + email) || localStorage.getItem('epic_bookings');
        if (raw) bookings = JSON.parse(raw);
      } catch(e) {}

      if (!bookings || bookings.length === 0) {
        container.innerHTML = `
          <div class="empty-state-card">
            <div style="font-size:52px; margin-bottom:12px;">🧳</div>
            <h3 style="font-size:18px; font-weight:700; color:var(--text-primary); margin-bottom:6px;">No Active Tour Bookings</h3>
            <p style="font-size:14px; color:var(--text-secondary); max-width:440px; margin:0 auto 20px;">
              You haven't booked any tour packages yet. Choose from our handcrafted India itineraries and start your journey!
            </p>
            <a href="/Pages/packages.aspx" class="btn btn-primary">
              <i class="fa-solid fa-compass" style="margin-right:6px;"></i> Browse All Tour Packages
            </a>
          </div>
        `;
        return;
      }

      container.innerHTML = bookings.map((b, idx) => `
        <div class="booking-history-card">
          <img src="${b.image || '../Content/images/img_46.jpg'}" style="width:140px; height:100px; border-radius:var(--radius-lg); object-fit:cover;" alt="${b.title}">
          <div style="flex:1;">
            <div class="flex-between mb-4">
              <h3 style="font-size:17px; font-weight:700; color:var(--text-primary);">${b.title}</h3>
              <span class="badge badge-success">✓ ${b.status || 'Confirmed'}</span>
            </div>
            <p style="font-size:13px; color:var(--text-secondary); margin-bottom:4px;">
              <i class="fa-regular fa-calendar"></i> ${b.travelDates || b.date || 'Upcoming Holiday Season'} • ${b.guests || '2 Adults'}
            </p>
            <p style="font-size:13px; color:var(--text-secondary);">
              <i class="fa-solid fa-ticket"></i> Booking ID: <strong style="color:var(--primary);">${b.id || '#EPIC-89210'}</strong>
            </p>
          </div>
          <div style="text-align:right;">
            <strong style="font-size:18px; color:var(--primary);">${b.price || '₹45,000'}</strong>
            <div style="margin-top:10px; display:flex; gap:8px; justify-content:flex-end;">
              <button type="button" class="btn btn-secondary btn-sm" onclick="openInvoiceModal(${idx})">
                <i class="fa-solid fa-file-invoice" style="color:var(--primary); margin-right:4px;"></i> View Invoice
              </button>
              <button type="button" class="btn btn-secondary btn-sm" style="color:#ef4444; border-color:rgba(239,68,68,0.25);" onclick="cancelBooking(${idx})">
                Cancel
              </button>
            </div>
          </div>
        </div>
      `).join('');
    }

    // Direct Instant Cancellation without any browser confirmation dialog
    function cancelBooking(idx) {
      const email = getUserEmail();
      try {
        const key = 'epic_bookings_' + email;
        let bookings = JSON.parse(localStorage.getItem(key) || '[]');
        const removed = bookings.splice(idx, 1)[0];
        localStorage.setItem(key, JSON.stringify(bookings));
        
        Toast.show(`Booking ${removed ? removed.id : ''} cancelled successfully.`, 'info');
        renderUserBookings();
        renderUserPayments();
      } catch(e) {}
    }

    // Render User Wishlist
    function renderUserWishlist() {
      const email = getUserEmail();
      const container = document.getElementById('wishlist-list-container');
      if (!container) return;

      let wishlist = [];
      try {
        const raw = localStorage.getItem('epic_wishlist_' + email);
        if (raw) wishlist = JSON.parse(raw);
      } catch(e) {}

      if (!wishlist || wishlist.length === 0) {
        container.innerHTML = `
          <div class="empty-state-card">
            <div style="font-size:52px; margin-bottom:12px;">❤️</div>
            <h3 style="font-size:18px; font-weight:700; color:var(--text-primary); margin-bottom:6px;">Your Wishlist is Empty</h3>
            <p style="font-size:14px; color:var(--text-secondary); max-width:440px; margin:0 auto 20px;">
              Discover your dream destinations across India and save them to your wishlist.
            </p>
            <a href="/Pages/destinations.aspx" class="btn btn-secondary">
              <i class="fa-solid fa-heart" style="margin-right:6px;"></i> Explore Destinations
            </a>
          </div>
        `;
        return;
      }

      container.innerHTML = `
        <div class="grid grid-2" style="gap:20px;">
          ${wishlist.map(w => `
            <div class="card p-16 flex" style="gap:16px; padding:16px;">
              <img src="${w.image || '../Content/images/img_11.jpg'}" style="width:100px; height:80px; border-radius:var(--radius-md); object-fit:cover;" alt="${w.title}">
              <div style="flex:1;">
                <h4 style="font-size:15px; font-weight:700; color:var(--text-primary);">${w.title}</h4>
                <p style="font-size:12px; color:var(--primary); font-weight:700;">${w.price || 'From ₹25,000'}</p>
                <a href="${w.href || '/Pages/packages.aspx'}" class="btn btn-primary btn-sm mt-8">Book Now</a>
              </div>
            </div>
          `).join('')}
        </div>
      `;
    }

    // Render User Payments
    function renderUserPayments() {
      const email = getUserEmail();
      const container = document.getElementById('payments-list-container');
      if (!container) return;

      let bookings = [];
      try {
        const raw = localStorage.getItem('epic_bookings_' + email) || localStorage.getItem('epic_bookings');
        if (raw) bookings = JSON.parse(raw);
      } catch(e) {}

      if (!bookings || bookings.length === 0) {
        container.innerHTML = `
          <div class="empty-state-card">
            <div style="font-size:52px; margin-bottom:12px;">🧾</div>
            <h3 style="font-size:18px; font-weight:700; color:var(--text-primary); margin-bottom:6px;">No Payment Invoices</h3>
            <p style="font-size:14px; color:var(--text-secondary); max-width:440px; margin:0 auto 20px;">
              Once you confirm a tour booking, your official GST-compliant tax invoices will appear here.
            </p>
          </div>
        `;
        return;
      }

      container.innerHTML = `
        <div class="card p-24" style="padding:20px;">
          <table style="width:100%; border-collapse:collapse; font-size:14px;">
            <thead>
              <tr style="text-align:left; border-bottom:2px solid var(--gray-200);">
                <th style="padding:12px 10px;">Date</th>
                <th style="padding:12px 10px;">Booking Ref</th>
                <th style="padding:12px 10px;">Tour Itinerary</th>
                <th style="padding:12px 10px;">Paid Amount</th>
                <th style="padding:12px 10px; text-align:right;">Action</th>
              </tr>
            </thead>
            <tbody>
              ${bookings.map((b, idx) => `
                <tr style="border-bottom:1px solid var(--gray-200);">
                  <td style="padding:12px 10px; color:var(--text-secondary);">${b.bookingDate || '10 Sep 2025'}</td>
                  <td style="padding:12px 10px; font-weight:700; color:var(--primary);">${b.id || '#EPIC-89210'}</td>
                  <td style="padding:12px 10px; font-weight:600;">${b.title}</td>
                  <td style="padding:12px 10px; font-weight:700; color:var(--primary);">${b.price}</td>
                  <td style="padding:12px 10px; text-align:right;">
                    <button type="button" class="btn btn-secondary btn-sm" onclick="openInvoiceModal(${idx})">
                      <i class="fa-solid fa-file-invoice" style="margin-right:4px;"></i> View Invoice
                    </button>
                  </td>
                </tr>
              `).join('')}
            </tbody>
          </table>
        </div>
      `;
    }

    // Open & Populate the Tax Invoice Modal with Trip Details
    function openInvoiceModal(idx) {
      const email = getUserEmail();
      let bookings = [];
      try {
        const raw = localStorage.getItem('epic_bookings_' + email) || localStorage.getItem('epic_bookings');
        if (raw) bookings = JSON.parse(raw);
      } catch(e) {}

      const b = (bookings && bookings[idx]) ? bookings[idx] : {
        id: '#EPIC-89210',
        invoiceNo: 'INV-EPIC-2025-8910',
        title: 'Royal Rajasthan Expedition',
        bookingDate: '10 Sep 2025',
        travelDates: 'Upcoming Holiday Season',
        duration: '8 Days / 7 Nights',
        guests: '2 Adults',
        travelerName: getUserName(),
        travelerEmail: email || 'traveler@epictravellers.com',
        travelerPhone: '+91 90991 07637',
        inclusions: '4★ Heritage Haveli Stays, Private AC SUV with Chauffeur, Daily Breakfast & Gourmet Dinners, Thar Desert Camel Safari & Tent Stay, Guided City Sightseeing & Monument Entries.',
        price: '₹45,000',
        subtotal: '₹42,857',
        gst: '₹2,143',
        paymentMode: 'UPI / NetBanking (Online Verified)'
      };

      // Populate Elements
      document.getElementById('invNo').innerText = b.invoiceNo || ('INV-EPIC-2025-' + (Math.floor(1000 + Math.random() * 9000)));
      document.getElementById('invDate').innerText = b.bookingDate || new Date().toLocaleDateString('en-IN', { day: '2-digit', month: 'short', year: 'numeric' });
      document.getElementById('invBookingId').innerText = b.id || '#EPIC-89210';
      document.getElementById('invTravelerName').innerText = b.travelerName || getUserName();
      document.getElementById('invTravelerEmail').innerText = b.travelerEmail || email || 'traveler@epictravellers.com';
      document.getElementById('invTravelerPhone').innerText = b.travelerPhone || '+91 90991 07637';
      document.getElementById('invTourTitle').innerText = b.title || 'Royal Rajasthan Expedition';
      document.getElementById('invDuration').innerText = b.duration || '8 Days / 7 Nights';
      document.getElementById('invTravelDates').innerText = b.travelDates || b.date || 'Upcoming Holiday Season';
      document.getElementById('invGuests').innerText = b.guests || '2 Adults';
      document.getElementById('invTableTitle').innerText = b.title || 'Royal Rajasthan Expedition';
      document.getElementById('invInclusions').innerText = b.inclusions || 'Includes 4★ Heritage Haveli Stays, Private AC SUV with Chauffeur, Daily Breakfast & Gourmet Dinners, Thar Desert Camel Safari & Tent Stay, Guided City Sightseeing & Monument Entries.';
      document.getElementById('invTableDuration').innerText = b.duration || '8 Days / 7 Nights';
      document.getElementById('invTableGuests').innerText = b.guests || '2 Adults';
      document.getElementById('invTablePrice').innerText = b.price || '₹45,000';
      document.getElementById('invSubtotal').innerText = b.subtotal || '₹42,857';
      document.getElementById('invGst').innerText = b.gst || '₹2,143 (5% GST)';
      document.getElementById('invTotalPaid').innerText = b.price || '₹45,000';
      document.getElementById('invPaymentMode').innerText = 'Paid Online via ' + (b.paymentMode || 'UPI / NetBanking') + ' • Instant Authorization';

      const modal = document.getElementById('invoiceModal');
      if (modal) {
        modal.classList.add('open');
        document.body.style.overflow = 'hidden';
      }
    }

    function closeInvoiceModal() {
      const modal = document.getElementById('invoiceModal');
      if (modal) {
        modal.classList.remove('open');
        document.body.style.overflow = '';
      }
    }

    function printInvoice() {
      window.print();
    }

    function saveUserProfile() {
      const name = document.getElementById('profileFullName')?.value || '';
      if (name) {
        document.getElementById('sidebarUserName').innerText = name;
        const av = document.getElementById('userAvatar');
        if (av) av.innerText = name.charAt(0).toUpperCase();
      }
      Toast.show('Profile changes saved successfully! 👤', 'success');
    }

    // Initialize user avatar and dynamic panels on DOM load
    document.addEventListener('DOMContentLoaded', () => {
      var nameEl = document.getElementById('sidebarUserName');
      if (nameEl) {
        var name = nameEl.innerText.trim();
        if (name && name !== 'User' && name !== 'Traveler') {
          var av = document.getElementById('userAvatar');
          if (av) av.innerText = name.charAt(0).toUpperCase();
        }
      }
      renderUserBookings();
      renderUserWishlist();
      renderUserPayments();
    });
  </script>
</asp:Content>
