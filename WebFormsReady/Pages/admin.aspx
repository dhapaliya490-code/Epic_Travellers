<%@ Page Title="Admin Dashboard – Epic-Travellers | Control Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Epic_Travelers.Pages.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Admin Dashboard for Epic-Travellers. Control bookings, packages, user analytics, and revenue reports across India.">

  <style>
    .admin-layout {
      display: grid;
      grid-template-columns: 240px 1fr;
      min-height: 100vh;
      padding-top: var(--header-height);
    }

    .admin-sidebar {
      background: #0f172a;
      color: white;
      padding: 24px 16px;
    }

    .admin-menu-link {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 12px 16px;
      border-radius: var(--radius-md);
      font-size: 14px;
      color: rgba(255,255,255,0.7);
      cursor: pointer;
      transition: var(--transition-fast);
      text-decoration: none;
      margin-bottom: 4px;
      border: none;
      background: transparent;
      width: 100%;
      text-align: left;
    }

    .admin-menu-link:hover, .admin-menu-link.active {
      background: var(--gradient-primary);
      color: white;
    }

    .stat-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 20px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .stat-icon-wrapper {
      width: 48px;
      height: 48px;
      border-radius: var(--radius-lg);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 20px;
      color: white;
    }

    .admin-table-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 24px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      margin-bottom: 24px;
    }

    .admin-table {
      width: 100%;
      border-collapse: collapse;
      font-size: 14px;
    }

    .admin-table th {
      padding: 12px 14px;
      text-align: left;
      font-weight: 700;
      color: var(--text-primary);
      border-bottom: 2px solid var(--gray-200);
      background: var(--bg-secondary);
    }

    .admin-table td {
      padding: 12px 14px;
      border-bottom: 1px solid var(--gray-200);
      color: var(--text-primary);
      vertical-align: middle;
    }

    .admin-table tr:hover {
      background: var(--bg-secondary);
    }

    @media (max-width: 992px) {
      .admin-layout { grid-template-columns: 1fr; }
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <div class="admin-layout">

    <!-- Admin Sidebar -->
    <aside class="admin-sidebar">
      <div style="font-size:12px; letter-spacing:2px; text-transform:uppercase; color:var(--primary); font-weight:700; margin-bottom:16px; padding:0 8px;">
        ⚙️ Admin Control
      </div>

      <nav>
        <button type="button" class="admin-menu-link active" onclick="switchAdminTab('tab-overview', this)"><i class="fa-solid fa-chart-line"></i> Overview</button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-bookings', this)"><i class="fa-solid fa-suitcase"></i> Bookings (142)</button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-packages', this)"><i class="fa-solid fa-box"></i> Manage Packages</button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-destinations', this)"><i class="fa-solid fa-location-dot"></i> Destinations</button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-users', this)"><i class="fa-solid fa-users"></i> Users (52.4k)</button>
      </nav>

      <div style="margin-top:40px; padding:16px; background:rgba(255,255,255,0.05); border-radius:var(--radius-lg);">
        <div style="font-size:12px; color:rgba(255,255,255,0.6); margin-bottom:6px;">Current Server Status</div>
        <div style="font-size:13px; font-weight:700; color:#22C55E; display:flex; align-items:center; gap:6px;">
          <span style="width:8px; height:8px; border-radius:50%; background:#22C55E; display:inline-block;"></span> All Systems Operational
        </div>
      </div>
    </aside>

    <!-- Admin Body -->
    <main style="padding:32px; background:var(--bg-secondary);">

      <!-- Tab: Overview -->
      <div id="tab-overview" class="admin-tab-panel">
        <div class="flex-between mb-32 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Analytics Dashboard</h1>
            <p style="font-size:14px; color:var(--text-secondary);">Real-time metrics for Epic-Travellers India</p>
          </div>
          <div style="display:flex; gap:12px;">
            <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Refreshing analytics data...', 'info')"><i class="fa-solid fa-arrows-rotate"></i> Refresh</button>
            <button type="button" class="btn btn-primary btn-sm" onclick="Toast.show('Analytics report exported successfully!', 'success')"><i class="fa-solid fa-download"></i> Export Report</button>
          </div>
        </div>

        <!-- 4 Metric Cards -->
        <div class="grid grid-4 mb-32 stagger-children">
          <div class="stat-card anim-scale">
            <div>
              <small style="font-size:12px; color:var(--text-muted); text-transform:uppercase;">Total Revenue</small>
              <div style="font-size:24px; font-weight:800; color:var(--text-primary); margin-top:4px;">₹42.8 Lakhs</div>
              <span style="font-size:12px; color:#22C55E;">↑ +18.4% this month</span>
            </div>
            <div class="stat-icon-wrapper" style="background:var(--gradient-primary);"><i class="fa-solid fa-indian-rupee-sign"></i></div>
          </div>

          <div class="stat-card anim-scale">
            <div>
              <small style="font-size:12px; color:var(--text-muted); text-transform:uppercase;">Total Bookings</small>
              <div style="font-size:24px; font-weight:800; color:var(--text-primary); margin-top:4px;">1,420</div>
              <span style="font-size:12px; color:#22C55E;">↑ +12.1% from last week</span>
            </div>
            <div class="stat-icon-wrapper" style="background:var(--gradient-accent);"><i class="fa-solid fa-suitcase"></i></div>
          </div>

          <div class="stat-card anim-scale">
            <div>
              <small style="font-size:12px; color:var(--text-muted); text-transform:uppercase;">Active Travelers</small>
              <div style="font-size:24px; font-weight:800; color:var(--text-primary); margin-top:4px;">348</div>
              <span style="font-size:12px; color:var(--primary);">Currently on trip</span>
            </div>
            <div class="stat-icon-wrapper" style="background:linear-gradient(135deg, #10B981, #059669);"><i class="fa-solid fa-user-group"></i></div>
          </div>

          <div class="stat-card anim-scale">
            <div>
              <small style="font-size:12px; color:var(--text-muted); text-transform:uppercase;">Customer Rating</small>
              <div style="font-size:24px; font-weight:800; color:var(--text-primary); margin-top:4px;">4.9 / 5.0</div>
              <span style="font-size:12px; color:var(--accent);">⭐ Based on 12k reviews</span>
            </div>
            <div class="stat-icon-wrapper" style="background:linear-gradient(135deg, #F59E0B, #D97706);"><i class="fa-solid fa-star"></i></div>
          </div>
        </div>

        <!-- Recent Bookings Table -->
        <div class="admin-table-card">
          <div class="flex-between mb-16">
            <h3 style="font-size:18px; font-weight:700; color:var(--text-primary);">Recent Bookings Log</h3>
            <button type="button" class="btn btn-glass btn-sm" onclick="switchAdminTab('tab-bookings', document.querySelectorAll('.admin-menu-link')[1])">View All 142 Bookings ➔</button>
          </div>
          <div style="overflow-x:auto;">
            <table class="admin-table">
              <thead>
                <tr>
                  <th>Booking ID</th>
                  <th>Customer</th>
                  <th>Package</th>
                  <th>Date</th>
                  <th>Amount</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style="font-weight:700;">#EPIC-9021</td>
                  <td>Rahul Verma</td>
                  <td>Royal Rajasthan Expedition</td>
                  <td>15 Oct 2025</td>
                  <td style="font-weight:700; color:var(--primary);">₹50,000</td>
                  <td><span class="badge badge-success">Confirmed</span></td>
                  <td><button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Booking details #EPIC-9021 opened', 'info')">Details</button></td>
                </tr>
                <tr>
                  <td style="font-weight:700;">#EPIC-9022</td>
                  <td>Ananya Roy</td>
                  <td>Kerala Backwaters Romantic Bliss</td>
                  <td>20 Oct 2025</td>
                  <td style="font-weight:700; color:var(--primary);">₹36,000</td>
                  <td><span class="badge badge-primary">Processing</span></td>
                  <td><button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Booking details #EPIC-9022 opened', 'info')">Details</button></td>
                </tr>
                <tr>
                  <td style="font-weight:700;">#EPIC-9023</td>
                  <td>Siddharth Nair</td>
                  <td>Ladakh Bike Expedition</td>
                  <td>02 Nov 2025</td>
                  <td style="font-weight:700; color:var(--primary);">₹64,000</td>
                  <td><span class="badge badge-success">Confirmed</span></td>
                  <td><button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Booking details #EPIC-9023 opened', 'info')">Details</button></td>
                </tr>
                <tr>
                  <td style="font-weight:700;">#EPIC-9024</td>
                  <td>Priya Sundaram</td>
                  <td>Goa Beach &amp; Heritage Tour</td>
                  <td>12 Nov 2025</td>
                  <td style="font-weight:700; color:var(--primary);">₹24,000</td>
                  <td><span class="badge badge-success">Confirmed</span></td>
                  <td><button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Booking details #EPIC-9024 opened', 'info')">Details</button></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

      </div>

      <!-- Tab: Bookings -->
      <div id="tab-bookings" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-32 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Manage All Bookings</h1>
            <p style="font-size:14px; color:var(--text-secondary);">Manage 142 total tour package reservations</p>
          </div>
          <div style="display:flex; gap:12px;">
            <button type="button" class="btn btn-primary btn-sm" onclick="Toast.show('New booking form initialized', 'info')"><i class="fa-solid fa-plus"></i> New Booking</button>
            <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Bookings CSV exported!', 'success')"><i class="fa-solid fa-file-export"></i> Export CSV</button>
          </div>
        </div>

        <div class="admin-table-card">
          <div style="overflow-x:auto;">
            <table class="admin-table">
              <thead>
                <tr>
                  <th>Booking ID</th>
                  <th>Customer</th>
                  <th>Package</th>
                  <th>Travel Date</th>
                  <th>Travelers</th>
                  <th>Amount</th>
                  <th>Payment</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style="font-weight:700;">#EPIC-9021</td>
                  <td>Rahul Verma<br><small style="color:var(--text-muted);">rahul@gmail.com</small></td>
                  <td>Royal Rajasthan Expedition</td>
                  <td>15 Oct 2025</td>
                  <td>2 Adults</td>
                  <td style="font-weight:700; color:var(--primary);">₹50,000</td>
                  <td><span class="badge badge-success">Paid (Razorpay)</span></td>
                  <td><span class="badge badge-success">Confirmed</span></td>
                  <td>
                    <button type="button" class="btn btn-glass btn-sm" onclick="Toast.show('Booking #EPIC-9021 confirmed again', 'success')">Confirm</button>
                  </td>
                </tr>
                <tr>
                  <td style="font-weight:700;">#EPIC-9022</td>
                  <td>Ananya Roy<br><small style="color:var(--text-muted);">ananya.roy@yahoo.com</small></td>
                  <td>Kerala Backwaters Romantic Bliss</td>
                  <td>20 Oct 2025</td>
                  <td>2 Adults</td>
                  <td style="font-weight:700; color:var(--primary);">₹36,000</td>
                  <td><span class="badge badge-accent">Pending</span></td>
                  <td><span class="badge badge-primary">Processing</span></td>
                  <td>
                    <button type="button" class="btn btn-glass btn-sm" onclick="Toast.show('Payment reminder sent to Ananya Roy', 'info')">Remind</button>
                  </td>
                </tr>
                <tr>
                  <td style="font-weight:700;">#EPIC-9023</td>
                  <td>Siddharth Nair<br><small style="color:var(--text-muted);">siddharth@outlook.com</small></td>
                  <td>Ladakh Bike Expedition</td>
                  <td>02 Nov 2025</td>
                  <td>1 Adult</td>
                  <td style="font-weight:700; color:var(--primary);">₹64,000</td>
                  <td><span class="badge badge-success">Paid (UPI)</span></td>
                  <td><span class="badge badge-success">Confirmed</span></td>
                  <td>
                    <button type="button" class="btn btn-glass btn-sm" onclick="Toast.show('Voucher generated for #EPIC-9023', 'success')">Voucher</button>
                  </td>
                </tr>
                <tr>
                  <td style="font-weight:700;">#EPIC-9024</td>
                  <td>Priya Sundaram<br><small style="color:var(--text-muted);">priya.s@gmail.com</small></td>
                  <td>Goa Beach &amp; Heritage Tour</td>
                  <td>12 Nov 2025</td>
                  <td>4 Adults</td>
                  <td style="font-weight:700; color:var(--primary);">₹24,000</td>
                  <td><span class="badge badge-success">Paid (Stripe)</span></td>
                  <td><span class="badge badge-success">Confirmed</span></td>
                  <td>
                    <button type="button" class="btn btn-glass btn-sm" onclick="Toast.show('Booking details opened', 'info')">Details</button>
                  </td>
                </tr>
                <tr>
                  <td style="font-weight:700;">#EPIC-9025</td>
                  <td>Amitabh Sen<br><small style="color:var(--text-muted);">amitabh.sen@tech.in</small></td>
                  <td>Manali Snow &amp; Solang Valley</td>
                  <td>28 Nov 2025</td>
                  <td>2 Adults, 1 Child</td>
                  <td style="font-weight:700; color:var(--primary);">₹44,000</td>
                  <td><span class="badge badge-success">Paid (UPI)</span></td>
                  <td><span class="badge badge-success">Confirmed</span></td>
                  <td>
                    <button type="button" class="btn btn-glass btn-sm" onclick="Toast.show('Booking details opened', 'info')">Details</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Tab: Packages -->
      <div id="tab-packages" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-32 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Manage Tour Packages</h1>
            <p style="font-size:14px; color:var(--text-secondary);">Create, edit, and organize featured tour packages across India</p>
          </div>
          <button type="button" class="btn btn-primary btn-sm" onclick="Toast.show('Create package wizard opened', 'info')"><i class="fa-solid fa-plus"></i> Add New Package</button>
        </div>

        <div class="admin-table-card">
          <div style="overflow-x:auto;">
            <table class="admin-table">
              <thead>
                <tr>
                  <th>Package Name</th>
                  <th>Region</th>
                  <th>Duration</th>
                  <th>Price (INR)</th>
                  <th>Status</th>
                  <th>Bookings</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style="font-weight:700;">👑 Royal Rajasthan Expedition</td>
                  <td>North India (Rajasthan)</td>
                  <td>7 Days / 6 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹25,000</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>428 booked</td>
                  <td>
                    <a href="/Pages/package-details.aspx?id=rajasthan" class="btn btn-glass btn-sm">View</a>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Edit Package: Royal Rajasthan Expedition', 'info')">Edit</button>
                  </td>
                </tr>
                <tr>
                  <td style="font-weight:700;">💑 Kerala Backwaters Romantic Bliss</td>
                  <td>South India (Kerala)</td>
                  <td>5 Days / 4 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹18,000</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>312 booked</td>
                  <td>
                    <a href="/Pages/package-details.aspx?id=kerala" class="btn btn-glass btn-sm">View</a>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Edit Package: Kerala Backwaters', 'info')">Edit</button>
                  </td>
                </tr>
                <tr>
                  <td style="font-weight:700;">🧗 Ladakh High Altitude Bike Expedition</td>
                  <td>North India (Ladakh)</td>
                  <td>8 Days / 7 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹32,000</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>284 booked</td>
                  <td>
                    <a href="/Pages/package-details.aspx?id=ladakh-adventure" class="btn btn-glass btn-sm">View</a>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Edit Package: Ladakh Expedition', 'info')">Edit</button>
                  </td>
                </tr>
                <tr>
                  <td style="font-weight:700;">🏖️ Goa Coastal Escape &amp; Cruise</td>
                  <td>West India (Goa)</td>
                  <td>4 Days / 3 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹12,000</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>510 booked</td>
                  <td>
                    <a href="/Pages/package-details.aspx?id=goa" class="btn btn-glass btn-sm">View</a>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Edit Package: Goa Coastal Escape', 'info')">Edit</button>
                  </td>
                </tr>
                <tr>
                  <td style="font-weight:700;">🏔️ Manali Solang Snow Adventure</td>
                  <td>North India (Himachal)</td>
                  <td>6 Days / 5 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹16,000</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>195 booked</td>
                  <td>
                    <a href="/Pages/package-details.aspx?id=manali" class="btn btn-glass btn-sm">View</a>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Edit Package: Manali Adventure', 'info')">Edit</button>
                  </td>
                </tr>
                <tr>
                  <td style="font-weight:700;">🏝️ Andaman Scuba &amp; Island Explorer</td>
                  <td>Islands (Andaman)</td>
                  <td>6 Days / 5 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹22,000</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>142 booked</td>
                  <td>
                    <a href="/Pages/package-details.aspx?id=andaman" class="btn btn-glass btn-sm">View</a>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Edit Package: Andaman Scuba', 'info')">Edit</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Tab: Destinations -->
      <div id="tab-destinations" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-32 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Destinations Directory</h1>
            <p style="font-size:14px; color:var(--text-secondary);">Manage destination listings, spotlight ratings, and regional tags</p>
          </div>
          <button type="button" class="btn btn-primary btn-sm" onclick="Toast.show('Add destination modal opened', 'info')"><i class="fa-solid fa-plus"></i> Add Destination</button>
        </div>

        <div class="admin-table-card">
          <div style="overflow-x:auto;">
            <table class="admin-table">
              <thead>
                <tr>
                  <th>Destination</th>
                  <th>State / Region</th>
                  <th>Category</th>
                  <th>Rating</th>
                  <th>Active Tours</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style="font-weight:700;">🏰 Jaipur &amp; Udaipur</td>
                  <td>Rajasthan</td>
                  <td>Heritage &amp; Palaces</td>
                  <td>⭐ 4.9 (2,410)</td>
                  <td>18 Tours</td>
                  <td><span class="badge badge-success">Published</span></td>
                  <td><button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Destination settings updated', 'success')">Edit</button></td>
                </tr>
                <tr>
                  <td style="font-weight:700;">🏖️ North &amp; South Goa</td>
                  <td>Goa</td>
                  <td>Beaches &amp; Nightlife</td>
                  <td>⭐ 4.8 (3,120)</td>
                  <td>14 Tours</td>
                  <td><span class="badge badge-success">Published</span></td>
                  <td><button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Destination settings updated', 'success')">Edit</button></td>
                </tr>
                <tr>
                  <td style="font-weight:700;">🌿 Alleppey &amp; Munnar</td>
                  <td>Kerala</td>
                  <td>Nature &amp; Backwaters</td>
                  <td>⭐ 4.9 (1,890)</td>
                  <td>12 Tours</td>
                  <td><span class="badge badge-success">Published</span></td>
                  <td><button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Destination settings updated', 'success')">Edit</button></td>
                </tr>
                <tr>
                  <td style="font-weight:700;">🏔️ Leh &amp; Pangong Tso</td>
                  <td>Ladakh</td>
                  <td>Adventure &amp; Mountains</td>
                  <td>⭐ 4.9 (1,450)</td>
                  <td>9 Tours</td>
                  <td><span class="badge badge-success">Published</span></td>
                  <td><button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Destination settings updated', 'success')">Edit</button></td>
                </tr>
                <tr>
                  <td style="font-weight:700;">🛕 Dashashwamedh &amp; Kashi</td>
                  <td>Varanasi (UP)</td>
                  <td>Spiritual &amp; Culture</td>
                  <td>⭐ 4.8 (980)</td>
                  <td>6 Tours</td>
                  <td><span class="badge badge-success">Published</span></td>
                  <td><button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Destination settings updated', 'success')">Edit</button></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Tab: Users -->
      <div id="tab-users" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-32 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">User Accounts</h1>
            <p style="font-size:14px; color:var(--text-secondary);">Manage 52,400 registered travelers and platform members</p>
          </div>
          <div style="display:flex; gap:12px;">
            <button type="button" class="btn btn-primary btn-sm" onclick="Toast.show('User invite modal opened', 'info')"><i class="fa-solid fa-user-plus"></i> Invite User</button>
          </div>
        </div>

        <div class="admin-table-card">
          <div style="overflow-x:auto;">
            <table class="admin-table">
              <thead>
                <tr>
                  <th>User</th>
                  <th>Role</th>
                  <th>Status</th>
                  <th>Joined Date</th>
                  <th>Trips Booked</th>
                  <th>Total Spent</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>
                    <strong>Rahul Verma</strong><br>
                    <small style="color:var(--text-muted);">rahul@gmail.com</small>
                  </td>
                  <td><span class="badge badge-primary">Traveler</span></td>
                  <td><span class="badge badge-success">Verified</span></td>
                  <td>12 Jan 2024</td>
                  <td>4 Trips</td>
                  <td style="font-weight:700; color:var(--primary);">₹1,24,000</td>
                  <td>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('User profile opened', 'info')">Profile</button>
                  </td>
                </tr>
                <tr>
                  <td>
                    <strong>Ananya Roy</strong><br>
                    <small style="color:var(--text-muted);">ananya.roy@yahoo.com</small>
                  </td>
                  <td><span class="badge badge-primary">Traveler</span></td>
                  <td><span class="badge badge-success">Verified</span></td>
                  <td>04 Mar 2024</td>
                  <td>2 Trips</td>
                  <td style="font-weight:700; color:var(--primary);">₹54,000</td>
                  <td>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('User profile opened', 'info')">Profile</button>
                  </td>
                </tr>
                <tr>
                  <td>
                    <strong>Rajesh Kumar</strong><br>
                    <small style="color:var(--text-muted);">rajesh.guide@epictravellers.com</small>
                  </td>
                  <td><span class="badge badge-accent">Tour Guide</span></td>
                  <td><span class="badge badge-success">Certified</span></td>
                  <td>15 Sep 2023</td>
                  <td>38 Led</td>
                  <td style="font-weight:700; color:var(--primary);">₹8,50,000</td>
                  <td>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Tour guide performance scorecard loaded', 'info')">Scorecard</button>
                  </td>
                </tr>
                <tr>
                  <td>
                    <strong>Administrator</strong><br>
                    <small style="color:var(--text-muted);">admin@epictravellers.com</small>
                  </td>
                  <td><span class="badge badge-accent">Super Admin</span></td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>01 Jan 2023</td>
                  <td>—</td>
                  <td>—</td>
                  <td>
                    <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Admin permissions verified', 'info')">Permissions</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

    </main>

  </div>

  <script>
    function switchAdminTab(panelId, btn) {
      document.querySelectorAll('.admin-tab-panel').forEach(p => p.style.display = 'none');
      document.querySelectorAll('.admin-menu-link').forEach(l => l.classList.remove('active'));

      const target = document.getElementById(panelId);
      if (target) target.style.display = 'block';
      if (btn) btn.classList.add('active');
    }
  </script>
</asp:Content>
