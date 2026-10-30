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

    /* GridView Edit / Modify Controls */
    .admin-edit-input {
      width: 100%;
      box-sizing: border-box;
      padding: 6px 10px;
      font-size: 13px;
      border: 1px solid var(--primary);
      border-radius: var(--radius-md);
      background: var(--bg-primary);
      color: var(--text-primary);
      outline: none;
      box-shadow: 0 0 0 2px rgba(14,165,233,0.15);
    }
    .admin-edit-select {
      box-sizing: border-box;
      padding: 6px 10px;
      font-size: 13px;
      border: 1px solid var(--primary);
      border-radius: var(--radius-md);
      background: var(--bg-primary);
      color: var(--text-primary);
      outline: none;
    }
    .btn-grid-edit {
      display: inline-flex;
      align-items: center;
      gap: 5px;
      padding: 6px 12px;
      font-size: 12px;
      font-weight: 600;
      border-radius: var(--radius-md);
      cursor: pointer;
      background: rgba(14,165,233,0.12);
      color: var(--primary);
      border: 1px solid rgba(14,165,233,0.3);
      text-decoration: none;
      transition: all 0.2s;
    }
    .btn-grid-edit:hover {
      background: var(--primary);
      color: white;
    }
    .btn-grid-update {
      display: inline-flex;
      align-items: center;
      gap: 5px;
      padding: 6px 12px;
      font-size: 12px;
      font-weight: 600;
      border-radius: var(--radius-md);
      cursor: pointer;
      background: #10B981;
      color: white;
      border: 1px solid #10B981;
      text-decoration: none;
      transition: all 0.2s;
    }
    .btn-grid-update:hover {
      background: #059669;
    }
    .btn-grid-cancel {
      display: inline-flex;
      align-items: center;
      gap: 5px;
      padding: 6px 12px;
      font-size: 12px;
      font-weight: 600;
      border-radius: var(--radius-md);
      cursor: pointer;
      background: rgba(255,255,255,0.08);
      color: var(--text-secondary);
      border: 1px solid var(--gray-300);
      text-decoration: none;
      transition: all 0.2s;
    }
    .btn-grid-cancel:hover {
      background: rgba(255,255,255,0.16);
      color: var(--text-primary);
    }
    .btn-grid-delete {
      display: inline-flex;
      align-items: center;
      gap: 5px;
      padding: 6px 10px;
      font-size: 12px;
      font-weight: 600;
      border-radius: var(--radius-md);
      cursor: pointer;
      background: rgba(239,68,68,0.1);
      color: #EF4444;
      border: 1px solid rgba(239,68,68,0.3);
      text-decoration: none;
      transition: all 0.2s;
    }
    .btn-grid-delete:hover {
      background: #EF4444;
      color: white;
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

    /* GridView & DataList Cards View */
    .admin-datalist-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(290px, 1fr));
      gap: 20px;
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
    <asp:HiddenField ID="hfActiveTab" runat="server" Value="tab-overview" />

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

      <!-- Navigation Tabs with Dynamic Database Counts -->
      <nav style="flex:1;">
        <button type="button" class="admin-menu-link active" onclick="switchAdminTab('tab-overview', this)">
          <i class="fa-solid fa-chart-pie"></i> <span>Overview &amp; Stats</span>
        </button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-users', this)">
          <i class="fa-solid fa-users"></i> <span>Registered Users (<asp:Literal ID="litTotalUsersBadge" runat="server" Text="0" />)</span>
        </button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-packages', this)">
          <i class="fa-solid fa-box-archive"></i> <span>Tour Packages (<asp:Literal ID="litTotalPackagesBadge" runat="server" Text="0" />)</span>
        </button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-destinations', this)">
          <i class="fa-solid fa-map-location-dot"></i> <span>Destinations (<asp:Literal ID="litTotalDestinationsBadge" runat="server" Text="0" />)</span>
        </button>
        <button type="button" class="admin-menu-link" onclick="switchAdminTab('tab-bookings', this)">
          <i class="fa-solid fa-receipt"></i> <span>Reservations &amp; Orders (<asp:Literal ID="litTotalBookingsBadge" runat="server" Text="0" />)</span>
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

      <!-- TAB 1: OVERVIEW & STATS -->
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

        <!-- 4 Metric Cards (Directly Powered by Database) -->
        <div class="stat-card-grid">
          
          <!-- Stat 1: Registered Users from Database -->
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

          <!-- Stat 2: Total Revenue from Bookings Database -->
          <div class="stat-card">
            <div>
              <div style="font-size:12px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:var(--text-muted); margin-bottom:4px;">Total Revenue</div>
              <div style="font-size:30px; font-weight:800; color:var(--text-primary); line-height:1.2;">
                <asp:Literal ID="litTotalRevenue" runat="server" Text="&#8377;0" />
              </div>
              <div style="font-size:12px; color:#22C55E; font-weight:600; margin-top:4px;">
                <i class="fa-solid fa-arrow-trend-up"></i> +24.8% vs last month
              </div>
            </div>
            <div class="stat-icon-wrapper" style="background:linear-gradient(135deg, #059669, #10b981);">
              <i class="fa-solid fa-indian-rupee-sign"></i>
            </div>
          </div>

          <!-- Stat 3: Confirmed Tours from Cart_tbl -->
          <div class="stat-card">
            <div>
              <div style="font-size:12px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:var(--text-muted); margin-bottom:4px;">Confirmed Tours</div>
              <div style="font-size:30px; font-weight:800; color:var(--text-primary); line-height:1.2;">
                <asp:Literal ID="litConfirmedTours" runat="server" Text="0" />
              </div>
              <div style="font-size:12px; color:#38BDF8; font-weight:600; margin-top:4px;">
                <i class="fa-solid fa-plane-departure"></i> Active Reservations
              </div>
            </div>
            <div class="stat-icon-wrapper" style="background:linear-gradient(135deg, #7c3aed, #8b5cf6);">
              <i class="fa-solid fa-suitcase"></i>
            </div>
          </div>

          <!-- Stat 4: Rating from Package_tbl -->
          <div class="stat-card">
            <div>
              <div style="font-size:12px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:var(--text-muted); margin-bottom:4px;">Traveler Rating</div>
              <div style="font-size:30px; font-weight:800; color:var(--text-primary); line-height:1.2;">
                <asp:Literal ID="litAvgRating" runat="server" Text="4.92 / 5.0" />
              </div>
              <div style="font-size:12px; color:#F59E0B; font-weight:600; margin-top:4px;">
                <i class="fa-solid fa-star"></i> Based on verified tours
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
                  <div class="chart-bar-column">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill" id="barFill0" style="height:28%;">
                      <span class="chart-bar-value" id="barVal0">₹4.2L</span>
                    </div>
                  </div>

                  <!-- Month 2: Jun -->
                  <div class="chart-bar-column">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill" id="barFill1" style="height:38.6%;">
                      <span class="chart-bar-value" id="barVal1">₹5.8L</span>
                    </div>
                  </div>

                  <!-- Month 3: Jul -->
                  <div class="chart-bar-column">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill" id="barFill2" style="height:26%;">
                      <span class="chart-bar-value" id="barVal2">₹3.9L</span>
                    </div>
                  </div>

                  <!-- Month 4: Aug -->
                  <div class="chart-bar-column">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill" id="barFill3" style="height:47.3%;">
                      <span class="chart-bar-value" id="barVal3">₹7.1L</span>
                    </div>
                  </div>

                  <!-- Month 5: Sep -->
                  <div class="chart-bar-column">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill" id="barFill4" style="height:57.3%;">
                      <span class="chart-bar-value" id="barVal4">₹8.6L</span>
                    </div>
                  </div>

                  <!-- Month 6: Oct (Peak) -->
                  <div class="chart-bar-column">
                    <div class="chart-track-bg"></div>
                    <div class="chart-bar-fill peak" id="barFill5" style="height:88%;">
                      <span class="chart-bar-value" id="barVal5">₹13.2L ★</span>
                    </div>
                  </div>

                </div>

              </div>

              <!-- Shared X-Axis Labels Row -->
              <div class="chart-xaxis-labels">
                <span class="chart-xaxis-item">May</span>
                <span class="chart-xaxis-item">Jun</span>
                <span class="chart-xaxis-item">Jul</span>
                <span class="chart-xaxis-item">Aug</span>
                <span class="chart-xaxis-item">Sep</span>
                <span class="chart-xaxis-item peak">Oct (Peak)</span>
              </div>

            </div>

            <!-- Right: Regional Destination Market Share Progress Bars -->
            <div class="chart-panel-side">
              <div>
                <div class="flex-between mb-16">
                  <span style="font-weight:700; font-size:12px; text-transform:uppercase; letter-spacing:0.5px; color:var(--text-secondary);">Destination Share</span>
                  <span style="font-size:11px; font-weight:700; color:var(--primary); background:rgba(14,165,233,0.1); padding:2px 8px; border-radius:var(--radius-full);">&#8377;42.85 Lakhs</span>
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

        <!-- Recent Reservations: Dynamic ASP.NET GridView from Cart_tbl -->
        <div class="admin-table-card">
          <div class="flex-between mb-16">
            <h3 style="font-size:18px; font-weight:700; color:var(--text-primary);">Recent Tour Reservations (Live Database)</h3>
            <button type="button" class="btn btn-secondary btn-sm" onclick="switchAdminTab('tab-bookings', document.querySelectorAll('.admin-menu-link')[4])">
              View All Bookings &rarr;
            </button>
          </div>

          <div style="overflow-x:auto;">
            <asp:GridView ID="gvRecentBookings" runat="server" AutoGenerateColumns="false" CssClass="admin-table" GridLines="None" UseAccessibleHeader="true" OnPreRender="GridView_PreRender" DataKeyNames="Cart_Id" OnRowEditing="gvRecentBookings_RowEditing" OnRowUpdating="gvRecentBookings_RowUpdating" OnRowCancelingEdit="gvRecentBookings_RowCancelingEdit" OnRowDeleting="gvRecentBookings_RowDeleting" OnRowDataBound="gvRecentBookings_RowDataBound">
              <Columns>
                <asp:TemplateField HeaderText="Booking ID">
                  <ItemTemplate>
                    <strong style="color:var(--primary);"><%# Eval("Booking_Code") %></strong>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Traveler">
                  <ItemTemplate>
                    <div style="display:flex; align-items:center; gap:8px;">
                      <span style="width:28px; height:28px; border-radius:50%; background:var(--gradient-primary); color:white; display:flex; align-items:center; justify-content:center; font-size:11px; font-weight:700;">
                        <%# GetUserInitial(Eval("FullName")) %>
                      </span>
                      <strong><%# Eval("FullName") %></strong>
                    </div>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Package Tour">
                  <ItemTemplate>
                    <span><%# Eval("Pkg_Title") %></span>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Travel Dates">
                  <ItemTemplate>
                    <span><i class="fa-regular fa-calendar" style="color:var(--text-muted); margin-right:4px;"></i><%# Eval("Travel_Date") %></span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditRecentTravelDate" runat="server" Text='<%# Bind("Travel_Date") %>' CssClass="admin-edit-input"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Guests">
                  <ItemTemplate>
                    <span><%# Eval("Quantity") %> Traveler(s)</span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:DropDownList ID="ddlEditRecentQty" runat="server" CssClass="admin-edit-select">
                      <asp:ListItem Value="1">1</asp:ListItem>
                      <asp:ListItem Value="2">2</asp:ListItem>
                      <asp:ListItem Value="3">3</asp:ListItem>
                      <asp:ListItem Value="4">4</asp:ListItem>
                      <asp:ListItem Value="5">5</asp:ListItem>
                      <asp:ListItem Value="6">6</asp:ListItem>
                    </asp:DropDownList>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Amount">
                  <ItemTemplate>
                    <strong style="color:var(--primary);">&#8377;<%# Eval("TotalPrice", "{0:N0}") %></strong>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                  <ItemTemplate>
                    <span class="badge badge-success"><i class="fa-solid fa-check" style="margin-right:3px;"></i> <%# Eval("Status") %></span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:DropDownList ID="ddlEditRecentStatus" runat="server" CssClass="admin-edit-select">
                      <asp:ListItem Value="Confirmed">Confirmed</asp:ListItem>
                      <asp:ListItem Value="Pending">Pending</asp:ListItem>
                      <asp:ListItem Value="Completed">Completed</asp:ListItem>
                      <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                    </asp:DropDownList>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                  <ItemTemplate>
                    <div style="display:flex; align-items:center; gap:6px;">
                      <asp:LinkButton ID="btnEditRecent" runat="server" CommandName="Edit" CssClass="btn-grid-edit" ToolTip="Modify Booking"><i class="fa-solid fa-pen-to-square"></i> Modify</asp:LinkButton>
                      <asp:LinkButton ID="btnDeleteRecent" runat="server" CommandName="Delete" CssClass="btn-grid-delete" OnClientClick="return confirm('Are you sure you want to delete this reservation?');" ToolTip="Delete Booking"><i class="fa-solid fa-trash"></i></asp:LinkButton>
                    </div>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <div style="display:flex; align-items:center; gap:6px;">
                      <asp:LinkButton ID="btnUpdateRecent" runat="server" CommandName="Update" CssClass="btn-grid-update" ToolTip="Save Changes"><i class="fa-solid fa-check"></i> Save</asp:LinkButton>
                      <asp:LinkButton ID="btnCancelRecent" runat="server" CommandName="Cancel" CssClass="btn-grid-cancel" ToolTip="Cancel"><i class="fa-solid fa-xmark"></i> Cancel</asp:LinkButton>
                    </div>
                  </EditItemTemplate>
                </asp:TemplateField>
              </Columns>
              <EmptyDataTemplate>
                <div style="padding:24px; text-align:center; color:var(--text-muted);">
                  <i class="fa-solid fa-inbox" style="font-size:28px; margin-bottom:8px; display:block;"></i>
                  No recent bookings found.
                </div>
              </EmptyDataTemplate>
            </asp:GridView>
          </div>
        </div>

      </div>

      <!-- TAB 2: REGISTERED USERS DATABASE (Powered by GridView) -->
      <div id="tab-users" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-28 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Registered Users Database</h1>
          </div>
        </div>
        <br />
        <div class="admin-table-card">
          <div style="overflow-x:auto;">
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" CssClass="admin-table" GridLines="None" UseAccessibleHeader="true" OnPreRender="GridView_PreRender" DataKeyNames="Id" OnRowEditing="gvUsers_RowEditing" OnRowUpdating="gvUsers_RowUpdating" OnRowCancelingEdit="gvUsers_RowCancelingEdit" OnRowDeleting="gvUsers_RowDeleting">
              <Columns>
                <asp:TemplateField HeaderText="User ID">
                  <ItemTemplate>
                    <strong style="color:var(--primary);">#USR-<%# Eval("Id") %></strong>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Full Name">
                  <ItemTemplate>
                    <div style="display:flex; align-items:center; gap:8px;">
                      <span style="width:30px; height:30px; border-radius:50%; background:var(--gradient-primary); color:white; display:flex; align-items:center; justify-content:center; font-size:12px; font-weight:700;">
                        <%# GetUserInitial(Eval("Full Name")) %>
                      </span>
                      <strong><%# Eval("Full Name") %></strong>
                    </div>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditFullName" runat="server" Text='<%# Bind("[Full Name]") %>' CssClass="admin-edit-input"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email Address">
                  <ItemTemplate>
                    <span><%# Eval("Email") %></span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="admin-edit-input"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Account Role">
                  <ItemTemplate>
                    <%# GetUserRoleBadge(Eval("Email")) %>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                  <ItemTemplate>
                    <span class="badge badge-success"><i class="fa-solid fa-circle" style="font-size:8px; margin-right:4px;"></i> Active</span>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                  <ItemTemplate>
                    <div style="display:flex; align-items:center; gap:6px;">
                      <asp:LinkButton ID="btnEditUser" runat="server" CommandName="Edit" CssClass="btn-grid-edit" ToolTip="Modify User"><i class="fa-solid fa-pen-to-square"></i> Modify</asp:LinkButton>
                      <asp:LinkButton ID="btnDeleteUser" runat="server" CommandName="Delete" CssClass="btn-grid-delete" OnClientClick="return confirm('Are you sure you want to delete this user?');" ToolTip="Delete User"><i class="fa-solid fa-trash"></i></asp:LinkButton>
                    </div>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <div style="display:flex; align-items:center; gap:6px;">
                      <asp:LinkButton ID="btnUpdateUser" runat="server" CommandName="Update" CssClass="btn-grid-update" ToolTip="Save Changes"><i class="fa-solid fa-check"></i> Save</asp:LinkButton>
                      <asp:LinkButton ID="btnCancelUser" runat="server" CommandName="Cancel" CssClass="btn-grid-cancel" ToolTip="Cancel"><i class="fa-solid fa-xmark"></i> Cancel</asp:LinkButton>
                    </div>
                  </EditItemTemplate>
                </asp:TemplateField>
              </Columns>
              <EmptyDataTemplate>
                <div style="padding:24px; text-align:center; color:var(--text-muted);">
                  <i class="fa-solid fa-users-slash" style="font-size:28px; margin-bottom:8px; display:block;"></i>
                  No registered users found in database.
                </div>
              </EmptyDataTemplate>
            </asp:GridView>
          </div>
        </div>
      </div>

      <!-- TAB 3: TOUR PACKAGES CATALOG (GridView ONLY - No DataList) -->
      <div id="tab-packages" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-28 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Tour Package Catalog</h1>
          </div>
          <div style="display:flex; align-items:center; gap:8px;">
            <a href="/Pages/packages.aspx" target="_blank" class="btn btn-primary btn-sm">
              <i class="fa-solid fa-arrow-up-right-from-square"></i> Browse Public Site
            </a>
          </div>
        </div>
        <br />
        <!-- Tour Packages Table View (GridView ONLY) -->
        <div id="pkg-table-wrap" class="admin-table-card">
          <div style="overflow-x:auto;">
            <asp:GridView ID="gvPackages" runat="server" AutoGenerateColumns="false" CssClass="admin-table" GridLines="None" UseAccessibleHeader="true" OnPreRender="GridView_PreRender" DataKeyNames="Pkg_Id" OnRowEditing="gvPackages_RowEditing" OnRowUpdating="gvPackages_RowUpdating" OnRowCancelingEdit="gvPackages_RowCancelingEdit" OnRowDeleting="gvPackages_RowDeleting">
              <Columns>
                <asp:TemplateField HeaderText="Package Title">
                  <ItemTemplate>
                    <div style="display:flex; align-items:center; gap:12px;">
                      <img src='<%# Eval("Pkg_Image") %>' alt='<%# Eval("Pkg_Title") %>' style="width:48px; height:36px; object-fit:cover; border-radius:var(--radius-sm); border:1px solid var(--gray-200);" onerror="this.src='../Content/images/img_48.jpg';" />
                      <div>
                        <strong><%# Eval("Pkg_Title") %></strong>
                        <div style="font-size:11px; color:var(--text-muted);"><%# Eval("Pkg_Badge1") %></div>
                      </div>
                    </div>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditPkgTitle" runat="server" Text='<%# Bind("Pkg_Title") %>' CssClass="admin-edit-input" placeholder="Title"></asp:TextBox>
                    <asp:TextBox ID="txtEditPkgBadge" runat="server" Text='<%# Bind("Pkg_Badge1") %>' CssClass="admin-edit-input" placeholder="Badge (e.g. Bestseller)" style="margin-top:4px; font-size:11px;"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Destination">
                  <ItemTemplate>
                    <span><i class="fa-solid fa-location-dot" style="color:#0ea5e9; margin-right:4px;"></i><%# Eval("Pkg_Location") %></span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditPkgLocation" runat="server" Text='<%# Bind("Pkg_Location") %>' CssClass="admin-edit-input"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Duration">
                  <ItemTemplate>
                    <span><i class="fa-regular fa-clock" style="color:var(--text-muted); margin-right:4px;"></i><%# Eval("Pkg_Duration") %></span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditPkgDuration" runat="server" Text='<%# Bind("Pkg_Duration") %>' CssClass="admin-edit-input"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                  <ItemTemplate>
                    <strong style="color:var(--primary);">&#8377;<%# Eval("Pkg_Price", "{0:N0}") %></strong>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditPkgPrice" runat="server" Text='<%# Bind("Pkg_Price") %>' CssClass="admin-edit-input" style="width:100px;"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rating">
                  <ItemTemplate>
                    <span style="color:#F59E0B; font-weight:700;"><i class="fa-solid fa-star"></i> <%# Eval("Pkg_Rating") %></span>
                    <span style="font-size:11px; color:var(--text-muted);">(<%# Eval("Pkg_Reviews") %>)</span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditPkgRating" runat="server" Text='<%# Bind("Pkg_Rating") %>' CssClass="admin-edit-input" style="width:60px;"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                  <ItemTemplate>
                    <span class="badge badge-success">Active</span>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                  <ItemTemplate>
                    <div style="display:flex; align-items:center; gap:6px;">
                      <asp:LinkButton ID="btnEditPkg" runat="server" CommandName="Edit" CssClass="btn-grid-edit" ToolTip="Modify Package"><i class="fa-solid fa-pen-to-square"></i> Modify</asp:LinkButton>
                      <a href='/Pages/package-details.aspx?id=<%# Eval("Pkg_Slug") %>' target="_blank" class="table-action-btn" title="View Public Page"><i class="fa-solid fa-arrow-up-right-from-square"></i></a>
                      <asp:LinkButton ID="btnDeletePkg" runat="server" CommandName="Delete" CssClass="btn-grid-delete" OnClientClick="return confirm('Are you sure you want to delete this tour package?');" ToolTip="Delete Package"><i class="fa-solid fa-trash"></i></asp:LinkButton>
                    </div>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <div style="display:flex; align-items:center; gap:6px;">
                      <asp:LinkButton ID="btnUpdatePkg" runat="server" CommandName="Update" CssClass="btn-grid-update" ToolTip="Save Changes"><i class="fa-solid fa-check"></i> Save</asp:LinkButton>
                      <asp:LinkButton ID="btnCancelPkg" runat="server" CommandName="Cancel" CssClass="btn-grid-cancel" ToolTip="Cancel"><i class="fa-solid fa-xmark"></i> Cancel</asp:LinkButton>
                    </div>
                  </EditItemTemplate>
                </asp:TemplateField>
              </Columns>
              <EmptyDataTemplate>
                <div style="padding:24px; text-align:center; color:var(--text-muted);">
                  <i class="fa-solid fa-box-open" style="font-size:28px; margin-bottom:8px; display:block;"></i>
                  No tour packages found.
                </div>
              </EmptyDataTemplate>
            </asp:GridView>
          </div>
        </div>

      </div>

      <!-- TAB 4: DESTINATIONS MANAGER (GridView ONLY - No DataList) -->
      <div id="tab-destinations" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-28 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">Destinations Manager</h1>
          </div>
          <div style="display:flex; align-items:center; gap:8px;">
            <a href="/Pages/destinations.aspx" target="_blank" class="btn btn-primary btn-sm">
              <i class="fa-solid fa-arrow-up-right-from-square"></i> Browse Public Site
            </a>
          </div>
        </div>
        <br />
        <!-- Destinations Table View (GridView ONLY) -->
        <div id="dest-table-wrap" class="admin-table-card">
          <div style="overflow-x:auto;">
            <asp:GridView ID="gvDestinations" runat="server" AutoGenerateColumns="false" CssClass="admin-table" GridLines="None" UseAccessibleHeader="true" OnPreRender="GridView_PreRender" DataKeyNames="Dest_Id" OnRowEditing="gvDestinations_RowEditing" OnRowUpdating="gvDestinations_RowUpdating" OnRowCancelingEdit="gvDestinations_RowCancelingEdit" OnRowDeleting="gvDestinations_RowDeleting">
              <Columns>
                <asp:TemplateField HeaderText="Destination">
                  <ItemTemplate>
                    <div style="display:flex; align-items:center; gap:12px;">
                      <img src='<%# Eval("Dest_Image") %>' alt='<%# Eval("Dest_Name") %>' style="width:48px; height:36px; object-fit:cover; border-radius:var(--radius-sm); border:1px solid var(--gray-200);" onerror="this.src='../Content/images/img_14.jpg';" />
                      <div>
                        <strong><%# Eval("Dest_Name") %></strong>
                        <div style="font-size:11px; color:var(--text-muted);"><%# Eval("Dest_Badge1") %></div>
                      </div>
                    </div>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditDestName" runat="server" Text='<%# Bind("Dest_Name") %>' CssClass="admin-edit-input" placeholder="Destination Name"></asp:TextBox>
                    <asp:TextBox ID="txtEditDestBadge" runat="server" Text='<%# Bind("Dest_Badge1") %>' CssClass="admin-edit-input" placeholder="Badge" style="margin-top:4px; font-size:11px;"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State / Region">
                  <ItemTemplate>
                    <span><i class="fa-solid fa-map-pin" style="color:#0ea5e9; margin-right:4px;"></i><%# Eval("Dest_Location") %></span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditDestLocation" runat="server" Text='<%# Bind("Dest_Location") %>' CssClass="admin-edit-input"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category">
                  <ItemTemplate>
                    <span><%# Eval("Dest_Region") %></span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditDestRegion" runat="server" Text='<%# Bind("Dest_Region") %>' CssClass="admin-edit-input"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Starting Price">
                  <ItemTemplate>
                    <strong style="color:var(--primary);">&#8377;<%# Eval("Dest_Price", "{0:N0}") %></strong>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditDestPrice" runat="server" Text='<%# Bind("Dest_Price") %>' CssClass="admin-edit-input" style="width:100px;"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rating">
                  <ItemTemplate>
                    <span style="color:#F59E0B; font-weight:700;"><i class="fa-solid fa-star"></i> <%# Eval("Dest_Rating") %></span>
                    <span style="font-size:11px; color:var(--text-muted);">(<%# Eval("Dest_Reviews") %>)</span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditDestRating" runat="server" Text='<%# Bind("Dest_Rating") %>' CssClass="admin-edit-input" style="width:60px;"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                  <ItemTemplate>
                    <span class="badge badge-success">Published</span>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                  <ItemTemplate>
                    <div style="display:flex; align-items:center; gap:6px;">
                      <asp:LinkButton ID="btnEditDest" runat="server" CommandName="Edit" CssClass="btn-grid-edit" ToolTip="Modify Destination"><i class="fa-solid fa-pen-to-square"></i> Modify</asp:LinkButton>
                      <a href='/Pages/destinations.aspx' target="_blank" class="table-action-btn" title="View Public Page"><i class="fa-solid fa-arrow-up-right-from-square"></i></a>
                      <asp:LinkButton ID="btnDeleteDest" runat="server" CommandName="Delete" CssClass="btn-grid-delete" OnClientClick="return confirm('Are you sure you want to delete this destination?');" ToolTip="Delete Destination"><i class="fa-solid fa-trash"></i></asp:LinkButton>
                    </div>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <div style="display:flex; align-items:center; gap:6px;">
                      <asp:LinkButton ID="btnUpdateDest" runat="server" CommandName="Update" CssClass="btn-grid-update" ToolTip="Save Changes"><i class="fa-solid fa-check"></i> Save</asp:LinkButton>
                      <asp:LinkButton ID="btnCancelDest" runat="server" CommandName="Cancel" CssClass="btn-grid-cancel" ToolTip="Cancel"><i class="fa-solid fa-xmark"></i> Cancel</asp:LinkButton>
                    </div>
                  </EditItemTemplate>
                </asp:TemplateField>
              </Columns>
              <EmptyDataTemplate>
                <div style="padding:24px; text-align:center; color:var(--text-muted);">
                  <i class="fa-solid fa-map" style="font-size:28px; margin-bottom:8px; display:block;"></i>
                  No destinations found.
                </div>
              </EmptyDataTemplate>
            </asp:GridView>
          </div>
        </div>

      </div>

      <!-- TAB 5: RESERVATIONS & ORDERS (GridView) -->
      <div id="tab-bookings" class="admin-tab-panel" style="display:none;">
        <div class="flex-between mb-28 flex-wrap gap-16">
          <div>
            <h1 style="font-size:26px; font-weight:800; color:var(--text-primary);">All Customer Bookings</h1>
          </div>
          <button type="button" class="btn btn-secondary btn-sm" onclick="window.print()">
            <i class="fa-solid fa-print"></i> Print Report
          </button>
        </div>
        <br />
        <div class="admin-table-card">
          <div style="overflow-x:auto;">
            <asp:GridView ID="gvAllBookings" runat="server" AutoGenerateColumns="false" CssClass="admin-table" GridLines="None" UseAccessibleHeader="true" OnPreRender="GridView_PreRender" DataKeyNames="Cart_Id" OnRowEditing="gvAllBookings_RowEditing" OnRowUpdating="gvAllBookings_RowUpdating" OnRowCancelingEdit="gvAllBookings_RowCancelingEdit" OnRowDeleting="gvAllBookings_RowDeleting" OnRowDataBound="gvAllBookings_RowDataBound">
              <Columns>
                <asp:TemplateField HeaderText="Order ID">
                  <ItemTemplate>
                    <strong style="color:var(--primary);"><%# Eval("Booking_Code") %></strong>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Traveler">
                  <ItemTemplate>
                    <div style="display:flex; align-items:center; gap:8px;">
                      <span style="width:28px; height:28px; border-radius:50%; background:var(--gradient-primary); color:white; display:flex; align-items:center; justify-content:center; font-size:11px; font-weight:700;">
                        <%# GetUserInitial(Eval("FullName")) %>
                      </span>
                      <div>
                        <strong><%# Eval("FullName") %></strong>
                        <div style="font-size:11px; color:var(--text-muted);"><%# Eval("Email") %></div>
                      </div>
                    </div>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tour Package">
                  <ItemTemplate>
                    <div>
                      <strong><%# Eval("Pkg_Title") %></strong>
                      <div style="font-size:11px; color:var(--text-muted);"><i class="fa-regular fa-calendar" style="margin-right:3px;"></i><%# Eval("Travel_Date") %></div>
                    </div>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Guests">
                  <ItemTemplate>
                    <span><i class="fa-solid fa-users" style="color:var(--text-muted); margin-right:4px;"></i><%# Eval("Quantity") %> Traveler(s)</span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:DropDownList ID="ddlEditBookingQty" runat="server" CssClass="admin-edit-select">
                      <asp:ListItem Value="1">1 Traveler</asp:ListItem>
                      <asp:ListItem Value="2">2 Travelers</asp:ListItem>
                      <asp:ListItem Value="3">3 Travelers</asp:ListItem>
                      <asp:ListItem Value="4">4 Travelers</asp:ListItem>
                      <asp:ListItem Value="5">5 Travelers</asp:ListItem>
                      <asp:ListItem Value="6">6 Travelers</asp:ListItem>
                    </asp:DropDownList>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Travel Date">
                  <ItemTemplate>
                    <span><i class="fa-regular fa-calendar" style="color:var(--text-muted); margin-right:4px;"></i><%# Eval("Travel_Date") %></span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:TextBox ID="txtEditTravelDate" runat="server" Text='<%# Bind("Travel_Date") %>' CssClass="admin-edit-input"></asp:TextBox>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hotel Tier">
                  <ItemTemplate>
                    <span class="badge badge-primary"><%# Eval("Hotel_Choice") != null && Eval("Hotel_Choice").ToString() != "" ? Eval("Hotel_Choice") : "Standard" %></span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:DropDownList ID="ddlEditHotelChoice" runat="server" CssClass="admin-edit-select">
                      <asp:ListItem Value="Standard 3★">Standard 3★</asp:ListItem>
                      <asp:ListItem Value="4★ Heritage Deluxe">4★ Heritage Deluxe</asp:ListItem>
                      <asp:ListItem Value="5★ Luxury Palace">5★ Luxury Palace</asp:ListItem>
                    </asp:DropDownList>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Amount">
                  <ItemTemplate>
                    <strong style="color:var(--primary);">&#8377;<%# Eval("TotalPrice", "{0:N0}") %></strong>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                  <ItemTemplate>
                    <span class="badge badge-success"><i class="fa-solid fa-check" style="margin-right:3px;"></i> <%# Eval("Status") %></span>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <asp:DropDownList ID="ddlEditBookingStatus" runat="server" CssClass="admin-edit-select">
                      <asp:ListItem Value="Confirmed">Confirmed</asp:ListItem>
                      <asp:ListItem Value="Pending">Pending</asp:ListItem>
                      <asp:ListItem Value="Completed">Completed</asp:ListItem>
                      <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                    </asp:DropDownList>
                  </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                  <ItemTemplate>
                    <div style="display:flex; align-items:center; gap:6px;">
                      <asp:LinkButton ID="btnEditBooking" runat="server" CommandName="Edit" CssClass="btn-grid-edit" ToolTip="Modify Booking"><i class="fa-solid fa-pen-to-square"></i> Modify</asp:LinkButton>
                      <asp:LinkButton ID="btnDeleteBooking" runat="server" CommandName="Delete" CssClass="btn-grid-delete" OnClientClick="return confirm('Are you sure you want to delete this reservation?');" ToolTip="Delete Booking"><i class="fa-solid fa-trash"></i></asp:LinkButton>
                    </div>
                  </ItemTemplate>
                  <EditItemTemplate>
                    <div style="display:flex; align-items:center; gap:6px;">
                      <asp:LinkButton ID="btnUpdateBooking" runat="server" CommandName="Update" CssClass="btn-grid-update" ToolTip="Save Changes"><i class="fa-solid fa-check"></i> Save</asp:LinkButton>
                      <asp:LinkButton ID="btnCancelBooking" runat="server" CommandName="Cancel" CssClass="btn-grid-cancel" ToolTip="Cancel"><i class="fa-solid fa-xmark"></i> Cancel</asp:LinkButton>
                    </div>
                  </EditItemTemplate>
                </asp:TemplateField>
              </Columns>
              <EmptyDataTemplate>
                <div style="padding:24px; text-align:center; color:var(--text-muted);">
                  <i class="fa-solid fa-receipt" style="font-size:28px; margin-bottom:8px; display:block;"></i>
                  No reservations found in database.
                </div>
              </EmptyDataTemplate>
            </asp:GridView>
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

      if (btn) {
        btn.classList.add('active');
      } else {
        document.querySelectorAll('.admin-menu-link').forEach(l => {
          if (l.getAttribute('onclick') && l.getAttribute('onclick').includes(panelId)) {
            l.classList.add('active');
          }
        });
      }

      const hf = document.getElementById('<%= hfActiveTab.ClientID %>');
      if (hf) hf.value = panelId;
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

      const y3 = document.getElementById('yAxisLvl3');
      const y2 = document.getElementById('yAxisLvl2');
      const y1 = document.getElementById('yAxisLvl1');
      const y0 = document.getElementById('yAxisLvl0');
      if (y3) y3.innerText = d.yAxis[0];
      if (y2) y2.innerText = d.yAxis[1];
      if (y1) y1.innerText = d.yAxis[2];
      if (y0) y0.innerText = d.yAxis[3];

      for (let i = 0; i < 6; i++) {
        const fill = document.getElementById('barFill' + i);
        const val = document.getElementById('barVal' + i);
        if (fill) fill.style.height = d.heights[i];
        if (val) val.innerText = d.values[i];
      }
    }

    // Initialize Active Tab on Page Load / Postback
    document.addEventListener('DOMContentLoaded', () => {
      const hf = document.getElementById('<%= hfActiveTab.ClientID %>');
      const activeTab = (hf && hf.value) ? hf.value : 'tab-overview';
      switchAdminTab(activeTab, null);

      // Quick Live Search filter for admin tables
      const searchInputs = document.querySelectorAll('input[type="text"][placeholder*="search" i], input[type="search"]');
      searchInputs.forEach(input => {
        input.addEventListener('input', (e) => {
          const q = (e.target.value || '').toLowerCase().trim();
          document.querySelectorAll('.admin-table tbody tr').forEach(row => {
            const txt = row.innerText.toLowerCase();
            row.style.display = (!q || txt.includes(q)) ? '' : 'none';
          });
        });
      });
    });
  </script>
</asp:Content>
