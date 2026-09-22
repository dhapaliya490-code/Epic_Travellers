<%@ Page Title="Visual Gallery – Epic-Travellers | High-Definition India Journey" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="Epic_Travelers.Pages.gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Explore high-definition photo and video gallery of Incredible India with Epic-Travellers. View stunning photography from Rajasthan, Kerala, Goa, Ladakh, and more.">
  <meta name="keywords" content="India travel photos, Rajasthan photography, Kerala backwater images, Ladakh photos, Goa beach pictures, Taj Mahal gallery">

  <style>
    /* ==========================================================================
       GALLERY HERO SECTION
       ========================================================================== */
    .gallery-hero {
      position: relative;
      background: linear-gradient(135deg, rgba(15, 23, 42, 0.88) 0%, rgba(20, 184, 166, 0.75) 100%),
                  url('../Content/images/img_31.jpg') center/cover no-repeat;
      padding: 155px 0 95px;
      color: white;
      text-align: center;
      overflow: hidden;
    }

    .gallery-hero::before {
      content: '';
      position: absolute;
      inset: 0;
      background: radial-gradient(circle at 50% 35%, rgba(20, 184, 166, 0.28), transparent 70%);
      pointer-events: none;
    }

    .gallery-badge {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 6px 18px;
      border-radius: 999px;
      background: rgba(255, 255, 255, 0.12);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border: 1px solid rgba(255, 255, 255, 0.25);
      color: #5EEAD4;
      font-size: 12px;
      font-weight: 800;
      letter-spacing: 1.5px;
      text-transform: uppercase;
      margin-bottom: 16px;
    }

    /* ==========================================================================
       FILTER PILLS
       ========================================================================== */
    .gallery-filter-pill {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 10px 22px;
      border-radius: var(--radius-full);
      background: var(--bg-primary);
      color: var(--text-secondary);
      font-weight: 700;
      font-size: 13.5px;
      cursor: pointer;
      border: 1px solid var(--gray-300);
      transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
      box-shadow: var(--shadow-sm);
    }

    .gallery-filter-pill:hover, .gallery-filter-pill.active {
      background: var(--gradient-primary);
      color: white;
      border-color: transparent;
      box-shadow: 0 6px 18px rgba(14, 165, 233, 0.35);
      transform: translateY(-2px);
    }

    /* ==========================================================================
       MASONRY GRID
       ========================================================================== */
    .gallery-masonry {
      column-count: 3;
      column-gap: 24px;
    }

    .gallery-masonry-item {
      break-inside: avoid;
      margin-bottom: 24px;
      position: relative;
      border-radius: var(--radius-2xl);
      overflow: hidden;
      cursor: pointer;
      box-shadow: 0 10px 25px -5px rgba(0,0,0,0.1);
      border: 1px solid var(--gray-200);
      background: var(--bg-primary);
      transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.4s ease, border-color 0.2s;
    }

    .gallery-masonry-item:hover {
      transform: translateY(-6px);
      box-shadow: 0 20px 40px -10px rgba(0,0,0,0.22);
      border-color: var(--primary);
    }

    .gallery-masonry-item img {
      width: 100%;
      height: auto;
      display: block;
      transition: transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .gallery-masonry-item:hover img {
      transform: scale(1.07);
    }

    .gallery-item-overlay {
      position: absolute;
      inset: 0;
      background: linear-gradient(180deg, rgba(15,23,42,0.1) 0%, rgba(15,23,42,0.85) 100%);
      opacity: 0;
      transition: opacity 0.35s ease;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      padding: 22px;
      color: white;
    }

    .gallery-masonry-item:hover .gallery-item-overlay {
      opacity: 1;
    }

    .overlay-top-badge {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .overlay-zoom-icon {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.25);
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      border: 1px solid rgba(255, 255, 255, 0.4);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 14px;
      color: white;
      transition: transform 0.2s;
    }

    .gallery-masonry-item:hover .overlay-zoom-icon {
      transform: scale(1.1);
    }

    /* ==========================================================================
       WORLD-CLASS LIGHTBOX MODAL
       ========================================================================== */
    .lightbox-modal {
      position: fixed;
      inset: 0;
      background: rgba(10, 15, 29, 0.94);
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      z-index: 99999;
      display: none;
      align-items: center;
      justify-content: center;
      padding: 24px;
      opacity: 0;
      transition: opacity 0.3s ease;
    }

    .lightbox-modal.open {
      display: flex;
      opacity: 1;
    }

    .lightbox-wrapper {
      position: relative;
      max-width: 92vw;
      max-height: 90vh;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    /* Top Control Bar */
    .lightbox-topbar {
      position: absolute;
      top: -55px;
      left: 0;
      right: 0;
      display: flex;
      justify-content: space-between;
      align-items: center;
      color: white;
      z-index: 10;
    }

    .lightbox-counter {
      font-size: 13px;
      font-weight: 800;
      color: var(--accent-light, #FBBF24);
      background: rgba(255, 255, 255, 0.12);
      padding: 6px 16px;
      border-radius: 999px;
      border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .lightbox-actions {
      display: flex;
      gap: 10px;
      align-items: center;
    }

    .lightbox-action-btn {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.12);
      border: 1px solid rgba(255, 255, 255, 0.25);
      color: white;
      font-size: 15px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.2s ease;
    }

    .lightbox-action-btn:hover {
      background: rgba(255, 255, 255, 0.25);
      transform: scale(1.1);
    }

    .lightbox-close-btn {
      background: #EF4444;
      border-color: #EF4444;
    }

    .lightbox-close-btn:hover {
      background: #DC2626;
    }

    /* Image Box */
    .lightbox-image-box {
      max-width: 88vw;
      max-height: 70vh;
      border-radius: var(--radius-2xl);
      overflow: hidden;
      box-shadow: 0 35px 80px rgba(0,0,0,0.6);
      border: 1px solid rgba(255, 255, 255, 0.15);
      background: #000;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: transform 0.3s ease;
    }

    .lightbox-image-box img {
      max-width: 100%;
      max-height: 70vh;
      object-fit: contain;
      display: block;
      border-radius: var(--radius-2xl);
    }

    /* Navigation Arrows */
    .lightbox-nav-btn {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      width: 52px;
      height: 52px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.3);
      color: white;
      font-size: 20px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.25s ease;
      z-index: 20;
    }

    .lightbox-nav-btn:hover {
      background: var(--gradient-primary);
      border-color: transparent;
      transform: translateY(-50%) scale(1.15);
      box-shadow: 0 8px 24px rgba(14, 165, 233, 0.4);
    }

    .lightbox-nav-btn.prev { left: -75px; }
    .lightbox-nav-btn.next { right: -75px; }

    /* Bottom Info Card */
    .lightbox-info-card {
      margin-top: 18px;
      background: rgba(15, 23, 42, 0.85);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: var(--radius-xl);
      padding: 16px 24px;
      color: white;
      width: 100%;
      max-width: 800px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 16px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.4);
    }

    @media (max-width: 992px) {
      .gallery-masonry { column-count: 2; }
      .lightbox-nav-btn.prev { left: 10px; }
      .lightbox-nav-btn.next { right: 10px; }
      .lightbox-info-card { flex-direction: column; text-align: center; }
      .lightbox-topbar { top: -48px; }
    }

    @media (max-width: 600px) {
      .gallery-masonry { column-count: 1; }
      .lightbox-image-box { max-height: 55vh; }
      .lightbox-image-box img { max-height: 55vh; }
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- =========================================================================
         1. GALLERY HERO HEADER
         ========================================================================= -->
    <section class="gallery-hero">
      <div class="container">
        
        <div class="breadcrumb flex-center mb-16" style="justify-content:center;">
          <a href="/Pages/index.aspx" class="breadcrumb-item" style="color:rgba(255,255,255,0.75);">Home</a>
          <span class="breadcrumb-sep" style="color:rgba(255,255,255,0.4);">/</span>
          <span class="breadcrumb-item active" style="color:white; font-weight:700;">Gallery</span>
        </div>

        <div class="gallery-badge">
          <i class="fa-solid fa-camera-retro" style="color:#2DD4BF;"></i>
          <span>Incredible India in High Definition</span>
        </div>

        <h1 class="section-title" style="color:white; font-size:clamp(34px, 5.5vw, 56px); margin-bottom:14px; font-weight:900;">
          Visual <span style="color:var(--accent-light, #FBBF24);">Wonders of India</span>
        </h1>
        
        <p style="color:rgba(255,255,255,0.9); max-width:640px; margin:0 auto; font-size:16px; line-height:1.7;">
          Immerse yourself in full-screen photography showcasing azure Himalayan lakes, royal sandstone palaces, serene backwaters, and golden sunsets.
        </p>

      </div>
    </section>

    <!-- =========================================================================
         2. GALLERY FILTERS & MASONRY STREAM
         ========================================================================= -->
    <section class="section">
      <div class="container">

        <!-- Category Filters -->
        <div class="flex-center gap-12 flex-wrap mb-48" id="gallery-filters">
          <button type="button" class="gallery-filter-pill active" onclick="filterGallery('all', this)">
            📸 All Photos (12)
          </button>
          <button type="button" class="gallery-filter-pill" onclick="filterGallery('mountains', this)">
            🏔️ Mountains &amp; Snow
          </button>
          <button type="button" class="gallery-filter-pill" onclick="filterGallery('beaches', this)">
            🏖️ Beaches &amp; Islands
          </button>
          <button type="button" class="gallery-filter-pill" onclick="filterGallery('monuments', this)">
            🏰 Forts &amp; Palaces
          </button>
          <button type="button" class="gallery-filter-pill" onclick="filterGallery('culture', this)">
            🛕 Culture &amp; Spiritual
          </button>
          <button type="button" class="gallery-filter-pill" onclick="filterGallery('nature', this)">
            🌿 Nature &amp; Backwaters
          </button>
        </div>

        <!-- Masonry Grid -->
        <div class="gallery-masonry" id="masonry-grid">

          <!-- Photo 1: Jaipur Hawa Mahal -->
          <div class="gallery-masonry-item anim-fade-up" data-category="monuments" data-index="0" onclick="openLightboxByIndex(0)">
            <img src="../Content/images/img_48.jpg" alt="Jaipur Pink City" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-accent">🏰 Rajasthan</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Hawa Mahal &amp; Amber Fort</h4>
                <p style="font-size:12.5px; opacity:0.9;">Jaipur, Rajasthan • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 2: Kerala Backwaters -->
          <div class="gallery-masonry-item anim-fade-up" data-category="nature" data-index="1" onclick="openLightboxByIndex(1)">
            <img src="../Content/images/img_55.jpg" alt="Kerala Backwaters" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-success">🌿 Kerala</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Tranquil Alleppey Houseboat</h4>
                <p style="font-size:12.5px; opacity:0.9;">Alleppey, Kerala • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 3: Ladakh Pangong -->
          <div class="gallery-masonry-item anim-fade-up" data-category="mountains" data-index="2" onclick="openLightboxByIndex(2)">
            <img src="../Content/images/img_14.jpg" alt="Pangong Tso Ladakh" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-dark">🏔️ Ladakh</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Azure Waters of Pangong Lake</h4>
                <p style="font-size:12.5px; opacity:0.9;">14,270 ft Altitude, Ladakh • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 4: Goa Sunset -->
          <div class="gallery-masonry-item anim-fade-up" data-category="beaches" data-index="3" onclick="openLightboxByIndex(3)">
            <img src="../Content/images/img_21.jpg" alt="Goa Palolem Beach" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-primary">🏖️ Goa</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Golden Sunset at Palolem Beach</h4>
                <p style="font-size:12.5px; opacity:0.9;">South Goa Coastline • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 5: Taj Mahal -->
          <div class="gallery-masonry-item anim-fade-up" data-category="monuments" data-index="4" onclick="openLightboxByIndex(4)">
            <img src="../Content/images/img_25.jpg" alt="Taj Mahal" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-accent">🕌 Agra</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Majestic Sunrise over Taj Mahal</h4>
                <p style="font-size:12.5px; opacity:0.9;">Agra, Uttar Pradesh • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 6: Varanasi Ganga Aarti -->
          <div class="gallery-masonry-item anim-fade-up" data-category="culture" data-index="5" onclick="openLightboxByIndex(5)">
            <img src="../Content/images/img_41.jpg" alt="Varanasi Ghats" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-accent">🛕 Varanasi</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Evening Maha Aarti on the Ghats</h4>
                <p style="font-size:12.5px; opacity:0.9;">Dashashwamedh Ghat, Kashi • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 7: Andaman Havelock -->
          <div class="gallery-masonry-item anim-fade-up" data-category="beaches" data-index="6" onclick="openLightboxByIndex(6)">
            <img src="../Content/images/img_33.jpg" alt="Andaman Havelock" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-primary">🏝️ Andaman</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Turquoise Waters of Radhanagar</h4>
                <p style="font-size:12.5px; opacity:0.9;">Havelock Island • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 8: Manali Snow -->
          <div class="gallery-masonry-item anim-fade-up" data-category="mountains" data-index="7" onclick="openLightboxByIndex(7)">
            <img src="../Content/images/img_43.jpg" alt="Manali Snow" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-secondary">❄️ Himachal</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Snowcapped Pines of Solang Valley</h4>
                <p style="font-size:12.5px; opacity:0.9;">Manali, Himachal Pradesh • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 9: Jaisalmer Desert Safari -->
          <div class="gallery-masonry-item anim-fade-up" data-category="culture" data-index="8" onclick="openLightboxByIndex(8)">
            <img src="../Content/images/img_45.jpg" alt="Thar Desert Jaisalmer" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-accent">🏜️ Thar Desert</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Golden Dunes Sunset Safari</h4>
                <p style="font-size:12.5px; opacity:0.9;">Sam Sand Dunes, Jaisalmer • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 10: Kashmir Gulmarg -->
          <div class="gallery-masonry-item anim-fade-up" data-category="mountains" data-index="9" onclick="openLightboxByIndex(9)">
            <img src="../Content/images/img_13.jpg" alt="Kashmir Snow Valley" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-dark">❄️ Kashmir</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Gulmarg Gondola &amp; Snow Alps</h4>
                <p style="font-size:12.5px; opacity:0.9;">Apharwat Peak, Kashmir • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 11: Munnar Tea Gardens -->
          <div class="gallery-masonry-item anim-fade-up" data-category="nature" data-index="10" onclick="openLightboxByIndex(10)">
            <img src="../Content/images/img_50.jpg" alt="Munnar Tea Estate" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-success">🌿 Western Ghats</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">Rolling Emerald Hills of Munnar</h4>
                <p style="font-size:12.5px; opacity:0.9;">Munnar Tea Plantations, Kerala • Click to enlarge</p>
              </div>
            </div>
          </div>

          <!-- Photo 12: Ladakh Bike Trail -->
          <div class="gallery-masonry-item anim-fade-up" data-category="mountains" data-index="11" onclick="openLightboxByIndex(11)">
            <img src="../Content/images/img_15.jpg" alt="Ladakh Royal Enfield Roadtrip" loading="lazy">
            <div class="gallery-item-overlay">
              <div class="overlay-top-badge">
                <span class="badge badge-dark">🏔️ Himalayas</span>
                <div class="overlay-zoom-icon"><i class="fa-solid fa-expand"></i></div>
              </div>
              <div>
                <h4 style="font-size:17px; font-weight:800; margin-bottom:4px;">High Mountain Pass Expedition</h4>
                <p style="font-size:12.5px; opacity:0.9;">Khardung La Pass, Ladakh • Click to enlarge</p>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section>

  <!-- =========================================================================
       3. WORLD-CLASS FULL-SCREEN LIGHTBOX MODAL
       ========================================================================= -->
  <div class="lightbox-modal" id="lightboxModal" onclick="closeLightboxOnBackdrop(event)">
    <div class="lightbox-wrapper" onclick="event.stopPropagation()">
      
      <!-- Top Control Bar -->
      <div class="lightbox-topbar">
        <span class="lightbox-counter" id="lightboxCounter">📷 Image 1 of 12</span>
        <div class="lightbox-actions">
          <button type="button" class="lightbox-action-btn" onclick="toggleLightboxFullscreen()" title="Toggle Fullscreen">
            <i class="fa-solid fa-expand" id="lightboxFullscreenIcon"></i>
          </button>
          <button type="button" class="lightbox-action-btn" onclick="shareLightboxPhoto()" title="Share Photo">
            <i class="fa-solid fa-share-nodes"></i>
          </button>
          <button type="button" class="lightbox-action-btn lightbox-close-btn" onclick="closeLightbox()" title="Close (Esc)">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>
      </div>

      <!-- Navigation Left Arrow -->
      <button type="button" class="lightbox-nav-btn prev" onclick="navigateLightbox(-1)" title="Previous (Left Arrow)">
        <i class="fa-solid fa-chevron-left"></i>
      </button>

      <!-- Main Image Display Container -->
      <div class="lightbox-image-box">
        <img id="lightboxMainImg" src="../Content/images/img_48.jpg" alt="Preview">
      </div>

      <!-- Navigation Right Arrow -->
      <button type="button" class="lightbox-nav-btn next" onclick="navigateLightbox(1)" title="Next (Right Arrow)">
        <i class="fa-solid fa-chevron-right"></i>
      </button>

      <!-- Bottom Caption Bar with Location & CTA -->
      <div class="lightbox-info-card">
        <div>
          <div class="flex-start gap-8 mb-4" style="align-items:center;">
            <span class="badge badge-accent" id="lightboxBadge" style="font-size:11px;">🏰 Rajasthan</span>
            <strong id="lightboxLocation" style="font-size:13px; color:var(--text-secondary);">Jaipur, Rajasthan</strong>
          </div>
          <h3 id="lightboxTitle" style="font-size:18px; font-weight:800; color:white; margin:0;">
            Hawa Mahal & Amber Fort
          </h3>
        </div>
        <div>
          <a href="/Pages/packages.aspx" id="lightboxCtaLink" class="btn btn-primary btn-sm" style="border-radius:var(--radius-full); white-space:nowrap; padding:8px 18px;">
            Explore Tours <i class="fa-solid fa-arrow-right" style="margin-left:4px;"></i>
          </a>
        </div>
      </div>

    </div>
  </div>

  <!-- =========================================================================
       4. CLIENT-SIDE SCRIPT CONTROLLER
       ========================================================================= -->
  <script>
    // Gallery Dataset
    const GALLERY_ITEMS = [
      {
        src: '../Content/images/img_48.jpg',
        title: 'Hawa Mahal & Amber Fort, Jaipur',
        location: 'Jaipur, Rajasthan',
        badge: '🏰 Rajasthan',
        badgeClass: 'badge-accent',
        category: 'monuments',
        ctaLink: '/Pages/package-details.aspx?id=rajasthan'
      },
      {
        src: '../Content/images/img_55.jpg',
        title: 'Tranquil Alleppey Houseboat Backwaters',
        location: 'Alleppey, Kerala',
        badge: '🌿 Kerala',
        badgeClass: 'badge-success',
        category: 'nature',
        ctaLink: '/Pages/package-details.aspx?id=kerala'
      },
      {
        src: '../Content/images/img_14.jpg',
        title: 'Azure Waters of Pangong Tso Lake',
        location: '14,270 ft Altitude, Ladakh',
        badge: '🏔️ Ladakh',
        badgeClass: 'badge-dark',
        category: 'mountains',
        ctaLink: '/Pages/package-details.aspx?id=ladakh-adventure'
      },
      {
        src: '../Content/images/img_21.jpg',
        title: 'Golden Sunset at Palolem Beach',
        location: 'South Goa Coastline',
        badge: '🏖️ Goa',
        badgeClass: 'badge-primary',
        category: 'beaches',
        ctaLink: '/Pages/package-details.aspx?id=goa'
      },
      {
        src: '../Content/images/img_25.jpg',
        title: 'Majestic Sunrise over Taj Mahal',
        location: 'Agra, Uttar Pradesh',
        badge: '🕌 Agra',
        badgeClass: 'badge-accent',
        category: 'monuments',
        ctaLink: '/Pages/package-details.aspx?id=golden-triangle'
      },
      {
        src: '../Content/images/img_41.jpg',
        title: 'Evening Maha Aarti on Sacred Ganga Ghats',
        location: 'Dashashwamedh Ghat, Varanasi',
        badge: '🛕 Varanasi',
        badgeClass: 'badge-accent',
        category: 'culture',
        ctaLink: '/Pages/packages.aspx'
      },
      {
        src: '../Content/images/img_33.jpg',
        title: 'Turquoise Waters of Radhanagar Beach',
        location: 'Havelock Island, Andaman',
        badge: '🏝️ Andaman',
        badgeClass: 'badge-primary',
        category: 'beaches',
        ctaLink: '/Pages/package-details.aspx?id=andaman'
      },
      {
        src: '../Content/images/img_43.jpg',
        title: 'Snowcapped Pines & Peaks in Solang Valley',
        location: 'Manali, Himachal Pradesh',
        badge: '❄️ Himachal',
        badgeClass: 'badge-secondary',
        category: 'mountains',
        ctaLink: '/Pages/packages.aspx'
      },
      {
        src: '../Content/images/img_45.jpg',
        title: 'Golden Sunset Camel Safari over Thar Desert',
        location: 'Sam Sand Dunes, Jaisalmer',
        badge: '🏜️ Thar Desert',
        badgeClass: 'badge-accent',
        category: 'culture',
        ctaLink: '/Pages/package-details.aspx?id=rajasthan'
      },
      {
        src: '../Content/images/img_13.jpg',
        title: 'Gulmarg Gondola & Winter Snow Alps',
        location: 'Apharwat Peak, Kashmir',
        badge: '❄️ Kashmir',
        badgeClass: 'badge-dark',
        category: 'mountains',
        ctaLink: '/Pages/package-details.aspx?id=kashmir'
      },
      {
        src: '../Content/images/img_50.jpg',
        title: 'Rolling Emerald Tea Gardens of Munnar',
        location: 'Munnar, Kerala',
        badge: '🌿 Western Ghats',
        badgeClass: 'badge-success',
        category: 'nature',
        ctaLink: '/Pages/package-details.aspx?id=kerala'
      },
      {
        src: '../Content/images/img_15.jpg',
        title: 'High Mountain Pass Royal Enfield Expedition',
        location: 'Khardung La Pass, Ladakh',
        badge: '🏔️ Himalayas',
        badgeClass: 'badge-dark',
        category: 'mountains',
        ctaLink: '/Pages/package-details.aspx?id=ladakh-adventure'
      }
    ];

    let currentPhotoIndex = 0;
    let filteredIndices = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

    function filterGallery(category, btn) {
      document.querySelectorAll('#gallery-filters .gallery-filter-pill').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      filteredIndices = [];
      const items = document.querySelectorAll('#masonry-grid .gallery-masonry-item');
      
      items.forEach((item, index) => {
        const itemCat = item.dataset.category;
        if (category === 'all' || itemCat === category) {
          item.style.display = 'block';
          filteredIndices.push(index);
        } else {
          item.style.display = 'none';
        }
      });
    }

    function openLightboxByIndex(index) {
      currentPhotoIndex = index;
      renderLightboxPhoto();
      
      const modal = document.getElementById('lightboxModal');
      if (modal) {
        modal.classList.add('open');
        document.body.style.overflow = 'hidden';
      }
    }

    function renderLightboxPhoto() {
      const item = GALLERY_ITEMS[currentPhotoIndex];
      if (!item) return;

      const img = document.getElementById('lightboxMainImg');
      const counter = document.getElementById('lightboxCounter');
      const title = document.getElementById('lightboxTitle');
      const location = document.getElementById('lightboxLocation');
      const badge = document.getElementById('lightboxBadge');
      const cta = document.getElementById('lightboxCtaLink');

      if (img) img.src = item.src;
      if (counter) counter.textContent = `📷 Image ${currentPhotoIndex + 1} of ${GALLERY_ITEMS.length}`;
      if (title) title.textContent = item.title;
      if (location) location.textContent = item.location;
      if (badge) {
        badge.textContent = item.badge;
        badge.className = `badge ${item.badgeClass}`;
      }
      if (cta) cta.href = item.ctaLink;
    }

    function navigateLightbox(direction) {
      const currentFilteredPos = filteredIndices.indexOf(currentPhotoIndex);
      if (currentFilteredPos !== -1) {
        let nextPos = currentFilteredPos + direction;
        if (nextPos < 0) nextPos = filteredIndices.length - 1;
        if (nextPos >= filteredIndices.length) nextPos = 0;
        currentPhotoIndex = filteredIndices[nextPos];
      } else {
        currentPhotoIndex = (currentPhotoIndex + direction + GALLERY_ITEMS.length) % GALLERY_ITEMS.length;
      }
      renderLightboxPhoto();
    }

    function closeLightbox() {
      const modal = document.getElementById('lightboxModal');
      if (modal) {
        modal.classList.remove('open');
        document.body.style.overflow = '';
      }
    }

    function closeLightboxOnBackdrop(e) {
      if (e.target.id === 'lightboxModal') {
        closeLightbox();
      }
    }

    function toggleLightboxFullscreen() {
      const modal = document.getElementById('lightboxModal');
      const icon = document.getElementById('lightboxFullscreenIcon');
      if (!document.fullscreenElement) {
        modal.requestFullscreen().catch(err => console.log(err));
        if (icon) icon.className = 'fa-solid fa-compress';
      } else {
        document.exitFullscreen();
        if (icon) icon.className = 'fa-solid fa-expand';
      }
    }

    function shareLightboxPhoto() {
      const item = GALLERY_ITEMS[currentPhotoIndex];
      if (navigator.share) {
        navigator.share({
          title: item.title,
          text: `Check out ${item.title} on Epic-Travellers Gallery!`,
          url: window.location.href
        }).catch(() => {});
      } else {
        if (window.Toast) Toast.show(`📸 Link to "${item.title}" copied!`, 'success');
      }
    }

    // Keyboard support: Esc = Close, Left = Prev, Right = Next
    document.addEventListener('keydown', (e) => {
      const modal = document.getElementById('lightboxModal');
      if (!modal || !modal.classList.contains('open')) return;

      if (e.key === 'Escape') closeLightbox();
      if (e.key === 'ArrowLeft') navigateLightbox(-1);
      if (e.key === 'ArrowRight') navigateLightbox(1);
    });
  </script>
</asp:Content>
