/* ============================================================
   EPIC-TRAVELLERS - Shared Components (Header + Footer)
   Injected into every page via JavaScript
   ============================================================ */

'use strict';

// Resolve active authentication state synchronously
function getActiveAuth() {
  // 1. Check window.EPIC_USER (injected synchronously by Site.Master)
  if (window.EPIC_USER && typeof window.EPIC_USER.isLoggedIn === 'boolean') {
    return window.EPIC_USER;
  }
  // 2. Check localStorage fallback
  try {
    const raw = localStorage.getItem('epic_user');
    if (raw) {
      const parsed = JSON.parse(raw);
      if (parsed && parsed.isLoggedIn) {
        return parsed;
      }
    }
  } catch (e) {}
  // 3. Check auth cookie fallback
  try {
    const match = document.cookie.match(/(?:^|;\s*)epic_auth=([^;]*)/);
    if (match) {
      const val = decodeURIComponent(match[1]);
      const params = new URLSearchParams(val.replace(/&/g, '&'));
      const role = params.get('role');
      if (role) {
        return {
          isLoggedIn: true,
          role: role,
          name: params.get('name') || (role === 'admin' ? 'Admin' : 'User'),
          email: params.get('email') || ''
        };
      }
    }
  } catch (e) {}

  return { isLoggedIn: false, role: '', name: '', email: '' };
}

// ============================================================
// HEADER COMPONENT
// ============================================================
function renderHeader(activePage = '') {
  const auth = getActiveAuth();

  // ------------------------------------------------------------
  // SPECIALIZED ADMIN CONTROL TOPBAR (Clean, No Public Nav Links)
  // ------------------------------------------------------------
  if (activePage === 'admin') {
    return `
      <!-- Admin Top Command Bar -->
      <header class="header" role="banner" style="background:var(--bg-primary); border-bottom:1px solid var(--gray-200); box-shadow:var(--shadow-sm); z-index:1000;">
        <div class="header-inner" style="max-width:100%; padding:0 24px; justify-content:space-between;">
          
          <!-- Admin Brand -->
          <div style="display:flex; align-items:center; gap:12px;">
            <a href="/Pages/admin.aspx" class="logo" aria-label="Epic-Travellers Admin Control Panel" style="text-decoration:none;">
              <div class="logo-icon" style="background:linear-gradient(135deg, #0284c7, #0ea5e9);" aria-hidden="true">✈</div>
              <div class="logo-text">
                <span class="logo-name" style="font-size:18px;">Epic-Travellers</span>
                <span class="logo-tagline" style="color:var(--primary); font-weight:700;">Admin Command Center</span>
              </div>
            </a>
          </div>

          <!-- Quick Search Bar -->
          <div class="hide-mobile" style="flex:1; max-width:400px; margin:0 24px;">
            <div style="position:relative; display:flex; align-items:center;">
              <i class="fa-solid fa-magnifying-glass" style="position:absolute; left:12px; color:var(--text-muted); font-size:13px;"></i>
              <input type="text" placeholder="Quick search users, bookings, packages..." 
                style="width:100%; padding:8px 12px 8px 34px; border-radius:999px; border:1px solid var(--gray-300); background:var(--bg-secondary); font-size:13px; outline:none; transition:border-color 0.2s;"
                onfocus="this.style.borderColor='var(--primary)';" onblur="this.style.borderColor='var(--gray-300)';"
                onkeyup="if(event.key==='Enter') Toast.show('Search completed', 'info');">
            </div>
          </div>

          <!-- Right Admin Actions -->
          <div style="display:flex; align-items:center; gap:12px;">
            <!-- Public Site Link -->
            <a href="/Pages/index.aspx" target="_blank" class="btn btn-secondary btn-sm" style="display:inline-flex; align-items:center; gap:6px; font-weight:600;">
              <i class="fa-solid fa-arrow-up-right-from-square"></i> <span class="hide-mobile">Live Website</span>
            </a>

            <!-- Dark / Light Toggle -->
            <button type="button" class="dark-toggle" aria-label="Toggle theme" title="Toggle Light / Dark Mode" style="border:1px solid var(--gray-300); border-radius:var(--radius-md); width:36px; height:36px; display:flex; align-items:center; justify-content:center; cursor:pointer; background:var(--bg-primary);">☀️</button>

            <!-- Administrator Profile Chip -->
            <div style="display:flex; align-items:center; gap:8px; padding:4px 12px 4px 6px; background:rgba(14,165,233,0.08); border:1px solid rgba(14,165,233,0.2); border-radius:999px;">
              <span style="width:26px; height:26px; border-radius:50%; background:linear-gradient(135deg, #0284c7, #0ea5e9); color:white; display:flex; align-items:center; justify-content:center; font-size:12px; font-weight:800;">👑</span>
              <span style="font-size:13px; font-weight:700; color:var(--text-primary);" class="hide-mobile">Admin</span>
            </div>
          </div>

        </div>
      </header>
      <div class="toast-container" role="status" aria-live="polite" aria-atomic="true"></div>
    `;
  }

  // ------------------------------------------------------------
  // STANDARD PUBLIC WEBSITE HEADER
  // ------------------------------------------------------------
  const nav = [
    { label: 'Home', href: '/Pages/index.aspx', id: 'home' },
    {
      label: 'Destinations', href: '/Pages/destinations.aspx', id: 'destinations',
      dropdown: [
        { icon: '🏔️', label: 'Himalayas',        href: '/Pages/destinations.aspx?region=north' },
        { icon: '🏖️', label: 'Beaches',           href: '/Pages/destinations.aspx?search=beaches' },
        { icon: '🏰', label: 'Heritage',          href: '/Pages/destinations.aspx?search=heritage' },
        { icon: '🌿', label: 'Nature &amp; Wildlife', href: '/Pages/destinations.aspx?search=munnar' },
        { icon: '🛕', label: 'Spiritual',         href: '/Pages/destinations.aspx?search=varanasi' },
        { icon: '🗺️', label: 'All Destinations',  href: '/Pages/destinations.aspx' },
      ]
    },
    {
      label: 'Packages', href: '/Pages/packages.aspx', id: 'packages',
      dropdown: [
        { icon: '👨‍👩‍👧', label: 'Family Trips',  href: '/Pages/packages.aspx?type=family' },
        { icon: '💑',    label: 'Honeymoon',     href: '/Pages/packages.aspx?type=honeymoon' },
        { icon: '🧗',    label: 'Adventure',     href: '/Pages/packages.aspx?type=adventure' },
        { icon: '🧳',    label: 'Solo Travel',   href: '/Pages/packages.aspx?type=solo' },
        { icon: '👑',    label: 'Luxury Tours',  href: '/Pages/packages.aspx?type=luxury' },
        { icon: '📦',    label: 'All Packages',  href: '/Pages/packages.aspx' },
      ]
    },
    { label: 'Gallery', href: '/Pages/gallery.aspx', id: 'gallery' },
    { label: 'Blog',    href: '/Pages/blog.aspx',    id: 'blog'    },
    { label: 'About',   href: '/Pages/about.aspx',   id: 'about'   },
    { label: 'Contact', href: '/Pages/contact.aspx', id: 'contact' },
  ];

  const navHTML = nav.map(item => {
    const isActive = activePage === item.id;
    if (item.dropdown) {
      return `
        <li class="nav-item">
          <a href="${item.href}" class="nav-link${isActive ? ' active' : ''}">
            ${item.label}
            <svg class="chevron" xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
              <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
            </svg>
          </a>
          <div class="dropdown" role="menu">
            ${item.dropdown.map(d => `
              <a href="${d.href}" class="dropdown-item" role="menuitem">
                <span class="icon">${d.icon}</span>
                <span>${d.label}</span>
              </a>
            `).join('')}
          </div>
        </li>
      `;
    }
    return `
      <li class="nav-item">
        <a href="${item.href}" class="nav-link${isActive ? ' active' : ''}">${item.label}</a>
      </li>
    `;
  }).join('');

  // Generate Authentication Buttons dynamically (Sign out is exclusively in sidebar)
  let authButtonsHTML = '';
  if (auth.isLoggedIn && auth.role === 'admin') {
    authButtonsHTML = `
      <div class="header-auth-group" style="display:flex; align-items:center; gap:10px;">
        <a href="/Pages/admin.aspx" class="auth-pill-badge" title="Go to Admin Panel" style="display:inline-flex; align-items:center; gap:8px; padding:5px 14px 5px 6px; background:rgba(14,165,233,0.12); border:1px solid rgba(14,165,233,0.3); border-radius:999px; font-size:13px; font-weight:700; color:var(--primary); text-decoration:none; transition:all 0.2s ease; box-shadow:0 2px 8px rgba(14,165,233,0.15);">
          <span style="width:28px; height:28px; border-radius:50%; background:linear-gradient(135deg, #0284c7, #0ea5e9); color:white; display:inline-flex; align-items:center; justify-content:center; font-size:13px; font-weight:800; box-shadow:0 2px 6px rgba(0,0,0,0.15);">🛡️</span>
          <span>Admin</span>
        </a>
        <a href="/Pages/admin.aspx" class="btn btn-secondary btn-sm hide-mobile" aria-label="Admin Control Panel" style="display:inline-flex; align-items:center; gap:6px;">
          <i class="fa-solid fa-gauge-high"></i> <span>Admin Panel</span>
        </a>
      </div>
    `;
  } else if (auth.isLoggedIn && auth.role === 'user') {
    const initial = auth.name ? auth.name.trim().charAt(0).toUpperCase() : 'U';
    const rawName = auth.name ? auth.name.trim() : 'Explorer';
    const displayName = rawName.length > 14 ? rawName.split(' ')[0] : rawName;
    authButtonsHTML = `
      <div class="header-auth-group" style="display:flex; align-items:center; gap:10px;">
        <a href="/Pages/dashboard.aspx" class="auth-pill-badge" title="Go to My Dashboard" style="display:inline-flex; align-items:center; gap:8px; padding:5px 14px 5px 6px; background:rgba(14,165,233,0.1); border:1px solid rgba(14,165,233,0.25); border-radius:999px; font-size:13px; font-weight:700; color:var(--text-primary); text-decoration:none; transition:all 0.2s ease; box-shadow:0 2px 8px rgba(14,165,233,0.1);">
          <span style="width:28px; height:28px; border-radius:50%; background:linear-gradient(135deg, #0ea5e9, #6366f1); color:white; display:inline-flex; align-items:center; justify-content:center; font-size:12px; font-weight:800; box-shadow:0 2px 6px rgba(14,165,233,0.3);">${initial}</span>
          <span style="max-width:130px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">Hi, ${displayName}</span>
        </a>
        <a href="/Pages/dashboard.aspx" class="btn btn-secondary btn-sm hide-mobile" aria-label="My Dashboard" style="display:inline-flex; align-items:center; gap:6px;">
          <i class="fa-solid fa-suitcase"></i> <span>My Dashboard</span>
        </a>
      </div>
    `;
  } else {
    authButtonsHTML = `
      <div class="header-auth-group" style="display:flex; align-items:center; gap:8px;">
        <a href="/Pages/login.aspx" class="btn btn-secondary btn-sm" aria-label="Log in to your account" style="display:inline-flex; align-items:center; gap:5px;">
          <i class="fa-solid fa-arrow-right-to-bracket"></i> Log In
        </a>
        <a href="/Pages/register.aspx" class="btn btn-primary btn-sm" aria-label="Register a new account" style="display:inline-flex; align-items:center; gap:5px;">
          <i class="fa-solid fa-user-plus"></i> Register
        </a>
      </div>
    `;
  }

  return `
    <!-- Page Loader -->
    <div class="page-loader" role="status" aria-label="Loading page" aria-live="polite">
      <div class="loader-content">
        <div class="loader-logo">✈ Epic-Travellers</div>
        <div class="loader-bar"><div class="loader-bar-fill"></div></div>
        <div style="font-size:12px; color:var(--text-muted); letter-spacing:2px; text-transform:uppercase;">Discovering India...</div>
      </div>
    </div>

    <!-- Header -->
    <header class="header" role="banner">
      <div class="header-inner">
        <!-- Logo -->
        <a href="/Pages/index.aspx" class="logo" aria-label="Epic-Travellers — Go to Homepage">
          <div class="logo-icon" aria-hidden="true">✈</div>
          <div class="logo-text">
            <span class="logo-name">Epic-Travellers</span>
            <span class="logo-tagline">Discover Incredible India</span>
          </div>
        </a>

        <!-- Desktop Nav -->
        <nav class="nav" role="navigation" aria-label="Main navigation">
          <ul class="nav" style="list-style:none; margin:0; padding:0;">
            ${navHTML}
          </ul>
        </nav>

        <!-- Header Actions -->
        <div class="header-actions">
          <select class="currency-select" aria-label="Select display currency">
            <option value="INR">₹ INR</option>
            <option value="USD">$ USD</option>
            <option value="EUR">€ EUR</option>
            <option value="GBP">£ GBP</option>
            <option value="AED">AED</option>
          </select>
          <button type="button" class="dark-toggle" aria-label="Toggle theme" title="Current theme: Light">☀️</button>
          ${authButtonsHTML}
        </div>
      </div>
    </header>

    <!-- Toast Container -->
    <div class="toast-container" role="status" aria-live="polite" aria-atomic="true"></div>

    <!-- Back to Top -->
    <button type="button" class="back-to-top" aria-label="Scroll back to top" title="Back to top">
      <i class="fa-solid fa-arrow-up" aria-hidden="true"></i>
    </button>

    <!-- Floating Book Button -->
    <a href="/Pages/packages.aspx" class="floating-book-btn" aria-label="Book a tour now">
      <span aria-hidden="true">🏔️</span> Book a Tour
    </a>
  `;
}

// ============================================================
// FOOTER COMPONENT
// ============================================================
function renderFooter(activePage = '') {
  if (activePage === 'admin') {
    return `
      <footer style="background:#0b1329; border-top:1px solid rgba(255,255,255,0.08); padding:16px 24px; color:rgba(255,255,255,0.5); font-size:12px; display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:12px;">
        <div>© 2025 Epic-Travellers Admin Control Panel • All Systems Operational</div>
        <div style="display:flex; gap:16px; align-items:center;">
          <span style="color:#22C55E; font-weight:600;"><i class="fa-solid fa-shield-halved"></i> Secure TLS 1.3 Node</span>
          <span>Enterprise Edition v2.4</span>
        </div>
      </footer>
    `;
  }

  const auth = getActiveAuth();
  const accountLinks = auth.isLoggedIn
    ? `
      <li><a href="/Pages/dashboard.aspx" class="footer-link">→ My Dashboard</a></li>
      <li><a href="/Pages/packages.aspx"  class="footer-link">→ My Bookings</a></li>
      <li><a href="/Pages/logout.aspx"    class="footer-link" style="color:#ef4444;">→ Sign Out</a></li>
    `
    : `
      <li><a href="/Pages/login.aspx"    class="footer-link">→ Log In / Sign In</a></li>
      <li><a href="/Pages/register.aspx" class="footer-link">→ Create Account / Register</a></li>
      <li><a href="/Pages/dashboard.aspx"class="footer-link">→ My Trips</a></li>
    `;

  return `
    <footer class="footer" role="contentinfo">
      <div class="container">
        <div class="footer-grid">
          <!-- Brand -->
          <div class="footer-brand">
            <div class="footer-logo">
              <div class="footer-logo-icon" aria-hidden="true">✈</div>
              <div>
                <div class="footer-brand-name">Epic-Travellers</div>
                <div class="footer-brand-tagline">Discover Incredible India</div>
              </div>
            </div>
            <p class="footer-description">
              Your trusted travel partner for exploring the wonders of Incredible India.
              From the Himalayas to the beaches, we craft unforgettable experiences.
            </p>
            <div class="footer-socials">
              <a href="https://facebook.com"  class="social-link" aria-label="Follow us on Facebook"   target="_blank" rel="noopener noreferrer">📘</a>
              <a href="https://instagram.com" class="social-link" aria-label="Follow us on Instagram"  target="_blank" rel="noopener noreferrer">📷</a>
              <a href="https://twitter.com"   class="social-link" aria-label="Follow us on Twitter/X"  target="_blank" rel="noopener noreferrer">🐦</a>
              <a href="https://youtube.com"   class="social-link" aria-label="Watch us on YouTube"     target="_blank" rel="noopener noreferrer">▶️</a>
              <a href="https://wa.me/919099107637" class="social-link" aria-label="Chat with us on WhatsApp" target="_blank" rel="noopener noreferrer">💬</a>
            </div>
          </div>

          <!-- Quick Links -->
          <div>
            <h3 class="footer-heading">Quick Links</h3>
            <ul class="footer-links">
              <li><a href="/Pages/index.aspx"         class="footer-link">→ Home</a></li>
              <li><a href="/Pages/about.aspx"        class="footer-link">→ About Us</a></li>
              <li><a href="/Pages/destinations.aspx" class="footer-link">→ Destinations</a></li>
              <li><a href="/Pages/packages.aspx"     class="footer-link">→ Tour Packages</a></li>
              <li><a href="/Pages/gallery.aspx"      class="footer-link">→ Photo Gallery</a></li>
              <li><a href="/Pages/blog.aspx"         class="footer-link">→ Travel Blog</a></li>
              <li><a href="/Pages/contact.aspx"      class="footer-link">→ Contact Us</a></li>
            </ul>
          </div>

          <!-- Popular Destinations -->
          <div>
            <h3 class="footer-heading">Top Destinations</h3>
            <ul class="footer-links">
              <li><a href="/Pages/destinations.aspx?search=Goa" class="footer-link">→ Goa</a></li>
              <li><a href="/Pages/destinations.aspx?search=Kerala" class="footer-link">→ Kerala</a></li>
              <li><a href="/Pages/destinations.aspx?search=Rajasthan" class="footer-link">→ Rajasthan</a></li>
              <li><a href="/Pages/destinations.aspx?search=Ladakh" class="footer-link">→ Ladakh</a></li>
              <li><a href="/Pages/destinations.aspx?search=Manali" class="footer-link">→ Manali</a></li>
              <li><a href="/Pages/destinations.aspx?search=Andaman" class="footer-link">→ Andaman</a></li>
              <li><a href="/Pages/destinations.aspx?search=Varanasi" class="footer-link">→ Varanasi</a></li>
            </ul>
          </div>

          <!-- Account & Support -->
          <div>
            <h3 class="footer-heading">Account & Support</h3>
            <ul class="footer-links">
              ${accountLinks}
              <li><a href="/Pages/contact.aspx"  class="footer-link">→ Help Center</a></li>
              <li><a href="/Pages/contact.aspx"  class="footer-link">→ Terms & Privacy</a></li>
              <li><a href="/Pages/contact.aspx"  class="footer-link">→ Refund Policy</a></li>
            </ul>
          </div>

          <!-- Newsletter -->
          <div>
            <h3 class="footer-heading">Newsletter</h3>
            <p class="footer-newsletter-text">
              Get exclusive deals, travel tips, and destination guides delivered to your inbox.
            </p>
            <form class="footer-newsletter newsletter-form" novalidate aria-label="Newsletter sign-up">
              <input type="email" name="email" placeholder="Enter your email" required aria-label="Email address for newsletter" autocomplete="email">
              <button type="submit" class="btn btn-primary" style="width:100%;" aria-label="Subscribe to newsletter">Subscribe ✈</button>
            </form>
            <div style="margin-top:16px;">
              <div class="footer-badge-title">We accept</div>
              <div style="display:flex; gap:8px; flex-wrap:wrap;">
                <span class="footer-payment-badge">💳 Stripe</span>
                <span class="footer-payment-badge">🅿️ PayPal</span>
                <span class="footer-payment-badge">💸 Razorpay</span>
                <span class="footer-payment-badge">📱 UPI</span>
              </div>
            </div>
          </div>
        </div>

        <!-- Footer Bottom -->
        <div class="footer-bottom">
          <div>© 2025 Epic-Travellers. All rights reserved. Made with ❤️ for Incredible India 🇮🇳</div>
          <div class="footer-bottom-links">
            <a href="/Pages/contact.aspx" class="footer-bottom-link">Privacy</a>
            <a href="/Pages/contact.aspx" class="footer-bottom-link">Terms</a>
            <a href="/Pages/sitemap.aspx" class="footer-bottom-link">Sitemap</a>
            <a href="/Pages/contact.aspx" class="footer-bottom-link">Cookies</a>
          </div>
        </div>
      </div>
    </footer>
  `;
}

// ============================================================
// INJECT COMPONENTS
// ============================================================
document.addEventListener('DOMContentLoaded', () => {
  let activePage = document.body.dataset.page || '';
  if (!activePage) {
    const path = window.location.pathname.toLowerCase();
    if (path.includes('admin.aspx')) activePage = 'admin';
    else if (path.includes('destinations.aspx')) activePage = 'destinations';
    else if (path.includes('packages.aspx') || path.includes('package-details.aspx')) activePage = 'packages';
    else if (path.includes('gallery.aspx')) activePage = 'gallery';
    else if (path.includes('blog.aspx') || path.includes('blog-details.aspx')) activePage = 'blog';
    else if (path.includes('about.aspx')) activePage = 'about';
    else if (path.includes('contact.aspx')) activePage = 'contact';
    else if (path.includes('dashboard.aspx')) activePage = 'dashboard';
    else if (path.includes('login.aspx')) activePage = 'login';
    else if (path.includes('register.aspx')) activePage = 'register';
    else if (path.includes('index.aspx') || path === '/' || path.endsWith('/pages/')) activePage = 'home';
  }

  // Inject Header
  const headerTarget = document.getElementById('header-placeholder');
  if (headerTarget) {
    headerTarget.innerHTML = renderHeader(activePage);
  }

  // Inject Footer
  const footerTarget = document.getElementById('footer-placeholder');
  if (footerTarget) {
    footerTarget.innerHTML = renderFooter(activePage);
  }
});
