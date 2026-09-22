<%@ Page Title="Blog Details – Epic-Travellers | India Travel Stories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="blog-details.aspx.cs" Inherits="Epic_Travelers.Pages.blog_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="description" content="Read expert travel stories, insider tips, and detailed itineraries across India by Epic-Travellers.">
  <meta name="keywords" content="India travel guide, travel stories, India itinerary, Epic-Travellers blog">

  <style>
    .blog-details-hero {
      position: relative;
      padding-top: var(--header-height);
    }

    .article-header {
      max-width: 860px;
      margin: 0 auto 32px;
      text-align: center;
    }

    .article-hero-img-wrapper {
      width: 100%;
      height: 480px;
      border-radius: var(--radius-2xl);
      overflow: hidden;
      margin-bottom: 40px;
      box-shadow: var(--shadow-xl);
      border: 1px solid var(--gray-200);
    }

    .article-hero-img-wrapper img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .article-layout {
      display: grid;
      grid-template-columns: 2.3fr 1fr;
      gap: 48px;
    }

    .article-body {
      color: var(--text-primary);
      font-size: 16px;
      line-height: 1.85;
    }

    .article-body p {
      margin-bottom: 24px;
      color: var(--text-secondary);
    }

    .article-body h2 {
      font-size: 26px;
      font-weight: 800;
      color: var(--text-primary);
      margin: 36px 0 16px;
      line-height: 1.35;
    }

    .article-body h3 {
      font-size: 20px;
      font-weight: 700;
      color: var(--text-primary);
      margin: 28px 0 12px;
    }

    .article-quote {
      border-left: 4px solid var(--primary);
      background: var(--bg-secondary);
      padding: 24px 28px;
      border-radius: 0 var(--radius-xl) var(--radius-xl) 0;
      margin: 32px 0;
      font-size: 18px;
      font-style: italic;
      color: var(--text-primary);
      line-height: 1.6;
    }

    .tips-box {
      background: var(--bg-primary);
      border: 1px solid var(--primary-light, #38bdf8);
      border-radius: var(--radius-xl);
      padding: 28px;
      margin: 36px 0;
      box-shadow: var(--shadow-md);
      position: relative;
    }

    .tips-box-title {
      font-size: 18px;
      font-weight: 800;
      color: var(--primary);
      display: flex;
      align-items: center;
      gap: 8px;
      margin-bottom: 16px;
    }

    .article-sidebar {
      display: flex;
      flex-direction: column;
      gap: 24px;
    }

    .sidebar-card {
      background: var(--bg-primary);
      border-radius: var(--radius-xl);
      padding: 24px;
      border: 1px solid var(--gray-200);
      box-shadow: var(--shadow-sm);
    }

    .author-card {
      display: flex;
      align-items: center;
      gap: 16px;
      margin-bottom: 16px;
    }

    .author-avatar {
      width: 56px;
      height: 56px;
      border-radius: 50%;
      background: var(--gradient-primary);
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-size: 22px;
      font-weight: 700;
    }

    .related-post-item {
      display: flex;
      gap: 12px;
      align-items: center;
      padding: 12px 0;
      border-bottom: 1px solid var(--gray-200);
      text-decoration: none;
      color: inherit;
    }

    .related-post-item:last-child {
      border-bottom: none;
      padding-bottom: 0;
    }

    .related-post-thumb {
      width: 70px;
      height: 60px;
      border-radius: var(--radius-md);
      object-fit: cover;
      flex-shrink: 0;
    }

    @media (max-width: 992px) {
      .article-layout {
        grid-template-columns: 1fr;
      }
      .article-hero-img-wrapper {
        height: 320px;
      }
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="blog-details-hero section">
    <div class="container">

      <!-- Breadcrumb -->
      <div class="breadcrumb mb-24">
        <a href="/Pages/index.aspx" class="breadcrumb-item">Home</a>
        <span class="breadcrumb-sep">/</span>
        <a href="/Pages/blog.aspx" class="breadcrumb-item">Travel Blog</a>
        <span class="breadcrumb-sep">/</span>
        <span class="breadcrumb-item active" id="blog-bread-title">The Ultimate Ladakh Biking Expedition Guide 2025</span>
      </div>

      <!-- Article Header -->
      <header class="article-header anim-fade-up">
        <div style="display:inline-block;" id="blog-category-badge-wrapper">
          <span class="badge badge-accent mb-12" id="blog-category-badge">Adventure Travel</span>
        </div>
        <h1 style="font-size:clamp(28px, 4.5vw, 44px); font-weight:800; line-height:1.25; margin-bottom:16px; color:var(--text-primary);" id="blog-main-title">
          The Ultimate Ladakh Biking Expedition Guide 2025
        </h1>
        <div class="flex-center gap-16 flex-wrap" style="color:var(--text-secondary); font-size:14px;">
          <span><i class="fa-regular fa-user" style="color:var(--primary);"></i> <strong id="blog-author-name">Kabir Sharma</strong></span>
          <span>•</span>
          <span><i class="fa-regular fa-calendar" style="color:var(--primary);"></i> <span id="blog-date">Jan 15, 2025</span></span>
          <span>•</span>
          <span><i class="fa-regular fa-clock" style="color:var(--primary);"></i> <span id="blog-read-time">8 min read</span></span>
          <span>•</span>
          <button type="button" class="btn btn-glass btn-sm" onclick="navigator.share ? navigator.share({title: document.title, url: window.location.href}) : Toast.show('Link copied to clipboard!', 'success')" style="border-radius:var(--radius-full); padding:4px 12px;">
            <i class="fa-solid fa-share-nodes"></i> Share
          </button>
        </div>
      </header>

      <!-- Featured Image Banner -->
      <div class="article-hero-img-wrapper anim-fade-up">
        <img src="../Content/images/img_15.jpg" alt="Ladakh Roadtrip" id="blog-hero-image">
      </div>

      <!-- Main Layout: Content + Sidebar -->
      <div class="article-layout">

        <!-- Article Main Content -->
        <main>
          <div class="article-body card p-32" id="blog-content-body">
            <p class="lead" style="font-size:18px; font-weight:500; color:var(--text-primary); line-height:1.8;">
              Riding a Royal Enfield across high Himalayan mountain passes in Ladakh is widely considered the holy grail of Indian road trips. With rugged terrains, surreal moonscapes, and altitudes climbing above 17,500 feet, this is a life-affirming odyssey that requires meticulous preparation.
            </p>

            <h2>1. Choosing Your Route: Manali-Leh vs Srinagar-Leh</h2>
            <p>
              The <strong>Manali-Leh Highway (490 km)</strong> is the more thrilling and adventurous route, crossing Rohtang Pass, Baralacha La, Nakee La, Lachung La, and Tanglang La. However, altitude gains are steep, making proper acclimatization in Keylong or Jispa mandatory.
            </p>
            <p>
              The <strong>Srinagar-Leh Highway (420 km)</strong> offers a much gentler ascent via Sonamarg, Zoji La, Dras, and Kargil, allowing your body to adapt progressively to thinner air while taking in lush green Kashmiri valleys transitioning to barren mountainscapes.
            </p>

            <div class="article-quote">
              "The mountains don't judge your speed — they demand your respect. Every pass in Ladakh teaches you humility, focus, and pure joy."
            </div>

            <h2>2. Essential Permits &amp; Acclimatization Rules</h2>
            <p>
              To travel to protected areas such as Pangong Tso, Nubra Valley (via Khardung La), and Tso Moriri, Indian and foreign travelers require the <em>Inner Line Permit (ILP)</em> issued by the Leh District Administration. You can apply online or through Epic-Travellers concierge services.
            </p>
            <p>
              Always take at least <strong>48 hours of complete rest in Leh (11,500 ft)</strong> upon arrival. Hydrate with 4-5 liters of water daily, avoid alcohol, and carry preventative medication (such as Diamox) under medical consultation.
            </p>

            <div class="tips-box">
              <div class="tips-box-title">
                <i class="fa-solid fa-lightbulb"></i> Pro Rider's Checklist for Ladakh
              </div>
              <ul style="padding-left:20px; display:flex; flex-direction:column; gap:8px; color:var(--text-secondary); font-size:14px;">
                <li><strong>Motorcycle:</strong> Royal Enfield Himalayan 450 or Classic 350 with tubeless/heavy-duty tube setups.</li>
                <li><strong>Gear:</strong> Level-2 all-weather riding jacket, waterproof riding boots, thermal base layers, and windproof gloves.</li>
                <li><strong>Fuel Strategy:</strong> Carry 10L jerry cans — there is a 365 km stretch between Tandi and Karu with zero petrol stations!</li>
                <li><strong>Connectivity:</strong> Only postpaid SIM cards (BSNL, Jio, Airtel) work in Ladakh.</li>
              </ul>
            </div>

            <h2>3. Highlights You Cannot Miss</h2>
            <p>
              From watching sunrise over the crystalline blue waters of <strong>Pangong Tso</strong> (which spans across India and Tibet) to riding the double-humped Bactrian camels on the silver sand dunes of <strong>Hunder in Nubra Valley</strong>, every turn in Ladakh feels like a surreal painting.
            </p>

            <h2>Conclusion &amp; Booking Your Expedition</h2>
            <p>
              Whether you choose a guided group tour with backup vehicles and mechanical support, or venture out solo, Ladakh will stay in your heart forever. Epic-Travellers organizes fully supported biking expeditions throughout June to September with premium bikes, oxygen backup, and expert road captains.
            </p>
          </div>

          <!-- Bottom Action Bar -->
          <div class="card p-24 mt-32 flex-between flex-wrap gap-16" style="background:var(--bg-secondary);">
            <a href="/Pages/blog.aspx" class="btn btn-secondary btn-sm">
              <i class="fa-solid fa-arrow-left"></i> Back to All Articles
            </a>
            <div style="display:flex; gap:10px; align-items:center;">
              <span style="font-size:14px; font-weight:600; color:var(--text-secondary);">Enjoyed this read?</span>
              <button type="button" class="btn btn-primary btn-sm" onclick="Toast.show('Thank you for liking this article! ❤️', 'success')">
                <i class="fa-regular fa-heart"></i> Like Article
              </button>
            </div>
          </div>
        </main>

        <!-- Sidebar -->
        <aside class="article-sidebar">

          <!-- Author Bio -->
          <div class="sidebar-card">
            <h4 style="font-size:16px; font-weight:700; margin-bottom:16px; color:var(--text-primary);">About the Author</h4>
            <div class="author-card">
              <div class="author-avatar" id="blog-author-avatar">KS</div>
              <div>
                <strong style="display:block; font-size:15px; color:var(--text-primary);" id="blog-author-fullname">Kabir Sharma</strong>
                <small style="color:var(--text-muted);">Himalayan Guide &amp; Explorer</small>
              </div>
            </div>
            <p style="font-size:13px; color:var(--text-secondary); line-height:1.6;" id="blog-author-bio">
              Kabir has led over 45 high-altitude bike expeditions across Ladakh, Spiti, and Kashmir. He has been writing for Epic-Travellers since 2021.
            </p>
          </div>

          <!-- Featured Related Tour Package CTA -->
          <div class="sidebar-card" style="background:var(--gradient-primary); color:white;">
            <span class="badge" style="background:rgba(255,255,255,0.2); color:white; margin-bottom:12px; font-size:11px;">✈️ Featured Package</span>
            <h4 style="font-size:18px; font-weight:800; margin-bottom:8px; color:white;" id="blog-cta-title">Ladakh High Altitude Bike Expedition</h4>
            <p style="font-size:13px; opacity:0.9; margin-bottom:16px;" id="blog-cta-desc">8 Days / 7 Nights • Royal Enfield + Fuel + Hotel + Permits included.</p>
            <div class="flex-between mb-16">
              <span style="font-size:12px; opacity:0.85;">Starting from</span>
              <strong style="font-size:20px; color:var(--accent-light);" id="blog-cta-price">₹32,000</strong>
            </div>
            <a href="/Pages/package-details.aspx?id=ladakh-adventure" class="btn btn-accent btn-sm" style="width:100%; text-align:center;" id="blog-cta-link">
              View Package Details ➔
            </a>
          </div>

          <!-- Related Posts -->
          <div class="sidebar-card">
            <h4 style="font-size:16px; font-weight:700; margin-bottom:16px; color:var(--text-primary);">More Travel Stories</h4>
            <div id="blog-related-list">
              <a href="/Pages/blog-details.aspx?id=kerala-backwaters-houseboat" class="related-post-item">
                <img src="../Content/images/img_55.jpg" alt="Kerala" class="related-post-thumb">
                <div>
                  <div style="font-size:13px; font-weight:700; color:var(--text-primary); line-height:1.4;">Kerala Backwaters: Houseboat Cruise Experience</div>
                  <small style="color:var(--text-muted);">Jan 10, 2025 • 5 min read</small>
                </div>
              </a>
              <a href="/Pages/blog-details.aspx?id=rajasthan-forts" class="related-post-item">
                <img src="../Content/images/img_48.jpg" alt="Rajasthan" class="related-post-thumb">
                <div>
                  <div style="font-size:13px; font-weight:700; color:var(--text-primary); line-height:1.4;">10 Forts in Rajasthan That Transport You Back in Time</div>
                  <small style="color:var(--text-muted);">Jan 04, 2025 • 7 min read</small>
                </div>
              </a>
              <a href="/Pages/blog-details.aspx?id=goa-hidden-spots" class="related-post-item">
                <img src="../Content/images/img_21.jpg" alt="Goa" class="related-post-thumb">
                <div>
                  <div style="font-size:13px; font-weight:700; color:var(--text-primary); line-height:1.4;">Beyond Beaches: Hidden Secret Spots in South Goa</div>
                  <small style="color:var(--text-muted);">Dec 28, 2024 • 6 min read</small>
                </div>
              </a>
              <a href="/Pages/blog-details.aspx?id=varanasi-ganga-aarti" class="related-post-item">
                <img src="../Content/images/img_41.jpg" alt="Varanasi" class="related-post-thumb">
                <div>
                  <div style="font-size:13px; font-weight:700; color:var(--text-primary); line-height:1.4;">A Spiritual Morning in Varanasi: Boat Ride &amp; Ganga Aarti</div>
                  <small style="color:var(--text-muted);">Dec 18, 2024 • 5 min read</small>
                </div>
              </a>
            </div>
          </div>

          <!-- Newsletter Widget -->
          <div class="sidebar-card">
            <h4 style="font-size:16px; font-weight:700; margin-bottom:8px; color:var(--text-primary);">📩 Weekly Dispatch</h4>
            <p style="font-size:13px; color:var(--text-secondary); margin-bottom:16px;">
              Get handpicked travel stories, secret trails, and flight alerts across India.
            </p>
            <div class="form-group mb-8">
              <input type="email" placeholder="Enter your email" class="form-control" style="font-size:13px;">
            </div>
            <button type="button" class="btn btn-primary btn-sm" style="width:100%;" onclick="Toast.show('Subscribed to travel newsletter!', 'success')">Subscribe</button>
          </div>

        </aside>

      </div>

    </div>
  </div>

  <script>
    // Blog Posts Data Dictionary
    const BLOG_POSTS = {
      'ladakh-biking-guide': {
        title: "The Ultimate Ladakh Biking Expedition Guide 2025",
        category: "Adventure Travel",
        badgeClass: "badge-accent",
        author: "Kabir Sharma",
        authorInitials: "KS",
        authorRole: "Himalayan Guide & Explorer",
        authorBio: "Kabir has led over 45 high-altitude bike expeditions across Ladakh, Spiti, and Kashmir. He has been writing for Epic-Travellers since 2021.",
        date: "Jan 15, 2025",
        readTime: "8 min read",
        heroImg: "../Content/images/img_15.jpg",
        ctaTitle: "Ladakh High Altitude Bike Expedition",
        ctaDesc: "8 Days / 7 Nights • Royal Enfield + Fuel + Hotel + Permits included.",
        ctaPrice: "₹32,000",
        ctaLink: "/Pages/package-details.aspx?id=ladakh-adventure",
        content: `
          <p class="lead" style="font-size:18px; font-weight:500; color:var(--text-primary); line-height:1.8;">
            Riding a Royal Enfield across high Himalayan mountain passes in Ladakh is widely considered the holy grail of Indian road trips. With rugged terrains, surreal moonscapes, and altitudes climbing above 17,500 feet, this is a life-affirming odyssey that requires meticulous preparation.
          </p>

          <h2>1. Choosing Your Route: Manali-Leh vs Srinagar-Leh</h2>
          <p>
            The <strong>Manali-Leh Highway (490 km)</strong> is the more thrilling and adventurous route, crossing Rohtang Pass, Baralacha La, Nakee La, Lachung La, and Tanglang La. However, altitude gains are steep, making proper acclimatization in Keylong or Jispa mandatory.
          </p>
          <p>
            The <strong>Srinagar-Leh Highway (420 km)</strong> offers a much gentler ascent via Sonamarg, Zoji La, Dras, and Kargil, allowing your body to adapt progressively to thinner air while taking in lush green Kashmiri valleys transitioning to barren mountainscapes.
          </p>

          <div class="article-quote">
            "The mountains don't judge your speed — they demand your respect. Every pass in Ladakh teaches you humility, focus, and pure joy."
          </div>

          <h2>2. Essential Permits & Acclimatization Rules</h2>
          <p>
            To travel to protected areas such as Pangong Tso, Nubra Valley (via Khardung La), and Tso Moriri, Indian and foreign travelers require the <em>Inner Line Permit (ILP)</em> issued by the Leh District Administration. You can apply online or through Epic-Travellers concierge services.
          </p>
          <p>
            Always take at least <strong>48 hours of complete rest in Leh (11,500 ft)</strong> upon arrival. Hydrate with 4-5 liters of water daily, avoid alcohol, and carry preventative medication (such as Diamox) under medical consultation.
          </p>

          <div class="tips-box">
            <div class="tips-box-title">
              <i class="fa-solid fa-lightbulb"></i> Pro Rider's Checklist for Ladakh
            </div>
            <ul style="padding-left:20px; display:flex; flex-direction:column; gap:8px; color:var(--text-secondary); font-size:14px;">
              <li><strong>Motorcycle:</strong> Royal Enfield Himalayan 450 or Classic 350 with tubeless/heavy-duty tube setups.</li>
              <li><strong>Gear:</strong> Level-2 all-weather riding jacket, waterproof riding boots, thermal base layers, and windproof gloves.</li>
              <li><strong>Fuel Strategy:</strong> Carry 10L jerry cans — there is a 365 km stretch between Tandi and Karu with zero petrol stations!</li>
              <li><strong>Connectivity:</strong> Only postpaid SIM cards (BSNL, Jio, Airtel) work in Ladakh.</li>
            </ul>
          </div>

          <h2>3. Highlights You Cannot Miss</h2>
          <p>
            From watching sunrise over the crystalline blue waters of <strong>Pangong Tso</strong> (which spans across India and Tibet) to riding the double-humped Bactrian camels on the silver sand dunes of <strong>Hunder in Nubra Valley</strong>, every turn in Ladakh feels like a surreal painting.
          </p>
        `
      },
      'kerala-backwaters-houseboat': {
        title: "Kerala Backwaters: Houseboat Cruise Experience",
        category: "Nature & Backwaters",
        badgeClass: "badge-success",
        author: "Meera Nair",
        authorInitials: "MN",
        authorRole: "South India Cultural Specialist",
        authorBio: "Meera is a Cochin native and culinary writer specializing in Kerala coastal eco-tourism and heritage homestays.",
        date: "Jan 10, 2025",
        readTime: "5 min read",
        heroImg: "../Content/images/img_55.jpg",
        ctaTitle: "Kerala Backwaters Romantic Bliss",
        ctaDesc: "5 Days / 4 Nights • Luxury Houseboat + Munnar Tea Gardens + Private Cab.",
        ctaPrice: "₹18,000",
        ctaLink: "/Pages/package-details.aspx?id=kerala",
        content: `
          <p class="lead" style="font-size:18px; font-weight:500; color:var(--text-primary); line-height:1.8;">
            Gliding peacefully along emerald-green waterways fringed by swaying coconut palms, a traditional Kettuvallam (houseboat) in Alleppey offers one of the world's most tranquil travel experiences.
          </p>

          <h2>The Charm of Traditional Kettuvallams</h2>
          <p>
            Originally built to transport grain and spices across Kerala's vast 900-km inland waterway network, these boats are crafted from natural Anjili wood, bamboo mats, and coir ropes without a single iron nail. Today, they have been refitted into floating luxury suites featuring air-conditioned bedrooms, private balconies, and onboard chefs.
          </p>

          <div class="article-quote">
            "There is a rhythm to the backwaters — the splash of the oar, the rustle of palms, and the aroma of fresh spices frying in coconut oil."
          </div>

          <h2>Authentic Culinary Journey on Board</h2>
          <p>
            Your private chef will prepare freshly caught <em>Karimeen Pollichathu</em> (pearl spot fish marinated in shallots, ginger, and curry leaves, wrapped in banana leaf and grilled), served alongside steaming red rice, avial, and crispy papadums.
          </p>

          <div class="tips-box">
            <div class="tips-box-title">
              <i class="fa-solid fa-leaf"></i> Best Time & Route Tips
            </div>
            <ul style="padding-left:20px; display:flex; flex-direction:column; gap:8px; color:var(--text-secondary); font-size:14px;">
              <li><strong>Best Season:</strong> October to March offers dry weather, pleasant breezes, and lush post-monsoon greenery.</li>
              <li><strong>Recommended Route:</strong> Alleppey round-trip via Kuttanad (the region below sea level) or Alleppey to Kumarakom.</li>
              <li><strong>Village Walks:</strong> Ask your boat captain to dock for a walk through canal villages to watch toddy tapping and coir making.</li>
            </ul>
          </div>
        `
      },
      'rajasthan-forts': {
        title: "10 Forts in Rajasthan That Transport You Back in Time",
        category: "Heritage & Palaces",
        badgeClass: "badge-primary",
        author: "Devendra Rathore",
        authorInitials: "DR",
        authorRole: "Historian & Rajasthan Tour Architect",
        authorBio: "Devendra has researched Rajput architecture for over 15 years and curates exclusive royal heritage experiences for Epic-Travellers.",
        date: "Jan 04, 2025",
        readTime: "7 min read",
        heroImg: "../Content/images/img_48.jpg",
        ctaTitle: "Royal Rajasthan Expedition",
        ctaDesc: "7 Days / 6 Nights • Heritage Haveli Stays + Thar Desert Safari + Fort Passes.",
        ctaPrice: "₹25,000",
        ctaLink: "/Pages/package-details.aspx?id=rajasthan",
        content: `
          <p class="lead" style="font-size:18px; font-weight:500; color:var(--text-primary); line-height:1.8;">
            Rajasthan's hill forts are grand monuments to medieval military architecture, chivalry, and breathtaking artistic vision. Standing tall atop rocky ridges across the Aravalli hills, these UNESCO World Heritage wonders tell epic tales of bravery and regal elegance.
          </p>

          <h2>1. Mehrangarh Fort (Jodhpur) — The Citadel of the Sun</h2>
          <p>
            Rising 400 feet above the Blue City of Jodhpur, Mehrangarh's towering burnished sandstone walls are sheer and imposing. Inside, the Sheesh Mahal (Palace of Mirrors) and Phool Mahal showcase gold leaf filigree work, while the ramparts offer panoramic views of blue-washed Brahmin houses below.
          </p>

          <h2>2. Amber Fort & Palace (Jaipur)</h2>
          <p>
            Overlooking Maota Lake, Amber blends Hindu and Mughal styles seamlessly. The famed Sheesh Mahal reflects candlelight across thousands of convex glass mirrors, illuminating the entire hall like a starry night sky.
          </p>

          <div class="article-quote">
            "Rajasthan's forts are not just stone and mortar — they are the living soul of valor, love, and timeless legends."
          </div>

          <h2>3. Jaisalmer Golden Fort (Sonar Qila)</h2>
          <p>
            Jaisalmer is one of the world's very few living forts: inside its honey-colored yellow sandstone bastions reside over 4,000 residents, vibrant artisan shops, rooftop cafes, and intricately carved 15th-century Jain temples.
          </p>

          <div class="tips-box">
            <div class="tips-box-title">
              <i class="fa-solid fa-landmark"></i> Visitor Insider Guide
            </div>
            <ul style="padding-left:20px; display:flex; flex-direction:column; gap:8px; color:var(--text-secondary); font-size:14px;">
              <li><strong>Audio Guides:</strong> Invest in official audio guides at Mehrangarh and Amber — they provide exceptional historical narration.</li>
              <li><strong>Sunset Spots:</strong> Head to Nahargarh Fort in Jaipur for the finest sunset view over the Pink City.</li>
              <li><strong>Sound & Light Shows:</strong> Chittorgarh and Amber host nightly sound and light shows recounting battles and legends.</li>
            </ul>
          </div>
        `
      },
      'goa-hidden-spots': {
        title: "Beyond Beaches: Hidden Secret Spots in South Goa",
        category: "Beach & Nightlife",
        badgeClass: "badge-accent",
        author: "Ayesha Pereira",
        authorInitials: "AP",
        authorRole: "Goa Coastal Specialist",
        authorBio: "Born in Margao, Ayesha discovers undiscovered coves, Portuguese mansions, and eco-trails throughout coastal Goa.",
        date: "Dec 28, 2024",
        readTime: "6 min read",
        heroImg: "../Content/images/img_21.jpg",
        ctaTitle: "Goa Coastal Escape & Cruise",
        ctaDesc: "4 Days / 3 Nights • Beachside Resort + South Goa Heritage + Mandovi Cruise.",
        ctaPrice: "₹12,000",
        ctaLink: "/Pages/package-details.aspx?id=goa",
        content: `
          <p class="lead" style="font-size:18px; font-weight:500; color:var(--text-primary); line-height:1.8;">
            While North Goa is renowned for lively flea markets and bustling beach shacks, South Goa harbors quiet secret coves, cliffside Portuguese ruins, spice plantations, and pristine backwaters waiting to be explored.
          </p>

          <h2>1. Cabo de Rama Fort & Cliff Views</h2>
          <p>
            Named after Lord Rama, this ancient cliffside fortress in Canacona offers mesmerizing panoramic views of the Arabian Sea. The wild, untamed coastline below features secluded pebble beaches and dramatic wave surges against black volcanic rocks.
          </p>

          <h2>2. Butterfly Beach & Kakolem Cove</h2>
          <p>
            Accessible primarily by local boat from Palolem or a short jungle hike, Butterfly Beach is a secluded semi-circular cove where dolphins can frequently be spotted playing close to shore during early mornings.
          </p>

          <div class="article-quote">
            "Slow down, rent a scooter, and take the winding rural roads between paddy fields — that is where the real Goa lives."
          </div>

          <h2>3. Fontainhas Latin Quarter (Panaji)</h2>
          <p>
            Wander narrow streets flanked by pastel-colored 18th-century Portuguese houses with terracotta roofs, wrought-iron balconies, and heritage bakeries serving freshly baked Bebinca and Poi bread.
          </p>
        `
      },
      'varanasi-ganga-aarti': {
        title: "A Spiritual Morning in Varanasi: Boat Ride & Ganga Aarti",
        category: "Spiritual Journey",
        badgeClass: "badge-primary",
        author: "Pt. Rameshwar Pandey",
        authorInitials: "RP",
        authorRole: "Varanasi Cultural Guide",
        authorBio: "A 5th generation Kashi resident and scholar of Vedic philosophy with over 20 years guiding spiritual seekers.",
        date: "Dec 18, 2024",
        readTime: "5 min read",
        heroImg: "../Content/images/img_41.jpg",
        ctaTitle: "Kashi Spiritual & Cultural Tour",
        ctaDesc: "4 Days / 3 Nights • Subah-e-Banaras Boat Ride + VIP Aarti Pass + Sarnath.",
        ctaPrice: "₹14,000",
        ctaLink: "/Pages/packages.aspx",
        content: `
          <p class="lead" style="font-size:18px; font-weight:500; color:var(--text-primary); line-height:1.8;">
            Mark Twain famously wrote: "Benares is older than history, older than tradition, older even than legend, and looks twice as old as all of them put together." Experiencing sunrise on the holy river Ganga is a transformative journey into India's eternal spiritual heart.
          </p>

          <h2>The Magic of Subah-e-Banaras</h2>
          <p>
            As morning mist rises above the ancient river ghats at 5:30 AM, wooden rowboats float silently across the sacred Ganges. Chants of Sanskrit hymns, ringing temple bells, and devotees performing morning Surya Namaskar along the stone steps create an unforgettable sensory tapestry.
          </p>

          <div class="article-quote">
            "In Varanasi, life and eternity meet upon the ghats with peace, devotion, and supreme acceptance."
          </div>

          <h2>The Grand Evening Maha Aarti at Dashashwamedh Ghat</h2>
          <p>
            Every evening at dusk, young priests dressed in silk dhotis perform the choreographed Ganga Aarti using heavy brass multi-tiered fire lamps, conch shells, and incense, offering devotion to the river goddess Ganga as thousands of earthen lamps (diyas) float across the water.
          </p>

          <div class="tips-box">
            <div class="tips-box-title">
              <i class="fa-solid fa-om"></i> Spiritual Visitor Etiquette
            </div>
            <ul style="padding-left:20px; display:flex; flex-direction:column; gap:8px; color:var(--text-secondary); font-size:14px;">
              <li><strong>Best Boat Experience:</strong> Book a hand-rowed wooden boat instead of a motor boat for peace and close ghat access.</li>
              <li><strong>Photography:</strong> Photography is strictly prohibited at Manikarnika and Harishchandra burning ghats out of respect for grieving families.</li>
              <li><strong>Silk Shopping:</strong> Visit weaver colonies in Madanpura for authentic handloom Banarasi silk sarees.</li>
            </ul>
          </div>
        `
      },
      'kashmir-winter-guide': {
        title: "Kashmir in Winter: Gulmarg Gondola Snow & Dal Lake Shikara Guide",
        category: "Winter Wonderland",
        badgeClass: "badge-dark",
        author: "Zubair Ahmad",
        authorInitials: "ZA",
        authorRole: "Kashmir Alpine Guide",
        authorBio: "Zubair is a certified mountaineer and ski instructor who has guided winter expeditions across Pir Panjal and Zanskar.",
        date: "Dec 05, 2024",
        readTime: "7 min read",
        heroImg: "../Content/images/img_13.jpg",
        ctaTitle: "Kashmir Snow & Houseboat Wonderland",
        ctaDesc: "6 Days / 5 Nights • Gulmarg Gondola + Dal Lake Houseboat + Pahalgam Valley.",
        ctaPrice: "₹24,000",
        ctaLink: "/Pages/package-details.aspx?id=kashmir",
        content: `
          <p class="lead" style="font-size:18px; font-weight:500; color:var(--text-primary); line-height:1.8;">
            Blanketed in pure white powder, winter in Kashmir is an ethereal dream. From riding one of the world's highest cable cars in Gulmarg to sipping hot Kehwa inside a century-old cedar houseboat on Dal Lake, Paradise on Earth sparkles brightest under winter skies.
          </p>

          <h2>1. Gulmarg Gondola & Apharwat Peak Skiing</h2>
          <p>
            The Gulmarg Gondola operates in two phases, carrying skiers and sightseers up to Apharwat Peak at 13,780 feet. Phase 1 takes you to Kongdoori Valley through towering snow-covered pine forests, while Phase 2 ascends above the cloudline into pristine alpine backcountry bowls known worldwide for powder skiing.
          </p>

          <div class="article-quote">
            "Watching the morning mist lift over a frozen Dal Lake while holding a warm earthen Kangri is an experience unmatched anywhere in the world."
          </div>

          <h2>2. Luxury Houseboat Living & Floating Markets</h2>
          <p>
            Stay aboard a handcrafted cedarwood houseboat on Dal Lake or Nigeen Lake. In winter, mornings begin with the gentle splash of a Shikara boat taking you through the 150-year-old floating vegetable market, followed by fragrant saffron tea with crushed almonds and cinnamon.
          </p>

          <div class="tips-box">
            <div class="tips-box-title">
              <i class="fa-solid fa-snowflake"></i> Winter Kashmir Essentials
            </div>
            <ul style="padding-left:20px; display:flex; flex-direction:column; gap:8px; color:var(--text-secondary); font-size:14px;">
              <li><strong>Gondola Phase 2 Tickets:</strong> Book Phase 2 tickets at least 3 weeks online in advance as daily slots sell out rapidly.</li>
              <li><strong>Layering:</strong> Thermals, waterproof ski jackets, and waterproof snow boots with deep rubber treads are mandatory.</li>
              <li><strong>Pahalgam Winter Trails:</strong> Visit Betaab Valley and Aru Valley for frozen pine forest walks and sledge rides.</li>
            </ul>
          </div>
        `
      },
      'andaman-scuba-guide': {
        title: "Andaman Scuba Diving: Havelock Coral Reefs & Night Kayaking",
        category: "Island Expeditions",
        badgeClass: "badge-primary",
        author: "Tara Sen",
        authorInitials: "TS",
        authorRole: "Marine Biologist & Dive Master",
        authorBio: "PADI Master Scuba Diver Trainer Tara has conducted over 1,200 dives across the Andaman archipelago and Lakshadweep.",
        date: "Nov 24, 2024",
        readTime: "6 min read",
        heroImg: "../Content/images/img_33.jpg",
        ctaTitle: "Andaman Islands Coral & Beach Odyssey",
        ctaDesc: "6 Days / 5 Nights • Havelock Island + Radhanagar Sunset + Scuba Dive session.",
        ctaPrice: "₹28,500",
        ctaLink: "/Pages/package-details.aspx?id=andaman",
        content: `
          <p class="lead" style="font-size:18px; font-weight:500; color:var(--text-primary); line-height:1.8;">
            With turquoise waters boasting 20-30 meters of underwater visibility, vibrant coral walls, and mesmerizing bioluminescent night tides, the Andaman Islands are South Asia's crown jewel for scuba diving and island tranquility.
          </p>

          <h2>1. Top Dive Sites in Havelock (Swaraj Dweep)</h2>
          <p>
            <strong>Elephant Beach &amp; Dixon’s Pinnacle:</strong> Famous for giant barrel sponges, manta rays, reef sharks, and clownfish swimming through soft sea anemones.
          </p>
          <p>
            <strong>The Wall:</strong> A steep drop-off dropping to 55 meters teeming with large pelagics, barracudas, and colorful nudibranchs.
          </p>

          <div class="article-quote">
            "Gliding through a midnight mangrove channel while each stroke of your paddle ignites a galaxy of blue bioluminescence is purely celestial."
          </div>

          <h2>2. Radhanagar Beach (Beach No. 7)</h2>
          <p>
            Rated among Asia's best beaches by Time Magazine, Radhanagar's powder-soft white sand and warm turquoise sea are flanked by dense tropical rainforests, offering the most dramatic sunset in the Bay of Bengal.
          </p>

          <div class="tips-box">
            <div class="tips-box-title">
              <i class="fa-solid fa-water"></i> Andaman Dive & Island Advice
            </div>
            <ul style="padding-left:20px; display:flex; flex-direction:column; gap:8px; color:var(--text-secondary); font-size:14px;">
              <li><strong>Fly After Diving Rule:</strong> Allow at least 18-24 hours between your last scuba dive and boarding your flight from Port Blair.</li>
              <li><strong>Ferry Bookings:</strong> Book Makruzz or Nautika catamaran ferries between Port Blair, Havelock, and Neil Island in advance.</li>
              <li><strong>Cellular Coverage:</strong> BSNL and Airtel offer the most reliable 4G connectivity across Havelock and Neil islands.</li>
            </ul>
          </div>
        `
      },
      'golden-triangle-guide': {
        title: "Golden Triangle in 6 Days: Sunrise Taj Mahal & Pink City Secrets",
        category: "Classic India Circuit",
        badgeClass: "badge-accent",
        author: "Devendra Rathore",
        authorInitials: "DR",
        authorRole: "Historian & Tour Architect",
        authorBio: "Devendra specializes in Indo-Islamic architecture and heritage corridors across North India.",
        date: "Nov 15, 2024",
        readTime: "6 min read",
        heroImg: "../Content/images/img_32.jpg",
        ctaTitle: "Golden Triangle Classic Expedition",
        ctaDesc: "6 Days / 5 Nights • Delhi + Agra Taj Mahal + Jaipur Pink City & Forts.",
        ctaPrice: "₹22,000",
        ctaLink: "/Pages/package-details.aspx?id=golden-triangle",
        content: `
          <p class="lead" style="font-size:18px; font-weight:500; color:var(--text-primary); line-height:1.8;">
            Connecting Delhi, Agra, and Jaipur, the Golden Triangle is India's most celebrated travel itinerary. Spanning Mughal grandeur, monumental UNESCO monuments, and vibrant Rajput royal heritage, here is how to experience it seamlessly.
          </p>

          <h2>1. Delhi: Where Historic Dynasties Meet Modern Energy</h2>
          <p>
            Start in Old Delhi with a rickshaw ride through the narrow spice-scented alleys of Chandni Chowk, explore the red sandstone majesty of Jama Masjid, and marvel at Humayun’s Tomb — the grand architectural precursor to the Taj Mahal.
          </p>

          <h2>2. Agra: The Magic of Sunrise at the Taj Mahal</h2>
          <p>
            Enter the east gate at dawn (5:45 AM). As the first rays of morning light hit the ivory-white Makrana marble, the monument shifts through delicate shades of blush pink, amber, and glowing pearl white before the crowds arrive.
          </p>

          <div class="article-quote">
            "The Taj Mahal is not a piece of architecture, as other buildings are, but the proud passion of an emperor's love wrought in living stone."
          </div>

          <h2>3. Jaipur: Palaces, Astronomical Observatories & Bazaars</h2>
          <p>
            Ascend Amber Fort on elephant or jeep back, marvel at Jantar Mantar's giant sundials, photograph the 953 honeycombed windows of Hawa Mahal, and browse Johari Bazaar for blue pottery and precious gemstones.
          </p>

          <div class="tips-box">
            <div class="tips-box-title">
              <i class="fa-solid fa-train"></i> Express Transit Tip
            </div>
            <ul style="padding-left:20px; display:flex; flex-direction:column; gap:8px; color:var(--text-secondary); font-size:14px;">
              <li><strong>Vande Bharat / Gatimaan Express:</strong> Travel between Delhi and Agra in just 1 hour 40 minutes on the high-speed Gatimaan Express.</li>
              <li><strong>Taj Friday Closure:</strong> Remember that the Taj Mahal is closed to all visitors on Fridays!</li>
            </ul>
          </div>
        `
      },
      'himachal-mountain-guide': {
        title: "Himachal Mountain Roadmap: Manali, Solang Valley & Cedar Treks",
        category: "Himalayan Escapes",
        badgeClass: "badge-secondary",
        author: "Kabir Sharma",
        authorInitials: "KS",
        authorRole: "Himalayan Guide & Explorer",
        authorBio: "Kabir has led over 45 high-altitude bike expeditions across Ladakh, Spiti, and Himachal.",
        date: "Nov 02, 2024",
        readTime: "5 min read",
        heroImg: "../Content/images/img_43.jpg",
        ctaTitle: "Himachal Serenity & Valley Escape",
        ctaDesc: "6 Days / 5 Nights • Shimla Mall Road + Manali Solang + Atal Tunnel excursion.",
        ctaPrice: "₹19,500",
        ctaLink: "/Pages/packages.aspx",
        content: `
          <p class="lead" style="font-size:18px; font-weight:500; color:var(--text-primary); line-height:1.8;">
            Nestled under towering snow-capped peaks and fragrant deodar cedar forests, Himachal Pradesh offers the quintessential Himalayan escape with riverside cafes, high mountain passes, and thrilling adventure sports.
          </p>

          <h2>1. Old Manali & Whispering Pines</h2>
          <p>
            Escape the bustling main bazaar to Old Manali, where traditional wooden Kathkuni houses, artisanal bakeries, live acoustic music, and trails through the Hidimba Temple cedar groves offer unhurried mountain serenity.
          </p>

          <h2>2. Solang Valley & Atal Tunnel to Lahaul</h2>
          <p>
            Experience tandem paragliding high above the Beas River valley in Solang. Driving through the 9.02 km Atal Tunnel beneath the Rohtang Pass instantly transports you into the rugged, surreal landscape of Sissu and the Lahaul valley with frozen waterfalls.
          </p>

          <div class="article-quote">
            "The cedar-scented mountain air of Himachal has a way of sweeping all urban worries into the rushing Beas river."
          </div>

          <div class="tips-box">
            <div class="tips-box-title">
              <i class="fa-solid fa-mountain"></i> Himachal Trekking & Dining Picks
            </div>
            <ul style="padding-left:20px; display:flex; flex-direction:column; gap:8px; color:var(--text-secondary); font-size:14px;">
              <li><strong>Jogini Waterfall Hike:</strong> An easy 1.5-hour pine trail hike starting from Vashisht village with natural hot sulfur springs.</li>
              <li><strong>Local Dish:</strong> Taste hot steamed <em>Siddu</em> with fresh walnut chutney and pure ghee at local village cafes.</li>
            </ul>
          </div>
        `
      }
    };

    document.addEventListener('DOMContentLoaded', () => {
      const params = new URLSearchParams(window.location.search);
      const slug = params.get('id') || 'ladakh-biking-guide';
      const post = BLOG_POSTS[slug] || BLOG_POSTS['ladakh-biking-guide'];

      if (post) {
        document.title = `${post.title} – Epic-Travellers Blog`;
        if (document.getElementById('blog-bread-title')) document.getElementById('blog-bread-title').textContent = post.title;
        if (document.getElementById('blog-main-title')) document.getElementById('blog-main-title').textContent = post.title;
        if (document.getElementById('blog-category-badge')) document.getElementById('blog-category-badge').textContent = post.category;
        if (document.getElementById('blog-author-name')) document.getElementById('blog-author-name').textContent = post.author;
        if (document.getElementById('blog-author-fullname')) document.getElementById('blog-author-fullname').textContent = post.author;
        if (document.getElementById('blog-author-avatar')) document.getElementById('blog-author-avatar').textContent = post.authorInitials;
        if (document.getElementById('blog-author-bio')) document.getElementById('blog-author-bio').textContent = post.authorBio;
        if (document.getElementById('blog-date')) document.getElementById('blog-date').textContent = post.date;
        if (document.getElementById('blog-read-time')) document.getElementById('blog-read-time').textContent = post.readTime;
        if (document.getElementById('blog-hero-image')) document.getElementById('blog-hero-image').src = post.heroImg;
        if (document.getElementById('blog-content-body')) document.getElementById('blog-content-body').innerHTML = post.content;
        
        if (post.ctaTitle && document.getElementById('blog-cta-title')) {
          document.getElementById('blog-cta-title').textContent = post.ctaTitle;
          document.getElementById('blog-cta-desc').textContent = post.ctaDesc;
          document.getElementById('blog-cta-price').textContent = post.ctaPrice;
          document.getElementById('blog-cta-link').href = post.ctaLink;
        }

        // Render dynamic related posts (excluding the active post)
        const relatedContainer = document.getElementById('blog-related-list');
        if (relatedContainer) {
          const otherKeys = Object.keys(BLOG_POSTS).filter(k => k !== slug).slice(0, 4);
          relatedContainer.innerHTML = otherKeys.map(k => {
            const p = BLOG_POSTS[k];
            return `
              <a href="/Pages/blog-details.aspx?id=${k}" class="related-post-item">
                <img src="${p.heroImg}" alt="${p.title}" class="related-post-thumb">
                <div>
                  <div style="font-size:13px; font-weight:700; color:var(--text-primary); line-height:1.4;">${p.title}</div>
                  <small style="color:var(--text-muted);">${p.date} • ${p.readTime}</small>
                </div>
              </a>
            `;
          }).join('');
        }
      }
    });
  </script>
</asp:Content>
