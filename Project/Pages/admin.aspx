<%@ Page Title="Admin Command Center – Epic-Travellers | Control Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Epic_Travelers.Pages.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Admin Dashboard for Epic-Travellers. Manage bookings, packages, registered travelers, and platform revenue.">

  <style>
    .admin-layout {
      display: grid;
      grid-template-columns: 260px 1fr;
      min-height: calc(100vh - var(--header-height));
      padding-top: var(--header-height);
      background: var(--bg-secondary);
    }

    /* Modern Dark Command Sidebar */
    .admin-sidebar {
      background: #0b1329;
      color: white;
      padding: 24px 16px;
      display: flex;
      flex-direction: column;
      border-right: 1px solid rgba(255,255,255,0.06);
      position: sticky;
      top: var(--header-height);
      height: calc(100vh - var(--header-height));
      overflow-y: auto;
    }

    .admin-brand-badge {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 10px 12px;
      background: rgba(14,165,233,0.12);
      border: 1px solid rgba(14,165,233,0.25);
      border-radius: var(--radius-lg);
      margin-bottom: 24px;
    }

    .admin-menu-link {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 12px 16px;
      border-radius: var(--radius-md);
      font-size: 14px;
      font-weight: 500;
      color: rgba(255,255,255,0.7);
      cursor: pointer;
      transition: all var(--transition-fast);
      text-decoration: none;
      margin-bottom: 6px;
      border: none;
      background: transparent;
      width: 100%;
      text-align: left;
    }

    .admin-menu-link i {
      font-size: 16px;
      width: 20px;
      text-align: center;
      color: rgba(255,255,255,0.5);
      transition: color 0.2s;
    }

    .admin-menu-link:hover {
      background: rgba(255,255,255,0.08);
      color: #FFFFFF;
    }

    .admin-menu-link:hover i {
      color: var(--primary);
    }

    .admin-menu-link.active {
      background: var(--gradient-primary);
      color: #FFFFFF;
      font-weight: 700;
      box-shadow: 0 4px 14px rgba(14,165,233,0.35);
    }

    .admin-menu-link.active i {
      color: #FFFFFF;
    }

    /* Modern KPI Cards */
    .stat-card-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 20px;
      margin-bottom: 28px;
    }

    .stat-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 22px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      display: flex;
      align-items: center;
      justify-content: space-between;
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .stat-card:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow-md);
    }

    .stat-icon-wrapper {
      width: 52px;
      height: 52px;
      border-radius: var(--radius-lg);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 22px;
      color: white;
      box-shadow: 0 4px 12px rgba(0,0,0,0.12);
    }

    .admin-table-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 24px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      margin-bottom: 28px;
    }

    .admin-table {
      width: 100%;
      border-collapse: collapse;
      font-size: 14px;
    }

    .admin-table th {
      padding: 14px 16px;
      text-align: left;
      font-weight: 700;
      color: var(--text-primary);
      border-bottom: 2px solid var(--gray-200);
      background: var(--bg-secondary);
      font-size: 13px;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .admin-table td {
      padding: 14px 16px;
      border-bottom: 1px solid var(--gray-200);
      color: var(--text-primary);
      vertical-align: middle;
    }

    .admin-table tr:hover {
      background: rgba(14,165,233,0.03);
    }

    /* Action buttons in table */
    .table-action-btn {
      padding: 6px 12px;
      border-radius: var(--radius-md);
      font-size: 12px;
      font-weight: 600;
      border: 1px solid var(--gray-300);
      background: var(--bg-primary);
      color: var(--text-primary);
      cursor: pointer;
      transition: all 0.2s;
    }

    .table-action-btn:hover {
      border-color: var(--primary);
      color: var(--primary);
      background: rgba(14,165,233,0.06);
    }

    /* Executive Analytics Chart Styles */
    .admin-chart-grid {
      display: grid;
      grid-template-columns: minmax(0, 1.85fr) minmax(0, 1.15fr);
      gap: 24px;
      align-items: stretch;
    }

    .chart-panel-main {
      background: var(--bg-secondary);
      border: 1px solid var(--gray-200);
      border-radius: var(--radius-xl);
      padding: 24px 20px 18px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      position: relative;
    }

    .chart-panel-side {
      background: var(--bg-secondary);
      border: 1px solid var(--gray-200);
      border-radius: var(--radius-xl);
      padding: 24px 20px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .chart-toggle-btn {
      padding: 5px 13px;
      border-radius: var(--radius-full);
      font-size: 12px;
      font-weight: 600;
      border: 1px solid var(--gray-300);
      background: var(--bg-primary);
      color: var(--text-secondary);
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .chart-toggle-btn.active {
      background: var(--primary);
      border-color: var(--primary);
      color: #FFFFFF;
      box-shadow: 0 2px 8px rgba(14,165,233,0.35);
    }

    .chart-canvas-container {
      position: relative;
      height: 220px;
      margin-top: 16px;
      margin-bottom: 8px;
    }

    .chart-gridlines {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      pointer-events: none;
    }

    .chart-gridline-row {
      display: flex;
      align-items: center;
      width: 100%;
      font-size: 11px;
      font-weight: 600;
      color: var(--text-muted);
    }

    .chart-gridline-label {
      width: 44px;
      flex-shrink: 0;
      text-align: left;
    }

    .chart-gridline-rule {
      flex: 1;
      border-bottom: 1px dashed var(--gray-200);
    }

    .chart-gridline-row:last-child .chart-gridline-rule {
      border-bottom: 1.5px solid var(--gray-300);
    }

    .chart-bars-track-container {
      position: absolute;
      top: 12px;
      bottom: 1px;
      left: 48px;
      right: 12px;
      display: grid;
      grid-template-columns: repeat(6, 1fr);
      gap: 16px;
      align-items: stretch;
    }

    .chart-bar-column {
      position: relative;
      display: flex;
      flex-direction: column;
      justify-content: flex-end;
      align-items: center;
      height: 100%;
    }

    .chart-track-bg {
      position: absolute;
      top: 0;
      bottom: 0;
      width: 100%;
      max-width: 42px;
      background: rgba(14,165,233,0.05);
      border-radius: 8px 8px 0 0;
      border: 1px dashed rgba(14,165,233,0.15);
      border-bottom: none;
      transition: background 0.2s;
    }

    .chart-bar-column:hover .chart-track-bg {
      background: rgba(14,165,233,0.12);
      border-color: rgba(14,165,233,0.3);
    }

    .chart-bar-fill {
      position: relative;
      z-index: 2;
      width: 100%;
      max-width: 42px;
      border-radius: 8px 8px 0 0;
      background: var(--gradient-primary);
      transition: height 0.5s cubic-bezier(0.34, 1.56, 0.64, 1), transform 0.2s ease, box-shadow 0.2s ease;
      cursor: pointer;
    }

    .chart-bar-fill.peak {
      background: linear-gradient(180deg, #22c55e 0%, #16a34a 100%);
      box-shadow: 0 4px 14px rgba(34,197,94,0.35);
    }

    .chart-bar-column:hover .chart-bar-fill {
      transform: translateY(-4px) scaleX(1.05);
      box-shadow: 0 8px 20px rgba(14,165,233,0.45);
    }

    .chart-bar-column:hover .chart-bar-fill.peak {
      box-shadow: 0 8px 20px rgba(34,197,94,0.5);
    }

    .chart-bar-value {
      position: absolute;
      top: -26px;
      left: 50%;
      transform: translateX(-50%);
      font-size: 11px;
      font-weight: 700;
      color: var(--text-primary);
      white-space: nowrap;
      background: var(--bg-primary);
      padding: 2px 6px;
      border-radius: var(--radius-sm);
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      pointer-events: none;
      transition: all 0.3s ease;
    }

    .chart-bar-fill.peak .chart-bar-value,
    .chart-bar-column:last-child .chart-bar-value {
      color: #16A34A;
      border-color: rgba(34,197,94,0.4);
      background: rgba(34,197,94,0.08);
    }

    .chart-xaxis-labels {
      display: grid;
      grid-template-columns: repeat(6, 1fr);
      gap: 16px;
      margin-left: 48px;
      margin-right: 12px;
      padding-top: 10px;
      text-align: center;
    }

    .chart-xaxis-item {
      font-size: 12px;
      font-weight: 600;
      color: var(--text-secondary);
      transition: color 0.2s;
    }

    .chart-xaxis-item.peak {
      color: #16A34A;
      font-weight: 800;
    }

    .dest-share-item {
      margin-bottom: 12px;
    }

    .dest-share-bar-bg {
      height: 8px;
      background: var(--gray-200);
      border-radius: 999px;
      overflow: hidden;
      margin-top: 5px;
    }

    .dest-share-bar-fill {
      height: 100%;
      border-radius: 999px;
      transition: width 0.8s ease-in-out;
    }

    @media (max-width: 992px) {
      .admin-layout { grid-template-columns: 1fr; }
      .admin-sidebar { position: static; height: auto; }
      .admin-chart-grid { grid-template-columns: 1fr !important; }
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <div class="admin-layout">

    <!-- Admin Sidebar -->
    <aside class="admin-sidebar">
      
      <!-- Brand & Status -->
      <div class="admin-brand-badge">
        <div style="width:36px; height:36px; border-radius:50%; background:var(--gradient-primary); display:flex; align-items:center; justify-content:center; color:white; font-size:16px; font-weight:800; flex-shrink:0;">
          👑
        </div>
        <div>
          <div style="font-size:14px; font-weight:800; color:white; line-height:1.2;">Admin Panel</div>
          <div style="font-size:11px; color:#38BDF8; font-weight:600;">Epic-Travellers Control</div>
        </div>
      </div>

      <!-- Navigation Tabs -->
      <nav style="flex:1;">
        <button type="button" class="admin-menu-link active" onclick="switchAdminTab('tab-overview', this)">
          <i class="fa-solid fa-chart-pie"></i> <span>Overview & Stats</span>
        </button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-users', this)">
          <i class="fa-solid fa-users"></i> <span>Registered Users (<asp:Literal ID="litTotalUsersBadge" runat="server" Text="0" />)</span>
        </button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-packages', this)">
          <i class="fa-solid fa-box-archive"></i> <span>Tour Packages (6)</span>
        </button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-destinations', this)">
          <i class="fa-solid fa-map-location-dot"></i> <span>Destinations (24)</span>
        </button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-bookings', this)">
          <i class="fa-solid fa-receipt"></i> <span>Reservations & Orders</span>
        </button>
      </nav>

      <!-- Single Primary Sign Out Button in Admin Sidebar -->
      <div style="margin-top:auto; padding-top:16px; border-top:1px solid rgba(255,255,255,0.08);">
        <div style="font-size:11px; color:rgba(255,255,255,0.4); margin-bottom:4px;">Logged in Administrator</div>
        <div style="font-size:12px; font-weight:600; color:rgba(255,255,255,0.85); margin-bottom:12px; word-break:break-all;">epictravelers365@gmail.com</div>
        <a href="/Pages/logout.aspx" class="admin-logout-btn"
          style="display:flex; align-items:center; justify-content:center; gap:8px; width:100%; padding:12px 16px; background:#EF4444; color:white; border-radius:var(--radius-md); font-size:13px; font-weight:700; text-decoration:none; transition:all 0.2s; box-shadow:0 4px 12px rgba(239,68,68,0.3); box-sizing:border-box;">
          <i class="fa-solid fa-arrow-right-from-bracket"></i> Sign Out of Admin
        </a>
      </div>

    </aside>

    <!-- Admin Main Body -->
    <main style="padding:32px; overflow-x:hidden;">

      <!-- TAB 1: OVERVIEW -->
      <div id="tab-overview" class="admin-tab-panel">
        
        <!-- Header Row -->
        <div class="flex-between mb-28 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Executive Dashboard</h1>
            <p style="font-size:14px; color:var(--text-secondary);">Real-time performance metrics for Epic-Travellers India</p>
          </div>
          <div style="display:flex; gap:12px;">
            <button type="button" class="btn btn-secondary btn-sm" onclick="Toast.show('Data synced with database', 'info')">
              <i class="fa-solid fa-rotate"></i> Refresh
            </button>
            <a href="/Pages/packages.aspx" target="_blank" class="btn btn-primary btn-sm">
              <i class="fa-solid fa-arrow-up-right-from-square"></i> View Live Site
            </a>
          </div>
        </div>

        <!-- 4 Metric Cards -->
        <div class="stat-card-grid">
          
          <!-- Stat 1: Real Users from Database -->
          <div class="stat-card">
            <div>
              <div style="font-size:12px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:var(--text-muted); margin-bottom:4px;">Registered Users</div>
              <div style="font-size:30px; font-weight:800; color:var(--text-primary); line-height:1.2;">
                <asp:Literal ID="litTotalUsers" runat="server" Text="0" />
              </div>
              <div style="font-size:12px; color:#22C55E; font-weight:600; margin-top:4px;">
                <i class="fa-solid fa-database"></i> Live Database Users
              </div>
            </div>
            <div class="stat-icon-wrapper" style="background:linear-gradient(135deg, #0284c7, #0ea5e9);">
              <i class="fa-solid fa-users"></i>
            </div>
          </div>

          <!-- Stat 2: Total Revenue -->
          <div class="stat-card">
            <div>
              <div style="font-size:12px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:var(--text-muted); margin-bottom:4px;">Total Revenue</div>
              <div style="font-size:30px; font-weight:800; color:var(--text-primary); line-height:1.2;">₹42.85 L</div>
              <div style="font-size:12px; color:#22C55E; font-weight:600; margin-top:4px;">
                <i class="fa-solid fa-arrow-trend-up"></i> +24.8% vs last month
              </div>
            </div>
            <div class="stat-icon-wrapper" style="background:linear-gradient(135deg, #059669, #10b981);">
              <i class="fa-solid fa-indian-rupee-sign"></i>
            </div>
          </div>

          <!-- Stat 3: Bookings -->
          <div class="stat-card">
            <div>
              <div style="font-size:12px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:var(--text-muted); margin-bottom:4px;">Confirmed Tours</div>
              <div style="font-size:30px; font-weight:800; color:var(--text-primary); line-height:1.2;">148</div>
              <div style="font-size:12px; color:#38BDF8; font-weight:600; margin-top:4px;">
                <i class="fa-solid fa-plane-departure"></i> 32 Tours Departing Soon
              </div>
            </div>
            <div class="stat-icon-wrapper" style="background:linear-gradient(135deg, #7c3aed, #8b5cf6);">
              <i class="fa-solid fa-suitcase"></i>
            </div>
          </div>

          <!-- Stat 4: Rating -->
          <div class="stat-card">
            <div>
              <div style="font-size:12px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:var(--text-muted); margin-bottom:4px;">Traveler Rating</div>
              <div style="font-size:30px; font-weight:800; color:var(--text-primary); line-height:1.2;">4.92 / 5.0</div>
              <div style="font-size:12px; color:#F59E0B; font-weight:600; margin-top:4px;">
                <i class="fa-solid fa-star"></i> Based on 2,480+ reviews
              </div>
            </div>
            <div class="stat-icon-wrapper" style="background:linear-gradient(135deg, #d97706, #f59e0b);">
              <i class="fa-solid fa-star"></i>
            </div>
          </div>

        </div>

        <!-- Revenue & Analytics Chart Card -->
        <div class="admin-table-card mb-28">
          <div class="flex-between mb-20 flex-wrap gap-12">
            <div>
              <div style="display:flex; align-items:center; gap:10px;">
                <h3 style="font-size:18px; font-weight:700; color:var(--text-primary); margin:0;">Platform Performance &amp; Revenue Analytics</h3>
                <span class="badge badge-success" style="font-size:11px;">+24.8% YoY Growth</span>
              </div>
              <p style="font-size:13px; color:var(--text-secondary); margin-top:3px;">Monthly revenue stream, tour booking volume, and regional destination market share (FY 2025)</p>
            </div>
            
            <!-- Metric Toggle Pills -->
            <div style="display:flex; align-items:center; gap:8px; background:var(--bg-secondary); padding:4px; border-radius:var(--radius-full); border:1px solid var(--gray-200);">
              <button type="button" id="btnMetricRevenue" class="chart-toggle-btn active" onclick="switchChartMetric('revenue')">
                <i class="fa-solid fa-indian-rupee-sign"></i> Revenue (₹)
              </button>
              <button type="button" id="btnMetricBookings" class="chart-toggle-btn" onclick="switchChartMetric('bookings')">
                <i class="fa-solid fa-suitcase"></i> Bookings Count
              </button>
            </div>
          </div>

          <div class="admin-chart-grid">
            
            <!-- Left: High-Precision Bar Graph with Aligned Baseline & Y-Axis -->
            <div class="chart-panel-main">
              <div class="flex-between mb-8" style="font-size:12px; color:var(--text-secondary);">
                <span style="font-weight:700; text-transform:uppercase; letter-spacing:0.5px;" id="chartMetricTitle">Monthly Revenue Trajectory (₹ Lakhs)</span>
                <span style="color:var(--text-muted);"><i class="fa-solid fa-calendar-days"></i> May – Oct 2025</span>
              </div>

              <!-- Main Visual Canvas Area -->
              <div class="chart-canvas-container">
                
                <!-- Y-Axis Gridlines -->
                <div class="chart-gridlines">
                  <div class="chart-gridline-row">
                    <span class="chart-gridline-label" id="yAxisLvl3">₹15L</span>
                    <div class="chart-gridline-rule"></div>
                  </div>
                  <div class="chart-gridline-row">
                    <span class="chart-gridline-label" id="yAxisLvl2">₹10L</span>
                    <div class="chart-gridline-rule"></div>
                  </div>
                  <div class="chart-gridline-row">
                    <span class="chart-gridline-label" id="yAxisLvl1">₹5L</span>
                    <div class="chart-gridline-rule"></div>
                  </div>
                  <div class="chart-gridline-row">
                    <span class="chart-gridline-label" id="yAxisLvl0">₹0</span>
                    <div class="chart-gridline-rule"></div>
                  </div>
                </div>

                <!-- 6 Column Bars with Subdued Track Backgrounds & Animated Fill -->
                <div class="chart-bars-track-container">
                  
                  <!-- Month 1: May -->
                  <div class="chart-bar-column" title="May 2025: ₹4,20,000 (18 Confirmed Bookings)">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill" id="barFill0" style="height: 28%;">
                      <div class="chart-bar-value" id="barVal0">₹4.2L</div>
                    </div>
                  </div>

                  <!-- Month 2: Jun -->
                  <div class="chart-bar-column" title="Jun 2025: ₹5,80,000 (24 Confirmed Bookings)">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill" id="barFill1" style="height: 38.6%;">
                      <div class="chart-bar-value" id="barVal1">₹5.8L</div>
                    </div>
                  </div>

                  <!-- Month 3: Jul -->
                  <div class="chart-bar-column" title="Jul 2025: ₹3,90,000 (16 Confirmed Bookings)">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill" id="barFill2" style="height: 26%;">
                      <div class="chart-bar-value" id="barVal2">₹3.9L</div>
                    </div>
                  </div>

                  <!-- Month 4: Aug -->
                  <div class="chart-bar-column" title="Aug 2025: ₹7,10,000 (29 Confirmed Bookings)">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill" id="barFill3" style="height: 47.3%;">
                      <div class="chart-bar-value" id="barVal3">₹7.1L</div>
                    </div>
                  </div>

                  <!-- Month 5: Sep -->
                  <div class="chart-bar-column" title="Sep 2025: ₹8,60,000 (34 Confirmed Bookings)">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill" id="barFill4" style="height: 57.3%;">
                      <div class="chart-bar-value" id="barVal4">₹8.6L</div>
                    </div>
                  </div>

                  <!-- Month 6: Oct (Peak Season) -->
                  <div class="chart-bar-column" title="Oct 2025 (Peak Season): ₹13,20,000 (52 Confirmed Bookings)">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill peak" id="barFill5" style="height: 88%;">
                      <div class="chart-bar-value" id="barVal5">₹13.2L ★</div>
                    </div>
                  </div>

                </div>
              </div>

              <!-- Aligned X-Axis Month Badges -->
              <div class="chart-xaxis-labels">
                <span class="chart-xaxis-item">May</span>
                <span class="chart-xaxis-item">Jun</span>
                <span class="chart-xaxis-item">Jul</span>
                <span class="chart-xaxis-item">Aug</span>
                <span class="chart-xaxis-item">Sep</span>
                <span class="chart-xaxis-item peak">Oct (Peak)</span>
              </div>

              <!-- Mini Footer Callout -->
              <div style="margin-top:16px; padding-top:12px; border-top:1px solid var(--gray-200); display:flex; align-items:center; justify-content:space-between; font-size:12px; color:var(--text-muted);">
                <span><i class="fa-solid fa-circle-info" style="color:var(--primary);"></i> Peak booking spike in October due to Diwali holiday itineraries.</span>
                <strong style="color:var(--text-primary);">Avg Growth: +18.4%/mo</strong>
              </div>

            </div>

            <!-- Right: Regional Revenue Breakdown & Donut Summary -->
            <div class="chart-panel-side">
              <div>
                <div class="flex-between mb-12">
                  <h4 style="font-size:13px; font-weight:700; text-transform:uppercase; letter-spacing:0.5px; color:var(--text-primary); margin:0;">Destination Share</h4>
                  <span class="badge badge-primary" style="font-size:10px;">₹42.85 Lakhs</span>
                </div>

                <!-- Item 1: Rajasthan -->
                <div class="dest-share-item">
                  <div class="flex-between" style="font-size:12px;">
                    <span style="font-weight:600; color:var(--text-primary);"><span style="color:#0ea5e9;">●</span> 🏰 Rajasthan</span>
                    <strong>38% <span style="font-weight:500; color:var(--text-muted);">(₹16.28L)</span></strong>
                  </div>
                  <div class="dest-share-bar-bg">
                    <div class="dest-share-bar-fill" style="width:38%; background:linear-gradient(90deg, #0284c7, #0ea5e9);"></div>
                  </div>
                </div>

                <!-- Item 2: Kerala -->
                <div class="dest-share-item">
                  <div class="flex-between" style="font-size:12px;">
                    <span style="font-weight:600; color:var(--text-primary);"><span style="color:#10b981;">●</span> 🌿 Kerala</span>
                    <strong>28% <span style="font-weight:500; color:var(--text-muted);">(₹12.00L)</span></strong>
                  </div>
                  <div class="dest-share-bar-bg">
                    <div class="dest-share-bar-fill" style="width:28%; background:linear-gradient(90deg, #059669, #10b981);"></div>
                  </div>
                </div>

                <!-- Item 3: Ladakh -->
                <div class="dest-share-item">
                  <div class="flex-between" style="font-size:12px;">
                    <span style="font-weight:600; color:var(--text-primary);"><span style="color:#8b5cf6;">●</span> 🏔️ Ladakh</span>
                    <strong>20% <span style="font-weight:500; color:var(--text-muted);">(₹8.57L)</span></strong>
                  </div>
                  <div class="dest-share-bar-bg">
                    <div class="dest-share-bar-fill" style="width:20%; background:linear-gradient(90deg, #7c3aed, #8b5cf6);"></div>
                  </div>
                </div>

                <!-- Item 4: Goa -->
                <div class="dest-share-item">
                  <div class="flex-between" style="font-size:12px;">
                    <span style="font-weight:600; color:var(--text-primary);"><span style="color:#f59e0b;">●</span> 🏖️ Goa</span>
                    <strong>14% <span style="font-weight:500; color:var(--text-muted);">(₹6.00L)</span></strong>
                  </div>
                  <div class="dest-share-bar-bg">
                    <div class="dest-share-bar-fill" style="width:14%; background:linear-gradient(90deg, #d97706, #f59e0b);"></div>
                  </div>
                </div>
              </div>

              <!-- Quick KPI Snapshot at bottom of right panel -->
              <div style="background:var(--bg-primary); border:1px solid var(--gray-200); border-radius:var(--radius-lg); padding:12px 14px; margin-top:14px; display:grid; grid-template-columns:1fr 1fr; gap:10px;">
                <div>
                  <div style="font-size:10px; text-transform:uppercase; font-weight:700; color:var(--text-muted);">Avg Order Value</div>
                  <div style="font-size:14px; font-weight:800; color:var(--text-primary); margin-top:2px;">₹28,950</div>
                </div>
                <div>
                  <div style="font-size:10px; text-transform:uppercase; font-weight:700; color:var(--text-muted);">Conversion</div>
                  <div style="font-size:14px; font-weight:800; color:#16A34A; margin-top:2px;">4.2% (High)</div>
                </div>
              </div>

            </div>

          </div>
        </div>

        <!-- Recent Reservations Table Preview -->
        <div class="admin-table-card">
          <div class="flex-between mb-16">
            <h3 style="font-size:18px; font-weight:700; color:var(--text-primary);">Recent Tour Reservations</h3>
            <button type="button" class="btn btn-secondary btn-sm" onclick="switchAdminTab('tab-bookings', document.querySelectorAll('.admin-menu-link')[4])">
              View All Bookings →
            </button>
          </div>

          <div style="overflow-x:auto;">
            <table class="admin-table">
              <thead>
                <tr>
                  <th>Booking ID</th>
                  <th>Traveler</th>
                  <th>Package Tour</th>
                  <th>Travel Dates</th>
                  <th>Amount</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><strong>#EPIC-89210</strong></td>
                  <td>Darshan Hapaliya</td>
                  <td>Royal Rajasthan Expedition</td>
                  <td>Oct 15 – Oct 22, 2025</td>
                  <td style="font-weight:700; color:var(--primary);">₹45,000</td>
                  <td><span class="badge badge-success">✓ Confirmed</span></td>
                  <td><button type="button" class="table-action-btn" onclick="Toast.show('Booking details opened', 'info')">Details</button></td>
                </tr>
                <tr>
                  <td><strong>#EPIC-94102</strong></td>
                  <td>Priya Sharma</td>
                  <td>Kerala Backwaters Romantic Bliss</td>
                  <td>Nov 05 – Nov 11, 2025</td>
                  <td style="font-weight:700; color:var(--primary);">₹36,000</td>
                  <td><span class="badge badge-primary">⏳ Upcoming</span></td>
                  <td><button type="button" class="table-action-btn" onclick="Toast.show('Booking details opened', 'info')">Details</button></td>
                </tr>
                <tr>
                  <td><strong>#EPIC-77419</strong></td>
                  <td>Aarav Mehta</td>
                  <td>Ladakh High Altitude Expedition</td>
                  <td>Dec 01 – Dec 08, 2025</td>
                  <td style="font-weight:700; color:var(--primary);">₹64,000</td>
                  <td><span class="badge badge-success">✓ Confirmed</span></td>
                  <td><button type="button" class="table-action-btn" onclick="Toast.show('Booking details opened', 'info')">Details</button></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

      </div>

      <!-- TAB 2: LIVE USERS FROM DATABASE -->
      <div id="tab-users" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-28 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Registered Users Database</h1>
            <p style="font-size:14px; color:var(--text-secondary);">Direct live data query from <code>user_tbl</code></p>
          </div>
          <button type="button" class="btn btn-primary btn-sm" onclick="Toast.show('New user registered via registration portal', 'info')">
            <i class="fa-solid fa-user-plus"></i> Add User
          </button>
        </div>

        <div class="admin-table-card">
          <div style="overflow-x:auto;">
            <table class="admin-table">
              <thead>
                <tr>
                  <th>User ID</th>
                  <th>Full Name</th>
                  <th>Email Address</th>
                  <th>Account Role</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <asp:Repeater ID="rptRegisteredUsers" runat="server">
                  <ItemTemplate>
                    <tr>
                      <td><strong style="color:var(--primary);">#USR-<%# Eval("Id") %></strong></td>
                      <td>
                        <div style="display:flex; align-items:center; gap:8px;">
                          <span style="width:30px; height:30px; border-radius:50%; background:var(--gradient-primary); color:white; display:flex; align-items:center; justify-content:center; font-size:12px; font-weight:700;">
                            <%# GetUserInitial(Eval("Full Name")) %>
                          </span>
                          <strong><%# Eval("Full Name") %></strong>
                        </div>
                      </td>
                      <td><%# Eval("Email") %></td>
                      <td>
                        <%# GetUserRoleBadge(Eval("Email")) %>
                      </td>
                      <td><span class="badge badge-success">● Active</span></td>
                      <td>
                        <button type="button" class="table-action-btn" onclick="Toast.show('User selected', 'info')">Manage</button>
                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- TAB 3: TOUR PACKAGES MANAGER -->
      <div id="tab-packages" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-28 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Tour Package Catalog</h1>
            <p style="font-size:14px; color:var(--text-secondary);">Manage, price, and publish travel itineraries across India</p>
          </div>
          <a href="/Pages/packages.aspx" target="_blank" class="btn btn-primary btn-sm">
            <i class="fa-solid fa-plus"></i> Add New Package
          </a>
        </div>

        <div class="admin-table-card">
          <div style="overflow-x:auto;">
            <table class="admin-table">
              <thead>
                <tr>
                  <th>Package Title</th>
                  <th>Destination</th>
                  <th>Duration</th>
                  <th>Price</th>
                  <th>Rating</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><strong>🏰 Royal Rajasthan Expedition</strong></td>
                  <td>Rajasthan</td>
                  <td>8 Days / 7 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹45,000</td>
                  <td>⭐ 4.9 (420)</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>
                    <button type="button" class="table-action-btn" onclick="Toast.show('Package updated', 'success')">Edit</button>
                  </td>
                </tr>
                <tr>
                  <td><strong>🌿 Kerala Backwaters &amp; Beaches</strong></td>
                  <td>Kerala</td>
                  <td>6 Days / 5 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹36,000</td>
                  <td>⭐ 4.9 (310)</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>
                    <button type="button" class="table-action-btn" onclick="Toast.show('Package updated', 'success')">Edit</button>
                  </td>
                </tr>
                <tr>
                  <td><strong>🏔️ Ladakh High Altitude Expedition</strong></td>
                  <td>Ladakh</td>
                  <td>7 Days / 6 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹32,000</td>
                  <td>⭐ 4.8 (290)</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>
                    <button type="button" class="table-action-btn" onclick="Toast.show('Package updated', 'success')">Edit</button>
                  </td>
                </tr>
                <tr>
                  <td><strong>🏖️ Goa Beach Holiday &amp; Nightlife</strong></td>
                  <td>Goa</td>
                  <td>4 Days / 3 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹18,000</td>
                  <td>⭐ 4.7 (520)</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>
                    <button type="button" class="table-action-btn" onclick="Toast.show('Package updated', 'success')">Edit</button>
                  </td>
                </tr>
                <tr>
                  <td><strong>❄️ Manali &amp; Shimla Snow Wonder</strong></td>
                  <td>Himachal</td>
                  <td>5 Days / 4 Nights</td>
                  <td style="font-weight:700; color:var(--primary);">₹24,000</td>
                  <td>⭐ 4.8 (180)</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>
                    <button type="button" class="table-action-btn" onclick="Toast.show('Package updated', 'success')">Edit</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- TAB 4: DESTINATIONS -->
      <div id="tab-destinations" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-28 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Destinations Manager</h1>
            <p style="font-size:14px; color:var(--text-secondary);">Curate featured Indian travel regions and highlights</p>
          </div>
          <button type="button" class="btn btn-primary btn-sm" onclick="Toast.show('Destination editor opened', 'info')">
            <i class="fa-solid fa-location-plus"></i> Add Destination
          </button>
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
                  <th>Packages</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><strong>🏰 Jaipur, Udaipur &amp; Jodhpur</strong></td>
                  <td>Rajasthan</td>
                  <td>Heritage &amp; Forts</td>
                  <td>⭐ 4.9</td>
                  <td>18 Tours</td>
                  <td><span class="badge badge-success">Published</span></td>
                  <td><button type="button" class="table-action-btn" onclick="Toast.show('Saved', 'success')">Edit</button></td>
                </tr>
                <tr>
                  <td><strong>🏖️ North &amp; South Goa</strong></td>
                  <td>Goa</td>
                  <td>Beaches &amp; Coastal</td>
                  <td>⭐ 4.8</td>
                  <td>14 Tours</td>
                  <td><span class="badge badge-success">Published</span></td>
                  <td><button type="button" class="table-action-btn" onclick="Toast.show('Saved', 'success')">Edit</button></td>
                </tr>
                <tr>
                  <td><strong>🌿 Munnar &amp; Alleppey</strong></td>
                  <td>Kerala</td>
                  <td>Backwaters &amp; Tea Hills</td>
                  <td>⭐ 4.9</td>
                  <td>12 Tours</td>
                  <td><span class="badge badge-success">Published</span></td>
                  <td><button type="button" class="table-action-btn" onclick="Toast.show('Saved', 'success')">Edit</button></td>
                </tr>
                <tr>
                  <td><strong>🏔️ Leh &amp; Pangong Tso</strong></td>
                  <td>Ladakh</td>
                  <td>High Altitude Adventure</td>
                  <td>⭐ 4.9</td>
                  <td>9 Tours</td>
                  <td><span class="badge badge-success">Published</span></td>
                  <td><button type="button" class="table-action-btn" onclick="Toast.show('Saved', 'success')">Edit</button></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- TAB 5: RESERVATIONS & ORDERS -->
      <div id="tab-bookings" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-28 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">All Customer Bookings</h1>
            <p style="font-size:14px; color:var(--text-secondary);">Manage itinerary confirmations, invoices, and traveler records</p>
          </div>
          <button type="button" class="btn btn-secondary btn-sm" onclick="window.print()">
            <i class="fa-solid fa-print"></i> Print Report
          </button>
        </div>

        <div class="admin-table-card">
          <div style="overflow-x:auto;">
            <table class="admin-table">
              <thead>
                <tr>
                  <th>Order ID</th>
                  <th>Traveler</th>
                  <th>Tour Package</th>
                  <th>Guests</th>
                  <th>Amount</th>
                  <th>Payment</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><strong>#EPIC-89210</strong></td>
                  <td>Darshan Hapaliya</td>
                  <td>Royal Rajasthan Expedition</td>
                  <td>2 Adults</td>
                  <td style="font-weight:700; color:var(--primary);">₹45,000</td>
                  <td><span class="badge badge-primary">💳 UPI Paid</span></td>
                  <td><span class="badge badge-success">Confirmed</span></td>
                </tr>
                <tr>
                  <td><strong>#EPIC-94102</strong></td>
                  <td>Priya Sharma</td>
                  <td>Kerala Backwaters Romantic Bliss</td>
                  <td>2 Adults</td>
                  <td style="font-weight:700; color:var(--primary);">₹36,000</td>
                  <td><span class="badge badge-primary">💳 Card Paid</span></td>
                  <td><span class="badge badge-primary">Upcoming</span></td>
                </tr>
                <tr>
                  <td><strong>#EPIC-77419</strong></td>
                  <td>Aarav Mehta</td>
                  <td>Ladakh High Altitude Expedition</td>
                  <td>3 Adults</td>
                  <td style="font-weight:700; color:var(--primary);">₹64,000</td>
                  <td><span class="badge badge-primary">💳 NetBanking</span></td>
                  <td><span class="badge badge-success">Confirmed</span></td>
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

    // Interactive Analytics Graph Metric Switcher
    const chartData = {
      revenue: {
        title: "Monthly Revenue Trajectory (₹ Lakhs)",
        yAxis: ["₹15L", "₹10L", "₹5L", "₹0"],
        values: ["₹4.2L", "₹5.8L", "₹3.9L", "₹7.1L", "₹8.6L", "₹13.2L ★"],
        heights: ["28%", "38.6%", "26%", "47.3%", "57.3%", "88%"]
      },
      bookings: {
        title: "Monthly Tour Reservations Volume (Confirmed Bookings)",
        yAxis: ["60 Tours", "40 Tours", "20 Tours", "0"],
        values: ["18 Tours", "24 Tours", "16 Tours", "29 Tours", "34 Tours", "52 Tours ★"],
        heights: ["30%", "40%", "26.6%", "48.3%", "56.6%", "86.6%"]
      }
    };

    function switchChartMetric(type) {
      const revBtn = document.getElementById('btnMetricRevenue');
      const bkgBtn = document.getElementById('btnMetricBookings');
      const titleEl = document.getElementById('chartMetricTitle');

      if (type === 'revenue') {
        if (revBtn) revBtn.classList.add('active');
        if (bkgBtn) bkgBtn.classList.remove('active');
      } else {
        if (bkgBtn) bkgBtn.classList.add('active');
        if (revBtn) revBtn.classList.remove('active');
      }

      const d = chartData[type] || chartData.revenue;
      if (titleEl) titleEl.innerText = d.title;

      // Update Y-Axis labels
      const y3 = document.getElementById('yAxisLvl3');
      const y2 = document.getElementById('yAxisLvl2');
      const y1 = document.getElementById('yAxisLvl1');
      const y0 = document.getElementById('yAxisLvl0');
      if (y3) y3.innerText = d.yAxis[0];
      if (y2) y2.innerText = d.yAxis[1];
      if (y1) y1.innerText = d.yAxis[2];
      if (y0) y0.innerText = d.yAxis[3];

      // Update Bar heights & values
      for (let i = 0; i < 6; i++) {
        const fill = document.getElementById('barFill' + i);
        const val = document.getElementById('barVal' + i);
        if (fill) fill.style.height = d.heights[i];
        if (val) val.innerText = d.values[i];
      }
    }
  </script>
</asp:Content>
