<%@ Page Title="Gallery – Epic-Travellers | Visual Journey Across India" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="Epic_Travelers.Pages.gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Explore high-definition photo and video gallery of Incredible India with Epic-Travellers. View stunning photography from Rajasthan, Kerala, Goa, Ladakh, and more.">
  <meta name="keywords" content="India travel photos, Rajasthan photography, Kerala backwater images, Ladakh photos, Goa beach pictures">

  <style>
    .page-hero {
      background: linear-gradient(135deg, rgba(15,23,42,0.85) 0%, rgba(20,184,166,0.7) 100%),
                  url('../Content/images/img_31.jpg') center/cover;
      padding: 140px 0 80px;
      color: white;
      text-align: center;
    }

    .gallery-masonry {
      column-count: 3;
      column-gap: 20px;
    }

    .gallery-masonry-item {
      break-inside: avoid;
      margin-bottom: 20px;
      position: relative;
      border-radius: var(--radius-xl);
      overflow: hidden;
      cursor: pointer;
      box-shadow: var(--shadow-md);
      transition: var(--transition-normal);
    }

    .gallery-masonry-item img {
      width: 100%;
      height: auto;
      display: block;
      transition: transform 0.6s ease;
    }

    .gallery-masonry-item:hover img {
      transform: scale(1.06);
    }

    .gallery-item-overlay {
      position: absolute;
      inset: 0;
      background: linear-gradient(0deg, rgba(0,0,0,0.8) 0%, transparent 60%);
      opacity: 0;
      transition: opacity 0.3s ease;
      display: flex;
      flex-direction: column;
      justify-content: flex-end;
      padding: 20px;
      color: white;
    }

    .gallery-masonry-item:hover .gallery-item-overlay {
      opacity: 1;
    }

    /* Lightbox Modal */
    .lightbox-modal {
      position: fixed;
      inset: 0;
      background: rgba(0,0,0,0.9);
      z-index: 9999;
      display: none;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    .lightbox-modal.open {
      display: flex;
    }

    .lightbox-content {
      max-width: 90vw;
      max-height: 85vh;
      border-radius: var(--radius-lg);
      overflow: hidden;
      box-shadow: var(--shadow-xl);
    }

    .lightbox-content img {
      max-width: 100%;
      max-height: 85vh;
      object-fit: contain;
    }

    @media (max-width: 992px) {
      .gallery-masonry { column-count: 2; }
    }

    @media (max-width: 600px) {
      .gallery-masonry { column-count: 1; }
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
          <span class="breadcrumb-item active" style="color:white;">Gallery</span>
        </div>
        <h1 class="section-title" style="color:white; font-size:clamp(32px, 5vw, 54px);">
          Visual <span style="color:var(--accent-light);">Wonders of India</span>
        </h1>
        <p style="color:rgba(255,255,255,0.85); max-width:600px; margin:0 auto; font-size:16px;">
          High-definition photo gallery showcasing India's breathtaking landscapes, royal architecture, and vibrant festivals.
        </p>
      </div>
    </section>

    <!-- Gallery Section -->
    <section class="section">
      <div class="container">

        <!-- Category Filters -->
        <div class="flex-center gap-12 flex-wrap mb-48" id="gallery-filters">
          <button type="button" class="tag active" data-filter="all">📸 All Photos</button>
          <button type="button" class="tag" data-filter="mountains">🏔️ Mountains</button>
          <button type="button" class="tag" data-filter="beaches">🏖️ Beaches</button>
          <button type="button" class="tag" data-filter="monuments">🏰 Forts & Palaces</button>
          <button type="button" class="tag" data-filter="culture">🛕 Culture & Spiritual</button>
          <button type="button" class="tag" data-filter="nature">🌿 Nature & Wildlife</button>
        </div>

        <!-- Masonry Grid -->
        <div class="gallery-masonry" id="masonry-grid">

          <!-- Photo 1: Jaipur -->
          <div class="gallery-masonry-item anim-fade-up" data-category="monuments" onclick="openLightbox('../Content/images/img_44.jpg', 'Jaipur Hawa Mahal & Amber Fort')">
            <img src="../Content/images/img_48.jpg" alt="Jaipur Pink City" loading="lazy">
            <div class="gallery-item-overlay">
              <span class="badge badge-accent mb-4" style="width:max-content;">🏰 Rajasthan</span>
              <h4 style="font-size:16px; font-weight:700;">Hawa Mahal & Amber Fort, Jaipur</h4>
              <p style="font-size:12px; opacity:0.8;">Click to enlarge</p>
            </div>
          </div>

          <!-- Photo 2: Kerala -->
          <div class="gallery-masonry-item anim-fade-up" data-category="nature" onclick="openLightbox('../Content/images/img_50.jpg', 'Kerala Backwaters Houseboat')">
            <img src="../Content/images/img_55.jpg" alt="Kerala Backwaters" loading="lazy">
            <div class="gallery-item-overlay">
              <span class="badge badge-secondary mb-4" style="width:max-content;">🌿 Kerala</span>
              <h4 style="font-size:16px; font-weight:700;">Tranquil Alleppey Backwaters</h4>
              <p style="font-size:12px; opacity:0.8;">Click to enlarge</p>
            </div>
          </div>

          <!-- Photo 3: Ladakh -->
          <div class="gallery-masonry-item anim-fade-up" data-category="mountains" onclick="openLightbox('../Content/images/img_9.jpg', 'Pangong Lake Ladakh')">
            <img src="../Content/images/img_14.jpg" alt="Pangong Tso Ladakh" loading="lazy">
            <div class="gallery-item-overlay">
              <span class="badge badge-dark mb-4" style="width:max-content;">🏔️ Ladakh</span>
              <h4 style="font-size:16px; font-weight:700;">Azure Waters of Pangong Lake</h4>
              <p style="font-size:12px; opacity:0.8;">Click to enlarge</p>
            </div>
          </div>

          <!-- Photo 4: Goa -->
          <div class="gallery-masonry-item anim-fade-up" data-category="beaches" onclick="openLightbox('../Content/images/img_18.jpg', 'Goa Palolem Beach')">
            <img src="../Content/images/img_21.jpg" alt="Goa Palolem" loading="lazy">
            <div class="gallery-item-overlay">
              <span class="badge badge-primary mb-4" style="width:max-content;">🏖️ Goa</span>
              <h4 style="font-size:16px; font-weight:700;">Golden Sunset at Palolem Beach</h4>
              <p style="font-size:12px; opacity:0.8;">Click to enlarge</p>
            </div>
          </div>

          <!-- Photo 5: Taj Mahal -->
          <div class="gallery-masonry-item anim-fade-up" data-category="monuments" onclick="openLightbox('../Content/images/img_22.jpg', 'Taj Mahal Agra')">
            <img src="../Content/images/img_25.jpg" alt="Taj Mahal" loading="lazy">
            <div class="gallery-item-overlay">
              <span class="badge badge-accent mb-4" style="width:max-content;">🕌 Agra</span>
              <h4 style="font-size:16px; font-weight:700;">Majestic Sunrise over Taj Mahal</h4>
              <p style="font-size:12px; opacity:0.8;">Click to enlarge</p>
            </div>
          </div>

          <!-- Photo 6: Varanasi -->
          <div class="gallery-masonry-item anim-fade-up" data-category="culture" onclick="openLightbox('../Content/images/img_38.jpg', 'Varanasi Ganga Aarti')">
            <img src="../Content/images/img_41.jpg" alt="Varanasi Ghats" loading="lazy">
            <div class="gallery-item-overlay">
              <span class="badge badge-accent mb-4" style="width:max-content;">🛕 Varanasi</span>
              <h4 style="font-size:16px; font-weight:700;">Evening Ganga Aarti at Ghats</h4>
              <p style="font-size:12px; opacity:0.8;">Click to enlarge</p>
            </div>
          </div>

          <!-- Photo 7: Andaman -->
          <div class="gallery-masonry-item anim-fade-up" data-category="beaches" onclick="openLightbox('../Content/images/img_30.jpg', 'Andaman Radhanagar Beach')">
            <img src="../Content/images/img_33.jpg" alt="Andaman Havelock" loading="lazy">
            <div class="gallery-item-overlay">
              <span class="badge badge-primary mb-4" style="width:max-content;">🏝️ Andaman</span>
              <h4 style="font-size:16px; font-weight:700;">Turquoise Waters of Havelock</h4>
              <p style="font-size:12px; opacity:0.8;">Click to enlarge</p>
            </div>
          </div>

          <!-- Photo 8: Manali -->
          <div class="gallery-masonry-item anim-fade-up" data-category="mountains" onclick="openLightbox('../Content/images/img_42.jpg', 'Manali Snow Valleys')">
            <img src="../Content/images/img_43.jpg" alt="Manali Snow" loading="lazy">
            <div class="gallery-item-overlay">
              <span class="badge badge-secondary mb-4" style="width:max-content;">❄️ Himachal</span>
              <h4 style="font-size:16px; font-weight:700;">Snowcapped Pines in Manali</h4>
              <p style="font-size:12px; opacity:0.8;">Click to enlarge</p>
            </div>
          </div>

          <!-- Photo 9: Jaisalmer -->
          <div class="gallery-masonry-item anim-fade-up" data-category="culture" onclick="openLightbox('../Content/images/img_45.jpg', 'Jaisalmer Desert Safari')">
            <img src="../Content/images/img_48.jpg" alt="Thar Desert Jaisalmer" loading="lazy">
            <div class="gallery-item-overlay">
              <span class="badge badge-accent mb-4" style="width:max-content;">🏜️ Thar Desert</span>
              <h4 style="font-size:16px; font-weight:700;">Sunset Camel Trek in Jaisalmer</h4>
              <p style="font-size:12px; opacity:0.8;">Click to enlarge</p>
            </div>
          </div>

        </div>

      </div>
    </section>

  </main>

  <!-- Lightbox Modal -->
  <div class="lightbox-modal" id="lightbox" onclick="closeLightbox()">
    <button type="button" style="position:absolute; top:20px; right:20px; color:white; font-size:32px; background:none; border:none; cursor:pointer;" onclick="closeLightbox()">&times;</button>
    <div class="lightbox-content" onclick="event.stopPropagation()">
      <img id="lightbox-img" src="" alt="Full preview">
      <div style="background:var(--bg-primary); padding:16px; text-align:center; color:var(--text-primary); font-weight:700;" id="lightbox-caption"></div>
    </div>
    <script>
    function openLightbox(imgSrc, title) {
      document.getElementById('lightbox-img').src = imgSrc;
      document.getElementById('lightbox-caption').textContent = title;
      document.getElementById('lightbox').classList.add('open');
      document.body.style.overflow = 'hidden';
    }

    function closeLightbox() {
      document.getElementById('lightbox').classList.remove('open');
      document.body.style.overflow = '';
    }

    // Filter tags
    document.querySelectorAll('#gallery-filters .tag').forEach(btn => {
      btn.addEventListener('click', () => {
        document.querySelectorAll('#gallery-filters .tag').forEach(t => t.classList.remove('active'));
        btn.classList.add('active');

        const filter = btn.dataset.filter;
        document.querySelectorAll('#masonry-grid .gallery-masonry-item').forEach(item => {
          if (filter === 'all' || item.dataset.category === filter) {
            item.style.display = 'block';
          } else {
            item.style.display = 'none';
          }
        });
      });
    });
  </script>
</asp:Content>
