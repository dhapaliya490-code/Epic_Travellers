<%@ Page Title="Contact Us – Epic-Travellers | 24/7 Travel Assistance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Epic_Travelers.Pages.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Contact Epic-Travellers – We're here to help you plan your ideal India trip. Get in touch via phone +91 90991 07637, WhatsApp, email, or visit our headquarters in New Delhi.">
  <meta name="keywords" content="Contact Epic Travellers, India travel agent contact, Delhi travel agency office, travel customer support">

  <style>
    .page-hero {
      background: linear-gradient(135deg, rgba(11,19,41,0.9) 0%, rgba(14,165,233,0.75) 100%),
                  url('../Content/images/img_23.jpg') center/cover no-repeat;
      padding: 150px 0 90px;
      color: white;
      text-align: center;
      position: relative;
    }

    .contact-channels-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 24px;
      margin-bottom: 56px;
    }

    .contact-info-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 28px 24px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      gap: 16px;
      transition: transform 0.25s ease, box-shadow 0.25s ease, border-color 0.25s ease;
      text-decoration: none;
      color: var(--text-primary);
      position: relative;
      overflow: hidden;
    }

    .contact-info-card:hover {
      transform: translateY(-4px);
      box-shadow: var(--shadow-lg);
      border-color: var(--primary);
    }

    .contact-info-card::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: var(--gradient-primary);
      opacity: 0;
      transition: opacity 0.2s;
    }

    .contact-info-card:hover::after {
      opacity: 1;
    }

    .contact-icon {
      width: 54px;
      height: 54px;
      border-radius: var(--radius-lg);
      background: var(--gradient-primary);
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 22px;
      flex-shrink: 0;
      box-shadow: 0 4px 14px rgba(14,165,233,0.3);
    }

    .contact-main-grid {
      display: grid;
      grid-template-columns: minmax(0, 1.25fr) minmax(0, 0.95fr);
      gap: 40px;
      align-items: start;
    }

    .contact-form-card {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      padding: 36px 32px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-md);
    }

    .form-floating-group {
      margin-bottom: 20px;
    }

    .form-floating-group label {
      display: block;
      font-size: 13px;
      font-weight: 700;
      color: var(--text-primary);
      margin-bottom: 8px;
    }

    .office-map-card {
      background: var(--bg-primary);
      border-radius: var(--radius-2xl);
      padding: 32px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-md);
      margin-bottom: 24px;
    }

    .faq-accordion-item {
      background: var(--bg-primary);
      border: 1px solid var(--gray-200);
      border-radius: var(--radius-lg);
      margin-bottom: 12px;
      overflow: hidden;
      transition: border-color 0.2s;
    }

    .faq-accordion-item:hover {
      border-color: var(--primary);
    }

    .faq-question {
      padding: 18px 20px;
      font-size: 15px;
      font-weight: 700;
      color: var(--text-primary);
      cursor: pointer;
      display: flex;
      justify-content: space-between;
      align-items: center;
      user-select: none;
    }

    .faq-answer {
      padding: 0 20px 18px;
      font-size: 14px;
      color: var(--text-secondary);
      line-height: 1.7;
      display: none;
    }

    .faq-accordion-item.active .faq-answer {
      display: block;
    }

    .faq-accordion-item.active .faq-chevron {
      transform: rotate(180deg);
      color: var(--primary);
    }

    .faq-chevron {
      transition: transform 0.25s ease, color 0.2s ease;
      font-size: 14px;
      color: var(--text-muted);
    }

    @media (max-width: 992px) {
      .contact-main-grid {
        grid-template-columns: 1fr;
      }
      .page-hero {
        padding: 120px 0 60px;
      }
      .contact-form-card {
        padding: 24px 20px;
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
          <span class="breadcrumb-item active" style="color:white;">Contact Us</span>
        </div>
        
        <span class="badge" style="background:rgba(14,165,233,0.25); border:1px solid rgba(14,165,233,0.5); color:#38BDF8; padding:6px 16px; font-size:12px; font-weight:700; border-radius:999px; margin-bottom:16px; display:inline-block;">
          ✨ 24/7 Dedicated Concierge &amp; Travel Assistance
        </span>

        <h1 class="section-title" style="color:white; font-size:clamp(32px, 5vw, 52px); margin-bottom:14px;">
          Let's Plan Your <span style="color:#38BDF8;">Epic Journey</span>
        </h1>
        <p style="color:rgba(255,255,255,0.9); max-width:620px; margin:0 auto; font-size:16px; line-height:1.7;">
          Have questions about an itinerary, want a custom handcrafted tour, or need immediate assistance? Our India travel specialists are standing by 24/7.
        </p>
      </div>
    </section>

    <!-- Main Contact Section -->
    <section class="section" style="padding-top:48px; padding-bottom:80px;">
      <div class="container">

        <!-- 4 Key Channels Grid -->
        <div class="contact-channels-grid stagger-children">

          <!-- Channel 1: Phone -->
          <a href="tel:+919099107637" class="contact-info-card anim-fade-up">
            <div class="contact-icon"><i class="fa-solid fa-phone-volume"></i></div>
            <div style="width:100%;">
              <div style="font-size:11px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:var(--primary); margin-bottom:4px;">Direct Helpline</div>
              <h4 style="font-size:18px; font-weight:800; margin-bottom:4px; color:var(--text-primary);">+91 90991 07637</h4>
              <p style="font-size:13px; color:var(--text-secondary); margin:0;">
                Toll-Free &amp; 24/7 Active Support
              </p>
            </div>
          </a>

          <!-- Channel 2: WhatsApp -->
          <a href="https://wa.me/919099107637?text=Hi%20Epic-Travellers,%20I%20want%20to%20inquire%20about%20a%20tour%20package" target="_blank" class="contact-info-card anim-fade-up">
            <div class="contact-icon" style="background:linear-gradient(135deg, #25D366, #128C7E); box-shadow:0 4px 14px rgba(37,211,102,0.3);"><i class="fa-brands fa-whatsapp"></i></div>
            <div style="width:100%;">
              <div style="font-size:11px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:#25D366; margin-bottom:4px;">Instant WhatsApp</div>
              <h4 style="font-size:18px; font-weight:800; margin-bottom:4px; color:var(--text-primary);">+91 90991 07637</h4>
              <p style="font-size:13px; color:var(--text-secondary); margin:0;">
                Chat live with tour concierge
              </p>
            </div>
          </a>

          <!-- Channel 3: Email -->
          <a href="mailto:support@epic-travellers.com" class="contact-info-card anim-fade-up">
            <div class="contact-icon" style="background:linear-gradient(135deg, #7c3aed, #8b5cf6); box-shadow:0 4px 14px rgba(124,58,237,0.3);"><i class="fa-solid fa-envelope-open-text"></i></div>
            <div style="width:100%;">
              <div style="font-size:11px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:#8B5CF6; margin-bottom:4px;">Official Email</div>
              <h4 style="font-size:16px; font-weight:800; margin-bottom:4px; color:var(--text-primary); word-break:break-all;">support@epic-travellers.com</h4>
              <p style="font-size:13px; color:var(--text-secondary); margin:0;">
                Guaranteed response in 30 mins
              </p>
            </div>
          </a>

          <!-- Channel 4: HQ Office -->
          <div class="contact-info-card anim-fade-up">
            <div class="contact-icon" style="background:linear-gradient(135deg, #d97706, #f59e0b); box-shadow:0 4px 14px rgba(217,119,6,0.3);"><i class="fa-solid fa-building-circle-check"></i></div>
            <div style="width:100%;">
              <div style="font-size:11px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:#F59E0B; margin-bottom:4px;">Corporate Office</div>
              <h4 style="font-size:15px; font-weight:800; margin-bottom:4px; color:var(--text-primary);">Connaught Place, New Delhi</h4>
              <p style="font-size:12px; color:var(--text-secondary); margin:0;">
                Block C, Inner Circle, New Delhi 110001
              </p>
            </div>
          </div>

        </div>

        <!-- Main Form & Map Grid -->
        <div class="contact-main-grid">

          <!-- Left: Contact & Custom Trip Inquiry Form -->
          <div class="contact-form-card anim-fade-left">
            <div class="mb-24">
              <span class="badge badge-primary mb-8" style="font-size:11px;">Custom Tour Planning</span>
              <h2 style="font-size:24px; font-weight:800; color:var(--text-primary); margin-top:6px; margin-bottom:6px;">Send Us an Inquiry</h2>
              <p style="font-size:14px; color:var(--text-secondary); margin:0;">
                Tell us about your dream vacation and our travel specialists will build a custom day-by-day itinerary tailored to your budget.
              </p>
            </div>

            <form id="contactForm" onsubmit="handleContactSubmit(event)">
              <div class="grid grid-2" style="gap:16px;">
                <div class="form-floating-group">
                  <label for="c-name"><i class="fa-solid fa-user" style="color:var(--primary); margin-right:4px;"></i> Your Full Name *</label>
                  <input type="text" id="c-name" class="form-control" placeholder="e.g. Rahul Sharma" required>
                </div>
                <div class="form-floating-group">
                  <label for="c-email"><i class="fa-solid fa-envelope" style="color:var(--primary); margin-right:4px;"></i> Email Address *</label>
                  <input type="email" id="c-email" class="form-control" placeholder="name@domain.com" required>
                </div>
              </div>

              <div class="grid grid-2" style="gap:16px;">
                <div class="form-floating-group">
                  <label for="c-phone"><i class="fa-solid fa-phone" style="color:var(--primary); margin-right:4px;"></i> Phone / WhatsApp *</label>
                  <input type="tel" id="c-phone" class="form-control" placeholder="+91 90991 07637" required>
                </div>
                <div class="form-floating-group">
                  <label for="c-dest"><i class="fa-solid fa-map-pin" style="color:var(--primary); margin-right:4px;"></i> Destination *</label>
                  <select id="c-dest" class="form-control filter-select">
                    <option value="rajasthan">🏰 Royal Rajasthan Expedition</option>
                    <option value="kerala">🌿 Kerala Backwaters &amp; Beaches</option>
                    <option value="ladakh">🏔️ Ladakh High Altitude Adventure</option>
                    <option value="goa">🏖️ Goa Beach Holiday &amp; Nightlife</option>
                    <option value="himachal">❄️ Himachal &amp; Manali Snow Wonder</option>
                    <option value="custom">✨ Multi-City Custom India Itinerary</option>
                  </select>
                </div>
              </div>

              <div class="grid grid-2" style="gap:16px;">
                <div class="form-floating-group">
                  <label for="c-guests"><i class="fa-solid fa-users" style="color:var(--primary); margin-right:4px;"></i> Travelers Count</label>
                  <select id="c-guests" class="form-control filter-select">
                    <option value="2">2 Adults (Couple / Friends)</option>
                    <option value="1">1 Adult (Solo Traveler)</option>
                    <option value="family">Family (3 - 5 Members)</option>
                    <option value="group">Large Group (6+ Travelers)</option>
                  </select>
                </div>
                <div class="form-floating-group">
                  <label for="c-budget"><i class="fa-solid fa-wallet" style="color:var(--primary); margin-right:4px;"></i> Budget Preference</label>
                  <select id="c-budget" class="form-control filter-select">
                    <option value="premium">Premium Heritage (₹35,000 - ₹50,000/person)</option>
                    <option value="standard">Standard Comfort (₹20,000 - ₹35,000/person)</option>
                    <option value="luxury">Ultra-Luxury Palace Stays (₹60,000+/person)</option>
                  </select>
                </div>
              </div>

              <div class="form-floating-group">
                <label for="c-msg"><i class="fa-solid fa-comment-dots" style="color:var(--primary); margin-right:4px;"></i> Special Requests / Dates</label>
                <textarea id="c-msg" class="form-control" rows="4" placeholder="Tell us your preferred travel dates, places you want to explore, special hotel preferences, or dietary needs..." required></textarea>
              </div>

              <button type="submit" id="btnSubmitContact" class="btn btn-primary btn-lg" style="width:100%; font-size:15px; font-weight:700; box-shadow:0 4px 16px rgba(14,165,233,0.35);">
                <i class="fa-solid fa-paper-plane" style="margin-right:8px;"></i> Send Inquiry (Instant Confirmation)
              </button>

              <div style="display:flex; align-items:center; justify-content:center; gap:16px; margin-top:14px; font-size:12px; color:var(--text-muted);">
                <span><i class="fa-solid fa-shield-halved" style="color:#16A34A;"></i> 100% Privacy Protected</span>
                <span>•</span>
                <span><i class="fa-solid fa-bolt" style="color:#EAB308;"></i> 30-Minute Callback Guarantee</span>
              </div>
            </form>
          </div>

          <!-- Right: Office Details, Map Card & Quick Assistance -->
          <div class="anim-fade-right">
            
            <!-- Flagship Office Card -->
            <div class="office-map-card">
              <div class="flex-between mb-16">
                <div>
                  <span class="badge badge-success mb-6" style="font-size:10px;">Open Today</span>
                  <h3 style="font-size:18px; font-weight:800; color:var(--text-primary); margin:0;">New Delhi Flagship Office</h3>
                </div>
                <div style="font-size:26px;">🏛️</div>
              </div>

              <p style="font-size:13px; color:var(--text-secondary); line-height:1.6; margin-bottom:16px;">
                Visit our travel lounge in Connaught Place for a complimentary coffee and personalized face-to-face trip planning session with our senior curators.
              </p>

              <div style="background:var(--bg-secondary); border-radius:var(--radius-lg); padding:16px; border:1px solid var(--gray-200); margin-bottom:16px; font-size:13px;">
                <div style="display:flex; gap:10px; margin-bottom:8px;">
                  <i class="fa-solid fa-location-dot" style="color:var(--primary); margin-top:2px;"></i>
                  <div><strong>Address:</strong> Block C, Inner Circle, Connaught Place, New Delhi 110001, India</div>
                </div>
                <div style="display:flex; gap:10px; margin-bottom:8px;">
                  <i class="fa-regular fa-clock" style="color:var(--primary); margin-top:2px;"></i>
                  <div><strong>Hours:</strong> Mon – Sat: 9:00 AM – 8:00 PM IST (Sunday by Appointment)</div>
                </div>
                <div style="display:flex; gap:10px;">
                  <i class="fa-solid fa-train-subway" style="color:var(--primary); margin-top:2px;"></i>
                  <div><strong>Metro:</strong> Rajiv Chowk Metro Station (Gate 3 &amp; 4 - 2 mins walk)</div>
                </div>
              </div>

              <!-- Interactive Location Visual Card -->
              <div style="width:100%; height:200px; background:linear-gradient(135deg, #0b1329 0%, #1e293b 100%); border-radius:var(--radius-lg); display:flex; flex-direction:column; align-items:center; justify-content:center; color:white; text-align:center; padding:20px; position:relative; overflow:hidden; border:1px solid rgba(255,255,255,0.1);">
                <div style="position:absolute; inset:0; opacity:0.12; background:radial-gradient(#38BDF8 2px, transparent 2px); background-size:16px 16px;"></div>
                <div style="font-size:36px; margin-bottom:8px; z-index:2;">📍</div>
                <div style="font-size:16px; font-weight:800; color:white; z-index:2;">Epic-Travellers India HQ</div>
                <div style="font-size:12px; color:#38BDF8; margin-top:2px; z-index:2;">28.6304° N, 77.2177° E • Central Delhi</div>
                <a href="https://maps.google.com/?q=Connaught+Place+New+Delhi" target="_blank" class="btn btn-secondary btn-sm" style="margin-top:12px; z-index:2; background:rgba(255,255,255,0.15); color:white; border-color:rgba(255,255,255,0.3); font-size:11px;">
                  <i class="fa-solid fa-diamond-turn-right" style="margin-right:4px;"></i> Open in Google Maps
                </a>
              </div>

            </div>

            <!-- FAQ Section -->
            <div>
              <h3 style="font-size:18px; font-weight:800; color:var(--text-primary); margin-bottom:14px;">Frequently Asked Questions</h3>

              <div class="faq-accordion-item active">
                <div class="faq-question" onclick="toggleFaq(this)">
                  <span>How quickly will a travel advisor contact me?</span>
                  <i class="fa-solid fa-chevron-down faq-chevron"></i>
                </div>
                <div class="faq-answer">
                  Our dedicated travel specialists reply to online inquiries within 30 minutes during business hours. For urgent travel inquiries, you can call or WhatsApp us 24/7 at <strong>+91 90991 07637</strong>.
                </div>
              </div>

              <div class="faq-accordion-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                  <span>Can I customize destinations and dates from scratch?</span>
                  <i class="fa-solid fa-chevron-down faq-chevron"></i>
                </div>
                <div class="faq-answer">
                  Yes! All our tour packages are 100% customizable. You can adjust duration, select specific heritage hotels, change transport vehicle class, or add private guided sightseeing tours.
                </div>
              </div>

              <div class="faq-accordion-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                  <span>Are all bookings GST-compliant with official tax invoices?</span>
                  <i class="fa-solid fa-chevron-down faq-chevron"></i>
                </div>
                <div class="faq-answer">
                  Yes, every booking made with Epic-Travellers includes an official GST-compliant tax invoice and verified travel voucher accessible right in your account dashboard.
                </div>
              </div>

              <div class="faq-accordion-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                  <span>What if I need on-road assistance during my trip?</span>
                  <i class="fa-solid fa-chevron-down faq-chevron"></i>
                </div>
                <div class="faq-answer">
                  Every traveler is assigned a dedicated 24x7 trip concierge and local coordinator. In case of any adjustments, assistance, or medical queries, call our 24/7 line at <strong>+91 90991 07637</strong>.
                </div>
              </div>

            </div>

          </div>

        </div>

      </div>
    </section>

    <script>
      function toggleFaq(el) {
        const item = el.closest('.faq-accordion-item');
        const isActive = item.classList.contains('active');
        document.querySelectorAll('.faq-accordion-item').forEach(i => i.classList.remove('active'));
        if (!isActive) item.classList.add('active');
      }

      function handleContactSubmit(e) {
        e.preventDefault();
        const btn = document.getElementById('btnSubmitContact');
        const name = document.getElementById('c-name')?.value || 'Traveler';
        const dest = document.getElementById('c-dest')?.value || 'India';
        
        btn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Submitting Inquiry...';
        btn.disabled = true;

        setTimeout(() => {
          btn.innerHTML = '<i class="fa-solid fa-check"></i> Inquiry Received!';
          btn.style.background = '#16A34A';
          Toast.show(`Thank you ${name}! Your inquiry for ${dest} has been received. Our team will call +91 90991 07637 shortly. 📩`, 'success');
          
          setTimeout(() => {
            btn.innerHTML = '<i class="fa-solid fa-paper-plane" style="margin-right:8px;"></i> Send Another Inquiry';
            btn.style.background = '';
            btn.disabled = false;
            document.getElementById('contactForm')?.reset();
          }, 3000);
        }, 800);
      }
    </script>
</asp:Content>

