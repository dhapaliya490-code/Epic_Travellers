<%@ Page Title="Royal Rajasthan Expedition – Package Details | Epic-Travellers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="package-details.aspx.cs" Inherits="Epic_Travelers.Pages.package_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Detailed itinerary and booking for Royal Rajasthan Expedition tour package by Epic-Travellers. Includes heritage hotels, Thar desert safari, private transport, and guided fort tours.">
  <meta name="keywords" content="Rajasthan package itinerary, Jaipur hotel, Jaisalmer desert camp, book Rajasthan tour, Epic Travellers package">

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
  <div class="details-hero">

    <div class="container section">

      <!-- Breadcrumb -->
      <div class="breadcrumb mb-24">
        <a href="/Pages/index.aspx" class="breadcrumb-item">Home</a>
        <span class="breadcrumb-sep">/</span>
        <a href="/Pages/packages.aspx" class="breadcrumb-item">Tour Packages</a>
        <span class="breadcrumb-sep">/</span>
        <span class="breadcrumb-item active" id="pkg-title-bread">Royal Rajasthan Expedition</span>
      </div>

      <!-- Title & Header Bar -->
      <div class="flex-between flex-wrap gap-16 mb-24">
        <div>
          <span class="badge badge-accent mb-8">⭐ Bestseller Package</span>
          <h1 style="font-size:clamp(28px, 4vw, 42px); font-weight:800;" id="pkg-title-main">Royal Rajasthan Expedition</h1>
          <p style="color:var(--text-secondary); font-size:15px; margin-top:4px;">
            <i class="fa-solid fa-location-dot" style="color:var(--primary);"></i> Jaipur • Jodhpur • Jaisalmer • Udaipur, India
          </p>
        </div>
        <div style="display:flex; gap:12px; align-items:center;">
          <button type="button" class="btn btn-secondary btn-sm wishlist-btn" data-id="pkg-details-main">
            <i class="fa-regular fa-heart"></i> Save to Wishlist
          </button>
          <button type="button" class="btn btn-glass btn-sm" style="color:var(--text-primary); border-color:var(--gray-300);" onclick="navigator.share ? navigator.share({title: document.title, url: window.location.href}) : alert('URL copied!')">
            <i class="fa-solid fa-share-nodes"></i> Share
          </button>
        </div>
      </div>

      <!-- Large Image Gallery Grid -->
      <div class="gallery-grid mb-48 anim-fade-up">
        <div class="gallery-item gallery-main">
          <img src="../Content/images/img_49.jpg" alt="Amber Fort Jaipur" id="gallery-img-1">
        </div>
        <div class="gallery-item">
          <img src="../Content/images/img_24.jpg" alt="Taj Mahal & Rajasthan Palaces" id="gallery-img-2">
        </div>
        <div class="gallery-item">
          <img src="../Content/images/img_48.jpg" alt="Jaisalmer Thar Desert Safari" id="gallery-img-3">
        </div>
        <div class="gallery-item">
          <img src="../Content/images/img_37.jpg" alt="Udaipur Lake Palace" id="gallery-img-4">
        </div>
        <div class="gallery-item" style="position:relative;">
          <img src="../Content/images/img_20.jpg" alt="Indian Heritage Resort" id="gallery-img-5">
          <div style="position:absolute; inset:0; background:rgba(0,0,0,0.5); display:flex; align-items:center; justify-content:center; color:white; font-weight:700; font-size:16px;">
            +12 Photos
          </div>
        </div>
      </div>

      <!-- Content & Sidebar Layout -->
      <div class="grid" style="grid-template-columns: 2fr 1fr; gap:40px;">

        <!-- Main Details -->
        <div>

          <!-- Highlights Bar -->
          <div class="card p-24 mb-32" style="background:var(--bg-secondary); border-color:var(--gray-200); padding:20px;">
            <div class="grid grid-4" style="gap:16px; text-align:center;">
              <div>
                <small style="font-size:12px; color:var(--text-muted); text-transform:uppercase;">Duration</small>
                <div style="font-weight:700; font-size:16px; color:var(--text-primary);"><i class="fa-regular fa-clock" style="color:var(--primary);"></i> 8 Days / 7 Nights</div>
              </div>
              <div>
                <small style="font-size:12px; color:var(--text-muted); text-transform:uppercase;">Group Size</small>
                <div style="font-weight:700; font-size:16px; color:var(--text-primary);"><i class="fa-solid fa-users" style="color:var(--primary);"></i> 2 - 15 People</div>
              </div>
              <div>
                <small style="font-size:12px; color:var(--text-muted); text-transform:uppercase;">Tour Type</small>
                <div style="font-weight:700; font-size:16px; color:var(--text-primary);"><i class="fa-solid fa-crown" style="color:var(--accent);"></i> Royal Heritage</div>
              </div>
              <div>
                <small style="font-size:12px; color:var(--text-muted); text-transform:uppercase;">Languages</small>
                <div style="font-weight:700; font-size:16px; color:var(--text-primary);"><i class="fa-solid fa-language" style="color:var(--primary);"></i> English, Hindi</div>
              </div>
            </div>
          </div>

          <!-- Description -->
          <div class="mb-48">
            <h2 style="font-size:22px; font-weight:700; margin-bottom:16px;">Overview</h2>
            <p style="color:var(--text-secondary); line-height:1.8; font-size:15px; margin-bottom:16px;">
              Embark on an unforgettable royal journey through India's land of kings — Rajasthan. Walk through magnificent pink sandstone forts in Jaipur, ride camels over golden dunes in Jaisalmer, behold the majestic blue city of Jodhpur, and cruise along romantic Lake Pichola in Udaipur.
            </p>
            <p style="color:var(--text-secondary); line-height:1.8; font-size:15px;">
              Stay in converted heritage Haveli hotels, indulge in authentic Rajasthani Thali dinners with folk music, and travel in air-conditioned private luxury coaches with expert local historians.
            </p>
          </div>

          <!-- Day-by-Day Itinerary -->
          <div class="mb-48">
            <h2 style="font-size:22px; font-weight:700; margin-bottom:24px;">Tour Itinerary</h2>
            <div class="itinerary-timeline">

              <div class="itinerary-step">
                <div class="itinerary-dot"></div>
                <div style="font-size:12px; font-weight:700; color:var(--primary); text-transform:uppercase; letter-spacing:1px;">Day 1</div>
                <h3 style="font-size:18px; font-weight:700; margin:4px 0 8px;">Arrival in Jaipur – Pink City Welcome</h3>
                <p style="color:var(--text-secondary); font-size:14px; line-height:1.7;">
                  Arrive at Jaipur International Airport/Station. Check into luxury heritage stay. Evening visit to Birla Temple and traditional Rajasthani cultural dinner at Chokhi Dhani.
                </p>
              </div>

              <div class="itinerary-step">
                <div class="itinerary-dot"></div>
                <div style="font-size:12px; font-weight:700; color:var(--primary); text-transform:uppercase; letter-spacing:1px;">Day 2 & 3</div>
                <h3 style="font-size:18px; font-weight:700; margin:4px 0 8px;">Jaipur Forts & Palaces Exploration</h3>
                <p style="color:var(--text-secondary); font-size:14px; line-height:1.7;">
                  Elephant ride to Amber Fort, photo stop at Hawa Mahal (Palace of Winds), visit City Palace museum, and Jantar Mantar observatory. Shopping in Johari Bazaar.
                </p>
              </div>

              <div class="itinerary-step">
                <div class="itinerary-dot"></div>
                <div style="font-size:12px; font-weight:700; color:var(--primary); text-transform:uppercase; letter-spacing:1px;">Day 4</div>
                <h3 style="font-size:18px; font-weight:700; margin:4px 0 8px;">Jodhpur – The Blue City & Mehrangarh Fort</h3>
                <p style="color:var(--text-secondary); font-size:14px; line-height:1.7;">
                  Drive to Jodhpur. Explore towering Mehrangarh Fort, Jaswant Thada marble cenotaph, and stroll through the iconic blue-painted houses of the old city.
                </p>
              </div>

              <div class="itinerary-step">
                <div class="itinerary-dot"></div>
                <div style="font-size:12px; font-weight:700; color:var(--primary); text-transform:uppercase; letter-spacing:1px;">Day 5 & 6</div>
                <h3 style="font-size:18px; font-weight:700; margin:4px 0 8px;">Jaisalmer – Golden Fort & Thar Desert Camp</h3>
                <p style="color:var(--text-secondary); font-size:14px; line-height:1.7;">
                  Reach Jaisalmer. Visit Patwon ki Haveli and living Fort. Head to Sam Sand Dunes for camel safari, sunset view, Kalbelia folk dance, and luxury tent night stay under stars.
                </p>
              </div>

              <div class="itinerary-step">
                <div class="itinerary-dot"></div>
                <div style="font-size:12px; font-weight:700; color:var(--primary); text-transform:uppercase; letter-spacing:1px;">Day 7 & 8</div>
                <h3 style="font-size:18px; font-weight:700; margin:4px 0 8px;">Udaipur – City of Lakes & Departure</h3>
                <p style="color:var(--text-secondary); font-size:14px; line-height:1.7;">
                  Scenic drive to Udaipur via Ranakpur Jain Temple. Boat ride on Lake Pichola, visit Jag Mandir and City Palace complex. Departure transfer.
                </p>
              </div>

            </div>
          </div>

          <!-- Inclusions & Exclusions -->
          <div class="mb-48">
            <h2 style="font-size:22px; font-weight:700; margin-bottom:24px;">Services Included & Excluded</h2>
            <div class="grid grid-2" style="gap:24px;">
              <div class="card p-24" style="background:rgba(34,197,94,0.04); border-color:rgba(34,197,94,0.2); padding:20px;">
                <h3 style="font-size:16px; font-weight:700; color:#22C55E; margin-bottom:16px;">
                  <i class="fa-solid fa-circle-check"></i> Included Services
                </h3>
                <div class="include-list">
                  <div class="include-item"><i class="fa-solid fa-check"></i> 7 Nights stay in 4★ Heritage Haveli Hotels</div>
                  <div class="include-item"><i class="fa-solid fa-check"></i> Daily Breakfast & Gourmet Dinners</div>
                  <div class="include-item"><i class="fa-solid fa-check"></i> Private AC Sedan / SUV Transport with Driver</div>
                  <div class="include-item"><i class="fa-solid fa-check"></i> Thar Desert Camel Safari & Luxury Tent Night</div>
                  <div class="include-item"><i class="fa-solid fa-check"></i> Lake Pichola Sunset Boat Cruise</div>
                  <div class="include-item"><i class="fa-solid fa-check"></i> English-speaking Local Tour Historians</div>
                  <div class="include-item"><i class="fa-solid fa-check"></i> All Tolls, Parking, Fuel & Driver Allowances</div>
                </div>
              </div>

              <div class="card p-24" style="background:rgba(239,68,68,0.04); border-color:rgba(239,68,68,0.2); padding:20px;">
                <h3 style="font-size:16px; font-weight:700; color:#EF4444; margin-bottom:16px;">
                  <i class="fa-solid fa-circle-xmark"></i> Excluded Services
                </h3>
                <div class="exclude-list">
                  <div class="exclude-item"><i class="fa-solid fa-xmark"></i> Airfare / Train tickets to/from Jaipur</div>
                  <div class="exclude-item"><i class="fa-solid fa-xmark"></i> Personal expenses & shopping</div>
                  <div class="exclude-item"><i class="fa-solid fa-xmark"></i> Camera / Video permits at monuments</div>
                  <div class="exclude-item"><i class="fa-solid fa-xmark"></i> Travel insurance (available add-on)</div>
                  <div class="exclude-item"><i class="fa-solid fa-xmark"></i> Tips for drivers and guides</div>
                </div>
              </div>
            </div>
          </div>

          <!-- Hotels & Stays Info -->
          <div class="mb-48">
            <h2 style="font-size:22px; font-weight:700; margin-bottom:20px;">Accommodation & Stays</h2>
            <div class="grid grid-3" style="gap:16px;">
              <div class="card p-16" style="padding:16px;">
                <img src="../Content/images/img_36.jpg" style="border-radius:var(--radius-md); height:140px; width:100%; object-fit:cover; margin-bottom:12px;" alt="Shahpura House Jaipur">
                <h4 style="font-size:15px; font-weight:700;">Shahpura House</h4>
                <p style="font-size:12px; color:var(--text-muted);">Jaipur • 4★ Heritage</p>
              </div>
              <div class="card p-16" style="padding:16px;">
                <img src="../Content/images/img_47.jpg" style="border-radius:var(--radius-md); height:140px; width:100%; object-fit:cover; margin-bottom:12px;" alt="Thar Luxury Desert Camp">
                <h4 style="font-size:15px; font-weight:700;">Serena Desert Camp</h4>
                <p style="font-size:12px; color:var(--text-muted);">Jaisalmer • Luxury Tents</p>
              </div>
              <div class="card p-16" style="padding:16px;">
                <img src="../Content/images/img_47.jpg" style="border-radius:var(--radius-md); height:140px; width:100%; object-fit:cover; margin-bottom:12px;" alt="Fateh Garh Palace Udaipur">
                <h4 style="font-size:15px; font-weight:700;">Fateh Garh Palace</h4>
                <p style="font-size:12px; color:var(--text-muted);">Udaipur • 5★ Heritage</p>
              </div>
            </div>
          </div>

          <!-- FAQ Accordion -->
          <div class="mb-48">
            <h2 style="font-size:22px; font-weight:700; margin-bottom:20px;">Frequently Asked Questions</h2>

            <div class="accordion-item">
              <div class="accordion-header">
                <span>What is the best month to do this Rajasthan tour?</span>
                <i class="fa-solid fa-plus accordion-icon"></i>
              </div>
              <div class="accordion-body">
                <div class="accordion-body-inner">
                  The ideal time is from October to March when the desert weather is pleasant with clear sunny days (20-25°C) and cool evenings.
                </div>
              </div>
            </div>

            <div class="accordion-item">
              <div class="accordion-header">
                <span>Can this package be customized for a private family?</span>
                <i class="fa-solid fa-plus accordion-icon"></i>
              </div>
              <div class="accordion-body">
                <div class="accordion-body-inner">
                  Yes! All our tour packages can be 100% customized to your preferred dates, hotel categories, vehicle type, and duration.
                </div>
              </div>
            </div>

            <div class="accordion-item">
              <div class="accordion-header">
                <span>What is the cancellation and refund policy?</span>
                <i class="fa-solid fa-plus accordion-icon"></i>
              </div>
              <div class="accordion-body">
                <div class="accordion-body-inner">
                  You receive a 100% full refund if cancelled 48 hours prior to trip start date. We offer hassle-free instant refunds to your original payment method.
                </div>
              </div>
            </div>

          </div>

        </div>

        <!-- Sticky Booking Form Sidebar -->
        <div>
          <div class="booking-sidebar-card">
            <div class="flex-between mb-16">
              <div>
                <small style="font-size:12px; color:var(--text-muted);">Price starting from</small>
                <div style="font-size:28px; font-weight:800; color:var(--primary);" data-price-inr="25000">₹25,000</div>
                <span style="font-size:12px; color:var(--text-muted);">per person (incl. taxes)</span>
              </div>
              <div class="stars" style="text-align:right;">
                ★★★★★
                <div style="font-size:12px; color:var(--text-muted); font-family:sans-serif;">4.9 (328 reviews)</div>
              </div>
            </div>

            <hr style="border:none; border-top:1px solid var(--gray-200); margin:20px 0;">

            <div class="booking-form">
              <div class="form-group">
                <label class="form-label" for="book-date">Travel Date</label>
                <input type="date" id="book-date" name="travel_date" class="form-control" required>
              </div>

              <div class="grid grid-2" style="gap:12px;">
                <div class="form-group">
                  <label class="form-label" for="book-adults">Adults (12+ yrs)</label>
                  <select id="book-adults" name="adults" class="form-control filter-select">
                    <option value="1">1 Adult</option>
                    <option value="2" selected>2 Adults</option>
                    <option value="3">3 Adults</option>
                    <option value="4">4 Adults</option>
                  </select>
                </div>
                <div class="form-group">
                  <label class="form-label" for="book-children">Children</label>
                  <select id="book-children" name="children" class="form-control filter-select">
                    <option value="0">0 Children</option>
                    <option value="1">1 Child</option>
                    <option value="2">2 Children</option>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="form-label" for="book-hotel">Hotel Choice</label>
                <select id="book-hotel" name="hotel" class="form-control filter-select">
                  <option value="heritage">4★ Heritage Haveli (Included)</option>
                  <option value="5star">5★ Palace Luxury (+₹10,000)</option>
                </select>
              </div>

              <div class="form-group">
                <label class="form-label" for="book-name">Full Name</label>
                <input type="text" id="book-name" name="name" class="form-control" placeholder="e.g. Vikram Sharma" required>
              </div>

              <div class="form-group">
                <label class="form-label" for="book-email">Email Address</label>
                <input type="email" id="book-email" name="email" class="form-control" placeholder="name@domain.com" required>
              </div>

              <div class="form-group">
                <label class="form-label" for="book-phone">Phone / WhatsApp</label>
                <input type="tel" id="book-phone" name="phone" class="form-control" placeholder="+91 98765 43210" required>
              </div>

              <div style="background:var(--gray-100); border-radius:var(--radius-md); padding:12px; margin-bottom:20px; font-size:13px;">
                <div class="flex-between mb-4"><span>Subtotal (2 Adults):</span> <strong>₹50,000</strong></div>
                <div class="flex-between mb-4"><span>Discount (EPIC10):</span> <strong style="color:#22C55E;">-₹5,000</strong></div>
                <div class="flex-between" style="font-weight:700; font-size:14px; border-top:1px solid var(--gray-200); padding-top:6px; margin-top:6px;">
                  <span>Total Payable:</span> <span style="color:var(--primary);">₹45,000</span>
                </div>
              </div>

              <button type="button" onclick="Toast.show('Booking request received!', 'success')" class="btn btn-accent btn-lg" style="width:100%;">
                <i class="fa-solid fa-bolt"></i> Book Now (Instant Confirmation)
              </button>
            </div>

            <div style="margin-top:16px; text-align:center; font-size:12px; color:var(--text-muted);">
              🔒 256-Bit SSL Encrypted & Secure Checkout
            </div>
          </div>
        </div>

      </div>

    </div>
  </div>
  <script>
    // Customize page based on URL parameters if provided
    document.addEventListener('DOMContentLoaded', () => {
      const params = new URLSearchParams(window.location.search);
      const id = params.get('id');

      if (id === 'kerala') {
        document.getElementById('pkg-title-bread').textContent = 'Kerala Backwaters & Beaches';
        document.getElementById('pkg-title-main').textContent = 'Kerala Backwaters Romantic Bliss';
        document.getElementById('gallery-img-1').src = '../Content/images/img_56.jpg';
      } else if (id === 'ladakh-adventure') {
        document.getElementById('pkg-title-bread').textContent = 'Ladakh Bike Expedition';
        document.getElementById('pkg-title-main').textContent = 'Ladakh High Altitude Bike Expedition';
        document.getElementById('gallery-img-1').src = '../Content/images/img_15.jpg';
      }
    });
  </script>
</asp:Content>
