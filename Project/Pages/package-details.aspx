<%@ Page Title="Tour Package Details | Epic-Travellers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="package-details.aspx.cs" Inherits="Epic_Travelers.Pages.package_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Detailed itinerary and booking for verified tour packages by Epic-Travellers. Includes heritage hotels, private transport, meals, and guided sightseeing.">
  <meta name="keywords" content="India tour itinerary, tour package details, luxury package booking, Epic Travellers package">

  <style>
    .details-hero {
      position: relative;
      padding-top: var(--header-height);
    }

    .gallery-grid {
      display: grid;
      grid-template-columns: 2fr 1fr 1fr;
      grid-template-rows: 200px 200px;
      gap: 12px;
      border-radius: var(--radius-2xl);
      overflow: hidden;
    }

    .gallery-item {
      position: relative;
      overflow: hidden;
      cursor: pointer;
    }

    .gallery-item img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.5s ease;
    }

    .gallery-item:hover img {
      transform: scale(1.08);
    }

    .gallery-main {
      grid-row: span 2;
    }

    .itinerary-timeline {
      position: relative;
      padding-left: 32px;
      border-left: 2px dashed var(--primary);
    }

    .itinerary-step {
      position: relative;
      margin-bottom: 36px;
    }

    .itinerary-dot {
      position: absolute;
      left: -42px;
      top: 0;
      width: 20px;
      height: 20px;
      border-radius: 50%;
      background: var(--gradient-primary);
      border: 4px solid var(--bg-primary);
      box-shadow: 0 0 0 2px var(--primary);
    }

    .booking-sidebar-card {
      position: sticky;
      top: calc(var(--header-height) + 24px);
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 28px;
      box-shadow: var(--shadow-xl);
      border: 1px solid var(--gray-200);
    }

    .include-list, .exclude-list {
      display: flex;
      flex-direction: column;
      gap: 12px;
    }

    .include-item {
      display: flex;
      align-items: center;
      gap: 10px;
      font-size: 14px;
      color: var(--text-primary);
    }

    .include-item i { color: #22C55E; font-size: 16px; }
    .exclude-item i { color: #EF4444; font-size: 16px; }

    @media (max-width: 992px) {
      .gallery-grid {
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 180px 180px;
      }
      .gallery-main { grid-row: span 1; }
      .booking-sidebar-card { position: static; }
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" OnItemCommand="DataList1_ItemCommand">
    <ItemTemplate>
      <asp:Panel ID="pnlHero" runat="server" CssClass="details-hero">
        <asp:Panel ID="pnlContainer" runat="server" CssClass="container section">

          <!-- Breadcrumb -->
          <asp:Panel ID="pnlBreadcrumb" runat="server" CssClass="breadcrumb mb-24">
            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="/Pages/index.aspx" CssClass="breadcrumb-item" Text="Home" />
            <asp:Label ID="lblSep1" runat="server" CssClass="breadcrumb-sep" Text="/" />
            <asp:HyperLink ID="lnkPackages" runat="server" NavigateUrl="/Pages/packages.aspx" CssClass="breadcrumb-item" Text="Tour Packages" />
            <asp:Label ID="lblSep2" runat="server" CssClass="breadcrumb-sep" Text="/" />
            <asp:Label ID="lblBreadTitle" runat="server" CssClass="breadcrumb-item active" Text='<%# Eval("Pkg_Title") %>' />
          </asp:Panel>

          <!-- Title & Header Bar -->
          <asp:Panel ID="pnlTitleBar" runat="server" CssClass="flex-between flex-wrap gap-16 mb-24">
            <asp:Panel ID="pnlTitleLeft" runat="server">
              <asp:Label ID="lblBadgeTop" runat="server" CssClass='<%# "badge " + Eval("Pkg_Badge1_Class") + " mb-8" %>' Text='<%# Eval("Pkg_Badge1") %>' style="display:inline-block;" />
              <asp:Label ID="lblMainTitle" runat="server" ClientIDMode="Static" style="font-size:clamp(28px, 4vw, 42px); font-weight:800; display:block;" Text='<%# Eval("Pkg_Title") %>' />
              <asp:Panel ID="pnlLocationWrap" runat="server" style="color:var(--text-secondary); font-size:15px; margin-top:4px;">
                <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i>
                <asp:Label ID="lblLocation" runat="server" ClientIDMode="Static" Text='<%# " " + Eval("Pkg_Location") + ", India" %>' />
              </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="pnlActionsRight" runat="server" style="display:flex; gap:12px; align-items:center;">
              <asp:LinkButton ID="btnWishlist" runat="server" CssClass="btn btn-secondary btn-sm wishlist-btn" 
                              OnClientClick='<%# "toggleDetailsWishlist(this, \"" + Eval("Pkg_Title") + "\", \"" + Eval("Pkg_Price", "{0:N0}") + "\", \"" + Eval("Pkg_Image") + "\"); return false;" %>'>
                <i class="fa-regular fa-heart"></i> Save to Wishlist
              </asp:LinkButton>
              <asp:Panel ID="btnShare" runat="server" CssClass="btn btn-glass btn-sm" style="color:var(--text-primary); border-color:var(--gray-300); cursor:pointer;" onclick="navigator.share ? navigator.share({title: document.title, url: window.location.href}) : alert('URL copied!')">
                <i class="fa-solid fa-share-nodes"></i> Share
              </asp:Panel>
            </asp:Panel>
          </asp:Panel>

          <!-- Large Image Gallery Grid -->
          <asp:Panel ID="pnlGalleryGrid" runat="server" CssClass="gallery-grid mb-48 anim-fade-up">
            <asp:Panel ID="pnlGal1" runat="server" CssClass="gallery-item gallery-main">
              <asp:Image ID="imgMain1" runat="server" ClientIDMode="Static" ImageUrl='<%# Eval("Pkg_Image") %>' AlternateText='<%# Eval("Pkg_Title") %>' />
            </asp:Panel>
            <asp:Panel ID="pnlGal2" runat="server" CssClass="gallery-item">
              <asp:Image ID="imgMain2" runat="server" ImageUrl='<%# Eval("Pkg_Image2") %>' AlternateText='<%# Eval("Pkg_Title") %>' />
            </asp:Panel>
            <asp:Panel ID="pnlGal3" runat="server" CssClass="gallery-item">
              <asp:Image ID="imgMain3" runat="server" ImageUrl='<%# Eval("Pkg_Image3") %>' AlternateText='<%# Eval("Pkg_Title") %>' />
            </asp:Panel>
            <asp:Panel ID="pnlGal4" runat="server" CssClass="gallery-item">
              <asp:Image ID="imgMain4" runat="server" ImageUrl='<%# Eval("Pkg_Image4") %>' AlternateText='<%# Eval("Pkg_Title") %>' />
            </asp:Panel>
            <asp:Panel ID="pnlGal5" runat="server" CssClass="gallery-item" style="position:relative;">
              <asp:Image ID="imgMain5" runat="server" ImageUrl="../Content/images/img_20.jpg" AlternateText="Indian Heritage Resort" />
              <asp:Panel ID="pnlPhotosOverlay" runat="server" style="position:absolute; inset:0; background:rgba(0,0,0,0.5); display:flex; align-items:center; justify-content:center; color:white; font-weight:700; font-size:16px;">
                <asp:Label ID="lblPhotosCount" runat="server" Text="+12 Photos" />
              </asp:Panel>
            </asp:Panel>
          </asp:Panel>

          <!-- Content & Sidebar Layout -->
          <asp:Panel ID="pnlContentGrid" runat="server" CssClass="grid" style="grid-template-columns: 2fr 1fr; gap:40px;">

            <!-- Left Main Column -->
            <asp:Panel ID="pnlMainDetails" runat="server">

              <!-- Highlights Bar -->
              <asp:Panel ID="pnlHighlightsCard" runat="server" CssClass="card p-24 mb-32" style="background:var(--bg-secondary); border-color:var(--gray-200); padding:20px;">
                <asp:Panel ID="pnlHighRow" runat="server" CssClass="grid grid-4" style="gap:16px; text-align:center;">
                  <asp:Panel ID="pnlH1" runat="server">
                    <asp:Label ID="lblH1Title" runat="server" style="font-size:12px; color:var(--text-muted); text-transform:uppercase; display:block;" Text="Duration" />
                    <asp:Panel ID="pnlH1Content" runat="server" style="font-weight:700; font-size:16px; color:var(--text-primary); margin-top:2px;">
                      <i class="fa-regular fa-clock" style="color:var(--primary); margin-right:4px;"></i>
                      <asp:Label ID="lblDurationVal" runat="server" ClientIDMode="Static" Text='<%# Eval("Pkg_Duration") %>' />
                    </asp:Panel>
                  </asp:Panel>

                  <asp:Panel ID="pnlH2" runat="server">
                    <asp:Label ID="lblH2Title" runat="server" style="font-size:12px; color:var(--text-muted); text-transform:uppercase; display:block;" Text="Group Size" />
                    <asp:Panel ID="pnlH2Content" runat="server" style="font-weight:700; font-size:16px; color:var(--text-primary); margin-top:2px;">
                      <i class="fa-solid fa-users" style="color:var(--primary); margin-right:4px;"></i>
                      <asp:Label ID="lblGroupVal" runat="server" Text="2 - 15 People" />
                    </asp:Panel>
                  </asp:Panel>

                  <asp:Panel ID="pnlH3" runat="server">
                    <asp:Label ID="lblH3Title" runat="server" style="font-size:12px; color:var(--text-muted); text-transform:uppercase; display:block;" Text="Tour Type" />
                    <asp:Panel ID="pnlH3Content" runat="server" style="font-weight:700; font-size:16px; color:var(--text-primary); margin-top:2px;">
                      <i class="fa-solid fa-crown" style="color:var(--accent); margin-right:4px;"></i>
                      <asp:Label ID="lblTypeVal" runat="server" Text='<%# Eval("Pkg_Badge2") %>' />
                    </asp:Panel>
                  </asp:Panel>

                  <asp:Panel ID="pnlH4" runat="server">
                    <asp:Label ID="lblH4Title" runat="server" style="font-size:12px; color:var(--text-muted); text-transform:uppercase; display:block;" Text="Languages" />
                    <asp:Panel ID="pnlH4Content" runat="server" style="font-weight:700; font-size:16px; color:var(--text-primary); margin-top:2px;">
                      <i class="fa-solid fa-language" style="color:var(--primary); margin-right:4px;"></i>
                      <asp:Label ID="lblLangVal" runat="server" Text="English, Hindi" />
                    </asp:Panel>
                  </asp:Panel>
                </asp:Panel>
              </asp:Panel>

              <!-- Description / Overview -->
              <asp:Panel ID="pnlOverviewSection" runat="server" CssClass="mb-48">
                <asp:Label ID="lblOverviewHead" runat="server" style="font-size:22px; font-weight:700; margin-bottom:16px; display:block;" Text="Overview" />
                <asp:Label ID="lblOverview1" runat="server" style="color:var(--text-secondary); line-height:1.8; font-size:15px; margin-bottom:16px; display:block;" Text='<%# Eval("Pkg_Description") %>' />
                <asp:Label ID="lblOverview2" runat="server" style="color:var(--text-secondary); line-height:1.8; font-size:15px; display:block;" 
                           Text="Stay in certified luxury heritage stays, indulge in authentic regional dining with live traditional performances, and travel in air-conditioned private luxury coaches accompanied by expert local historians." />
              </asp:Panel>

              <!-- Tour Itinerary -->
              <asp:Panel ID="pnlItinerarySection" runat="server" CssClass="mb-48">
                <asp:Label ID="lblItineraryHead" runat="server" style="font-size:22px; font-weight:700; margin-bottom:24px; display:block;" Text="Tour Itinerary" />
                <asp:Panel ID="pnlTimeline" runat="server" CssClass="itinerary-timeline">

                  <asp:Panel ID="pnlStep1" runat="server" CssClass="itinerary-step">
                    <asp:Panel ID="pnlDot1" runat="server" CssClass="itinerary-dot" />
                    <asp:Label ID="lblStep1Day" runat="server" style="font-size:12px; font-weight:700; color:var(--primary); text-transform:uppercase; letter-spacing:1px; display:block;" Text="Day 1" />
                    <asp:Label ID="lblStep1Title" runat="server" style="font-size:18px; font-weight:700; margin:4px 0 8px; display:block;" Text='<%# "Arrival & Welcome to " + Eval("Pkg_Location") %>' />
                    <asp:Label ID="lblStep1Desc" runat="server" style="color:var(--text-secondary); font-size:14px; line-height:1.7; display:block;" 
                               Text="Arrive at the destination airport or station with private chauffeur pickup. Check-in to your luxury heritage resort. Enjoy an evening welcome orientation and signature welcome dinner." />
                  </asp:Panel>

                  <asp:Panel ID="pnlStep2" runat="server" CssClass="itinerary-step">
                    <asp:Panel ID="pnlDot2" runat="server" CssClass="itinerary-dot" />
                    <asp:Label ID="lblStep2Day" runat="server" style="font-size:12px; font-weight:700; color:var(--primary); text-transform:uppercase; letter-spacing:1px; display:block;" Text="Day 2 &amp; 3" />
                    <asp:Label ID="lblStep2Title" runat="server" style="font-size:18px; font-weight:700; margin:4px 0 8px; display:block;" Text='<%# "Guided Exploration & " + Eval("Pkg_Inclusion1_Text") %>' />
                    <asp:Label ID="lblStep2Desc" runat="server" style="color:var(--text-secondary); font-size:14px; line-height:1.7; display:block;" 
                               Text="Immersive guided sightseeing tour of iconic architectural monuments, historic landmarks, and panoramic viewpoints accompanied by certified expert historians." />
                  </asp:Panel>

                  <asp:Panel ID="pnlStep3" runat="server" CssClass="itinerary-step">
                    <asp:Panel ID="pnlDot3" runat="server" CssClass="itinerary-dot" />
                    <asp:Label ID="lblStep3Day" runat="server" style="font-size:12px; font-weight:700; color:var(--primary); text-transform:uppercase; letter-spacing:1px; display:block;" Text="Day 4" />
                    <asp:Label ID="lblStep3Title" runat="server" style="font-size:18px; font-weight:700; margin:4px 0 8px; display:block;" Text='<%# "Signature Excursion & " + Eval("Pkg_Inclusion2_Text") %>' />
                    <asp:Label ID="lblStep3Desc" runat="server" style="color:var(--text-secondary); font-size:14px; line-height:1.7; display:block;" 
                               Text="Scenic road excursion through timeless landscapes. Experience authentic regional cuisines, local artisan markets, and curated evening cultural celebrations." />
                  </asp:Panel>

                  <asp:Panel ID="pnlStep4" runat="server" CssClass="itinerary-step">
                    <asp:Panel ID="pnlDot4" runat="server" CssClass="itinerary-dot" />
                    <asp:Label ID="lblStep4Day" runat="server" style="font-size:12px; font-weight:700; color:var(--primary); text-transform:uppercase; letter-spacing:1px; display:block;" Text="Day 5 &amp; 6" />
                    <asp:Label ID="lblStep4Title" runat="server" style="font-size:18px; font-weight:700; margin:4px 0 8px; display:block;" Text='<%# "Scenic Highlights & " + Eval("Pkg_Inclusion4_Text") %>' />
                    <asp:Label ID="lblStep4Desc" runat="server" style="color:var(--text-secondary); font-size:14px; line-height:1.7; display:block;" Text='<%# Eval("Pkg_Description") %>' />
                  </asp:Panel>

                  <asp:Panel ID="pnlStep5" runat="server" CssClass="itinerary-step">
                    <asp:Panel ID="pnlDot5" runat="server" CssClass="itinerary-dot" />
                    <asp:Label ID="lblStep5Day" runat="server" style="font-size:12px; font-weight:700; color:var(--primary); text-transform:uppercase; letter-spacing:1px; display:block;" Text='<%# "Final Day (" + Eval("Pkg_Duration") + ")" %>' />
                    <asp:Label ID="lblStep5Title" runat="server" style="font-size:18px; font-weight:700; margin:4px 0 8px; display:block;" Text="Leisure Morning, Memories &amp; Departure" />
                    <asp:Label ID="lblStep5Desc" runat="server" style="color:var(--text-secondary); font-size:14px; line-height:1.7; display:block;" 
                               Text="Enjoy a leisurely breakfast at your luxury stay, capture final photographs, and transfer comfortably to the airport or station for your onward return journey." />
                  </asp:Panel>

                </asp:Panel>
              </asp:Panel>

              <!-- Services Included & Excluded -->
              <asp:Panel ID="pnlServicesSection" runat="server" CssClass="mb-48">
                <asp:Label ID="lblServicesHead" runat="server" style="font-size:22px; font-weight:700; margin-bottom:24px; display:block;" Text="Services Included &amp; Excluded" />
                <asp:Panel ID="pnlServicesGrid" runat="server" CssClass="grid grid-2" style="gap:24px;">

                  <!-- Included Services -->
                  <asp:Panel ID="pnlIncludedCard" runat="server" CssClass="card p-24" style="background:rgba(34,197,94,0.04); border-color:rgba(34,197,94,0.2); padding:20px;">
                    <asp:Panel ID="pnlIncHead" runat="server" style="font-size:16px; font-weight:700; color:#22C55E; margin-bottom:16px;">
                      <i class="fa-solid fa-circle-check"></i> Included Services
                    </asp:Panel>
                    <asp:Panel ID="pnlIncList" runat="server" CssClass="include-list">
                      <asp:Panel ID="pnlI1" runat="server" CssClass="include-item">
                        <i class='<%# "fa-solid " + Eval("Pkg_Inclusion1_Icon") %>'></i>
                        <asp:Label ID="lblI1" runat="server" Text='<%# " " + Eval("Pkg_Inclusion1_Text") %>' />
                      </asp:Panel>
                      <asp:Panel ID="pnlI2" runat="server" CssClass="include-item">
                        <i class='<%# "fa-solid " + Eval("Pkg_Inclusion2_Icon") %>'></i>
                        <asp:Label ID="lblI2" runat="server" Text='<%# " " + Eval("Pkg_Inclusion2_Text") %>' />
                      </asp:Panel>
                      <asp:Panel ID="pnlI3" runat="server" CssClass="include-item">
                        <i class='<%# "fa-solid " + Eval("Pkg_Inclusion3_Icon") %>'></i>
                        <asp:Label ID="lblI3" runat="server" Text='<%# " " + Eval("Pkg_Inclusion3_Text") %>' />
                      </asp:Panel>
                      <asp:Panel ID="pnlI4" runat="server" CssClass="include-item">
                        <i class='<%# "fa-solid " + Eval("Pkg_Inclusion4_Icon") %>'></i>
                        <asp:Label ID="lblI4" runat="server" Text='<%# " " + Eval("Pkg_Inclusion4_Text") %>' />
                      </asp:Panel>
                      <asp:Panel ID="pnlI5" runat="server" CssClass="include-item">
                        <i class="fa-solid fa-check"></i>
                        <asp:Label ID="lblI5" runat="server" Text=" Daily Gourmet Breakfast &amp; Dinners" />
                      </asp:Panel>
                      <asp:Panel ID="pnlI6" runat="server" CssClass="include-item">
                        <i class="fa-solid fa-check"></i>
                        <asp:Label ID="lblI6" runat="server" Text=" English &amp; Hindi speaking Local Tour Historians" />
                      </asp:Panel>
                      <asp:Panel ID="pnlI7" runat="server" CssClass="include-item">
                        <i class="fa-solid fa-check"></i>
                        <asp:Label ID="lblI7" runat="server" Text=" All Tolls, Fuel, Permits &amp; Driver Allowances" />
                      </asp:Panel>
                    </asp:Panel>
                  </asp:Panel>

                  <!-- Excluded Services -->
                  <asp:Panel ID="pnlExcludedCard" runat="server" CssClass="card p-24" style="background:rgba(239,68,68,0.04); border-color:rgba(239,68,68,0.2); padding:20px;">
                    <asp:Panel ID="pnlExcHead" runat="server" style="font-size:16px; font-weight:700; color:#EF4444; margin-bottom:16px;">
                      <i class="fa-solid fa-circle-xmark"></i> Excluded Services
                    </asp:Panel>
                    <asp:Panel ID="pnlExcList" runat="server" CssClass="exclude-list">
                      <asp:Panel ID="pnlE1" runat="server" CssClass="include-item">
                        <i class="fa-solid fa-xmark"></i>
                        <asp:Label ID="lblE1" runat="server" Text=" Airfare / Train tickets to/from destination" />
                      </asp:Panel>
                      <asp:Panel ID="pnlE2" runat="server" CssClass="include-item">
                        <i class="fa-solid fa-xmark"></i>
                        <asp:Label ID="lblE2" runat="server" Text=" Personal expenses, laundry &amp; shopping" />
                      </asp:Panel>
                      <asp:Panel ID="pnlE3" runat="server" CssClass="include-item">
                        <i class="fa-solid fa-xmark"></i>
                        <asp:Label ID="lblE3" runat="server" Text=" Camera / Video permits at monuments" />
                      </asp:Panel>
                      <asp:Panel ID="pnlE4" runat="server" CssClass="include-item">
                        <i class="fa-solid fa-xmark"></i>
                        <asp:Label ID="lblE4" runat="server" Text=" Travel insurance (available add-on at checkout)" />
                      </asp:Panel>
                      <asp:Panel ID="pnlE5" runat="server" CssClass="include-item">
                        <i class="fa-solid fa-xmark"></i>
                        <asp:Label ID="lblE5" runat="server" Text=" Discretionary tips for drivers and guides" />
                      </asp:Panel>
                    </asp:Panel>
                  </asp:Panel>

                </asp:Panel>
              </asp:Panel>

              <!-- Accommodation & Stays Info -->
              <asp:Panel ID="pnlAccommodationSection" runat="server" CssClass="mb-48">
                <asp:Label ID="lblAccomHead" runat="server" style="font-size:22px; font-weight:700; margin-bottom:20px; display:block;" Text="Accommodation &amp; Stays" />
                <asp:Panel ID="pnlAccomGrid" runat="server" CssClass="grid grid-3" style="gap:16px;">
                  <asp:Panel ID="pnlAccom1" runat="server" CssClass="card p-16" style="padding:16px;">
                    <asp:Image ID="imgAccom1" runat="server" ImageUrl="../Content/images/img_36.jpg" style="border-radius:var(--radius-md); height:140px; width:100%; object-fit:cover; margin-bottom:12px;" AlternateText="Heritage Palace Hotel" />
                    <asp:Label ID="lblA1Title" runat="server" style="font-size:15px; font-weight:700; display:block;" Text="Royal Heritage Haveli" />
                    <asp:Label ID="lblA1Sub" runat="server" style="font-size:12px; color:var(--text-muted); display:block;" Text='<%# Eval("Pkg_Location") + " • 4★ / 5★ Heritage" %>' />
                  </asp:Panel>
                  <asp:Panel ID="pnlAccom2" runat="server" CssClass="card p-16" style="padding:16px;">
                    <asp:Image ID="imgAccom2" runat="server" ImageUrl="../Content/images/img_47.jpg" style="border-radius:var(--radius-md); height:140px; width:100%; object-fit:cover; margin-bottom:12px;" AlternateText="Luxury Resort Stay" />
                    <asp:Label ID="lblA2Title" runat="server" style="font-size:15px; font-weight:700; display:block;" Text="Signature Boutique Resort" />
                    <asp:Label ID="lblA2Sub" runat="server" style="font-size:12px; color:var(--text-muted); display:block;" Text='<%# Eval("Pkg_Badge2") + " • Premium Category" %>' />
                  </asp:Panel>
                  <asp:Panel ID="pnlAccom3" runat="server" CssClass="card p-16" style="padding:16px;">
                    <asp:Image ID="imgAccom3" runat="server" ImageUrl="../Content/images/img_20.jpg" style="border-radius:var(--radius-md); height:140px; width:100%; object-fit:cover; margin-bottom:12px;" AlternateText="Scenic Villa Stay" />
                    <asp:Label ID="lblA3Title" runat="server" style="font-size:15px; font-weight:700; display:block;" Text="Grand Lake / Mountain Retreat" />
                    <asp:Label ID="lblA3Sub" runat="server" style="font-size:12px; color:var(--text-muted); display:block;" Text="Panoramic View Luxury" />
                  </asp:Panel>
                </asp:Panel>
              </asp:Panel>

              <!-- FAQ Accordion -->
              <asp:Panel ID="pnlFaqSection" runat="server" CssClass="mb-48">
                <asp:Label ID="lblFaqHead" runat="server" style="font-size:22px; font-weight:700; margin-bottom:20px; display:block;" Text="Frequently Asked Questions" />

                <asp:Panel ID="pnlFaq1" runat="server" CssClass="accordion-item">
                  <asp:Panel ID="pnlFaqH1" runat="server" CssClass="accordion-header">
                    <span>What is the best month to do this tour?</span>
                    <i class="fa-solid fa-plus accordion-icon"></i>
                  </asp:Panel>
                  <asp:Panel ID="pnlFaqB1" runat="server" CssClass="accordion-body">
                    <asp:Panel ID="pnlFaqBi1" runat="server" CssClass="accordion-body-inner">
                      The ideal travel season is round the year with peak pleasant weather between September to April. Summer departures include hill stations and luxury air-conditioned transport.
                    </asp:Panel>
                  </asp:Panel>
                </asp:Panel>

                <asp:Panel ID="pnlFaq2" runat="server" CssClass="accordion-item">
                  <asp:Panel ID="pnlFaqH2" runat="server" CssClass="accordion-header">
                    <span>Can this package be customized for private groups or families?</span>
                    <i class="fa-solid fa-plus accordion-icon"></i>
                  </asp:Panel>
                  <asp:Panel ID="pnlFaqB2" runat="server" CssClass="accordion-body">
                    <asp:Panel ID="pnlFaqBi2" runat="server" CssClass="accordion-body-inner">
                      Yes! All our tour packages can be 100% customized to your preferred travel dates, hotel categories, vehicle type, and duration.
                    </asp:Panel>
                  </asp:Panel>
                </asp:Panel>

                <asp:Panel ID="pnlFaq3" runat="server" CssClass="accordion-item">
                  <asp:Panel ID="pnlFaqH3" runat="server" CssClass="accordion-header">
                    <span>What is the cancellation and refund policy?</span>
                    <i class="fa-solid fa-plus accordion-icon"></i>
                  </asp:Panel>
                  <asp:Panel ID="pnlFaqB3" runat="server" CssClass="accordion-body">
                    <asp:Panel ID="pnlFaqBi3" runat="server" CssClass="accordion-body-inner">
                      You receive a 100% full refund if cancelled 48 hours prior to trip start date. We offer hassle-free instant refunds to your original payment method.
                    </asp:Panel>
                  </asp:Panel>
                </asp:Panel>

              </asp:Panel>

            </asp:Panel>

            <!-- Right Sticky Booking Form Sidebar -->
            <asp:Panel ID="pnlSidebarCol" runat="server">
              <asp:Panel ID="pnlSidebarCard" runat="server" CssClass="booking-sidebar-card">

                <asp:Panel ID="pnlSideHead" runat="server" CssClass="flex-between mb-16">
                  <asp:Panel ID="pnlPriceWrap" runat="server">
                    <asp:Label ID="lblSideStart" runat="server" style="font-size:12px; color:var(--text-muted); display:block;" Text="Price starting from" />
                    <asp:Label ID="lblSidePrice" runat="server" ClientIDMode="Static" style="font-size:28px; font-weight:800; color:var(--primary); display:block;" Text='<%# "₹" + Eval("Pkg_Price", "{0:N0}") %>' />
                    <asp:Label ID="lblSidePerPerson" runat="server" style="font-size:12px; color:var(--text-muted); display:block;" Text="per person (incl. taxes)" />
                  </asp:Panel>
                  <asp:Panel ID="pnlSideStars" runat="server" CssClass="stars" style="text-align:right;">
                    <asp:Label ID="lblStars" runat="server" Text="★★★★★" style="color:#F59E0B; display:block;" />
                    <asp:Label ID="lblSideReviews" runat="server" style="font-size:12px; color:var(--text-muted); font-family:sans-serif; display:block;" Text='<%# Eval("Pkg_Rating") + " (" + Eval("Pkg_Reviews") + " reviews)" %>' />
                  </asp:Panel>
                </asp:Panel>

                <hr style="border:none; border-top:1px solid var(--gray-200); margin:20px 0;">

                <asp:Panel ID="pnlBookingForm" runat="server" CssClass="booking-form">
                  <asp:Panel ID="pnlFldDate" runat="server" CssClass="form-group">
                    <label class="form-label" for="bookDate">Travel Date</label>
                    <asp:TextBox ID="bookDate" runat="server" ClientIDMode="Static" TextMode="Date" CssClass="form-control" />
                  </asp:Panel>

                  <asp:Panel ID="pnlFldGuests" runat="server" CssClass="grid grid-2" style="gap:12px;">
                    <asp:Panel ID="pnlFldAdults" runat="server" CssClass="form-group">
                      <label class="form-label" for="bookAdults">Adults (12+ yrs)</label>
                      <asp:DropDownList ID="bookAdults" runat="server" ClientIDMode="Static" CssClass="form-control filter-select" onchange="updateSidebarPricing()">
                        <asp:ListItem Value="1" Text="1 Adult"></asp:ListItem>
                        <asp:ListItem Value="2" Text="2 Adults" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="3" Text="3 Adults"></asp:ListItem>
                        <asp:ListItem Value="4" Text="4 Adults"></asp:ListItem>
                      </asp:DropDownList>
                    </asp:Panel>

                    <asp:Panel ID="pnlFldChildren" runat="server" CssClass="form-group">
                      <label class="form-label" for="bookChildren">Children</label>
                      <asp:DropDownList ID="bookChildren" runat="server" ClientIDMode="Static" CssClass="form-control filter-select">
                        <asp:ListItem Value="0" Text="0 Children" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="1" Text="1 Child"></asp:ListItem>
                        <asp:ListItem Value="2" Text="2 Children"></asp:ListItem>
                      </asp:DropDownList>
                    </asp:Panel>
                  </asp:Panel>

                  <asp:Panel ID="pnlFldHotel" runat="server" CssClass="form-group">
                    <label class="form-label" for="bookHotel">Hotel Choice</label>
                    <asp:DropDownList ID="bookHotel" runat="server" ClientIDMode="Static" CssClass="form-control filter-select" onchange="updateSidebarPricing()">
                      <asp:ListItem Value="heritage" Text="4★ Heritage / Deluxe (Included)" Selected="True"></asp:ListItem>
                      <asp:ListItem Value="5star" Text="5★ Palace / Luxury (+₹10,000)"></asp:ListItem>
                    </asp:DropDownList>
                  </asp:Panel>

                  <asp:Panel ID="pnlFldName" runat="server" CssClass="form-group">
                    <label class="form-label" for="bookName">Full Name</label>
                    <asp:TextBox ID="bookName" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="e.g. Vikram Sharma" />
                  </asp:Panel>

                  <asp:Panel ID="pnlFldEmail" runat="server" CssClass="form-group">
                    <label class="form-label" for="bookEmail">Email Address</label>
                    <asp:TextBox ID="bookEmail" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="name@domain.com" />
                  </asp:Panel>

                  <asp:Panel ID="pnlFldPhone" runat="server" CssClass="form-group">
                    <label class="form-label" for="bookPhone">Phone / WhatsApp</label>
                    <asp:TextBox ID="bookPhone" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="+91 90991 07637" />
                  </asp:Panel>

                  <!-- Pricing Breakdown Box -->
                  <asp:Panel ID="pnlPriceBreakdown" runat="server" style="background:var(--gray-100); border-radius:var(--radius-md); padding:12px; margin-bottom:20px; font-size:13px;">
                    <asp:Panel ID="pnlSubRow" runat="server" CssClass="flex-between mb-4">
                      <span>Subtotal (<span id="lblAdultsCount">2</span> Adults):</span>
                      <strong id="lblSideSubtotal"><%# "₹" + ((int)Eval("Pkg_Price") * 2).ToString("N0") %></strong>
                    </asp:Panel>
                    <asp:Panel ID="pnlDiscRow" runat="server" CssClass="flex-between mb-4">
                      <span>Discount (EPIC10):</span>
                      <strong id="lblSideDiscount" style="color:#22C55E;"><%# "-₹" + ((int)Math.Round((int)Eval("Pkg_Price") * 2 * 0.10)).ToString("N0") %></strong>
                    </asp:Panel>
                    <asp:Panel ID="pnlTotalRow" runat="server" CssClass="flex-between" style="font-weight:700; font-size:14px; border-top:1px solid var(--gray-200); padding-top:6px; margin-top:6px;">
                      <span>Total Payable:</span>
                      <span id="lblSideTotal" style="color:var(--primary);"><%# "₹" + ((int)Math.Round((int)Eval("Pkg_Price") * 2 * 0.90)).ToString("N0") %></span>
                    </asp:Panel>
                  </asp:Panel>

                  <asp:LinkButton ID="btnBookTour" runat="server" ClientIDMode="Static" CssClass="btn btn-accent btn-lg" style="width:100%; text-align:center; display:block;" 
                                  CommandName="cmd_book" CommandArgument='<%# Eval("Pkg_Id") %>'>
                    <i class="fa-solid fa-bolt"></i> Book Now (Instant Confirmation)
                  </asp:LinkButton>
                </asp:Panel>

                <asp:Panel ID="pnlSideFooter" runat="server" style="margin-top:16px; text-align:center; font-size:12px; color:var(--text-muted);">
                  🔒 256-Bit SSL Encrypted &amp; Secure Checkout
                </asp:Panel>
              </asp:Panel>
            </asp:Panel>

          </asp:Panel>

        </asp:Panel>
      </asp:Panel>
    </ItemTemplate>
  </asp:DataList>

  <script>
    // Live Sidebar Price Recalculation
    function updateSidebarPricing() {
      const adults = parseInt(document.getElementById('bookAdults')?.value || '2');
      const hotel = document.getElementById('bookHotel')?.value || 'heritage';
      const basePriceEl = document.getElementById('lblSidePrice');
      if (!basePriceEl) return;
      const basePrice = parseInt(basePriceEl.innerText.replace(/[^0-9]/g, '')) || 45000;
      const hotelExtra = hotel === '5star' ? 10000 : 0;
      const subtotal = (basePrice * adults) + hotelExtra;
      const discount = Math.round(subtotal * 0.10);
      const total = subtotal - discount;

      const adultsLbl = document.getElementById('lblAdultsCount');
      if (adultsLbl) adultsLbl.innerText = adults;

      const subLbl = document.getElementById('lblSideSubtotal');
      if (subLbl) subLbl.innerText = '₹' + subtotal.toLocaleString('en-IN');

      const discLbl = document.getElementById('lblSideDiscount');
      if (discLbl) discLbl.innerText = '-₹' + discount.toLocaleString('en-IN');

      const totLbl = document.getElementById('lblSideTotal');
      if (totLbl) totLbl.innerText = '₹' + total.toLocaleString('en-IN');
    }

    // Book Tour Flow
    function bookTourNow() {
      const user = window.EPIC_USER || {};
      const email = (user.email || 'guest').toLowerCase();

      const pkgTitle = document.getElementById('lblMainTitle')?.innerText.trim() || 'Tour Package';
      const pkgImage = document.getElementById('imgMain1')?.src || '../Content/images/img_48.jpg';
      const bookingId = '#EPIC-' + Math.floor(10000 + Math.random() * 90000);
      const invoiceNo = 'INV-EPIC-2025-' + Math.floor(1000 + Math.random() * 9000);
      const todayStr = new Date().toLocaleDateString('en-IN', { day: '2-digit', month: 'short', year: 'numeric' });
      const enteredName = document.getElementById('bookName')?.value?.trim() || user.name || 'Valued Traveler';
      const enteredEmail = document.getElementById('bookEmail')?.value?.trim() || user.email || 'traveler@epictravellers.com';
      const enteredPhone = document.getElementById('bookPhone')?.value?.trim() || '+91 90991 07637';

      const adultsCount = parseInt(document.getElementById('bookAdults')?.value || '2');
      const hotelChoice = document.getElementById('bookHotel')?.value || 'heritage';
      const basePriceText = document.getElementById('lblSidePrice')?.innerText.replace(/[^0-9]/g, '') || '45000';
      const basePrice = parseInt(basePriceText);
      const hotelExtra = hotelChoice === '5star' ? 10000 : 0;
      const subtotal = (basePrice * adultsCount) + hotelExtra;
      const discount = Math.round(subtotal * 0.10);
      const totalPayable = subtotal - discount;

      const durationText = document.getElementById('lblDurationVal')?.innerText.trim() || '8 Days / 7 Nights';
      const locationText = document.getElementById('lblLocation')?.innerText.trim() || 'India';

      const newBooking = {
        id: bookingId,
        invoiceNo: invoiceNo,
        title: pkgTitle,
        image: pkgImage,
        bookingDate: todayStr,
        travelDates: document.getElementById('bookDate')?.value || 'Upcoming • 2025',
        duration: durationText,
        guests: `${adultsCount} Adults`,
        travelerName: enteredName,
        travelerEmail: enteredEmail,
        travelerPhone: enteredPhone,
        inclusions: 'Heritage Stays, Private AC SUV, Daily Meals, Guided Sightseeing',
        price: '₹' + totalPayable.toLocaleString('en-IN'),
        subtotal: '₹' + subtotal.toLocaleString('en-IN'),
        gst: '₹' + Math.round(totalPayable * 0.05).toLocaleString('en-IN') + ' (5% GST)',
        paymentMode: 'UPI / NetBanking (Online Verified)',
        txnId: 'TXN_EPIC_' + Math.floor(100000 + Math.random() * 900000),
        status: 'Confirmed'
      };

      try {
        const key = 'epic_bookings_' + email;
        let existing = JSON.parse(localStorage.getItem(key) || '[]');
        existing.unshift(newBooking);
        localStorage.setItem(key, JSON.stringify(existing));
      } catch(e) {}

      Toast.show('🎉 Tour Booked Successfully! Opening your dashboard...', 'success');
      setTimeout(() => {
        window.location.href = '/Pages/dashboard.aspx';
      }, 1000);
    }

    // Wishlist Persistence in localStorage
    function toggleDetailsWishlist(btn, title, price, image) {
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
        btn.innerHTML = '<i class="fa-regular fa-heart"></i> Save to Wishlist';
        Toast.show(`Removed "${title}" from your wishlist`, 'info');
      } else {
        wishlist.push({ title, price: '₹' + price, image, href: window.location.href });
        btn.classList.add('active');
        btn.innerHTML = '<i class="fa-solid fa-heart" style="color:#ef4444;"></i> Saved to Wishlist';
        Toast.show(`❤️ Saved "${title}" to your wishlist!`, 'success');
      }

      localStorage.setItem(key, JSON.stringify(wishlist));
    }

    // Initialize user contact info and wishlist status on load
    document.addEventListener('DOMContentLoaded', () => {
      const user = window.EPIC_USER || {};
      if (user.name) {
        const nameInput = document.getElementById('bookName');
        if (nameInput) nameInput.value = user.name;
      }
      if (user.email) {
        const emailInput = document.getElementById('bookEmail');
        if (emailInput) emailInput.value = user.email;
      }
      if (user.phone) {
        const phoneInput = document.getElementById('bookPhone');
        if (phoneInput) phoneInput.value = user.phone;
      }

      // Check wishlist status
      const email = (user.email || 'guest').toLowerCase();
      const key = 'epic_wishlist_' + email;
      try {
        const wishlist = JSON.parse(localStorage.getItem(key) || '[]');
        const pkgTitle = document.getElementById('lblMainTitle')?.innerText.trim();
        const btn = document.querySelector('.wishlist-btn');
        if (pkgTitle && btn && wishlist.some(w => w.title === pkgTitle)) {
          btn.classList.add('active');
          btn.innerHTML = '<i class="fa-solid fa-heart" style="color:#ef4444;"></i> Saved to Wishlist';
        }
      } catch(e) {}
    });
  </script>
</asp:Content>
