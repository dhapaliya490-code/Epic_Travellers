/* ============================================================
   EPIC-TRAVELLERS - Shared Components (Header + Footer)
   Injected into every page via JavaScript
   ============================================================ */

'use strict';

// ============================================================
// HEADER COMPONENT
// ============================================================
function renderHeader(activePage = '') {
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
          <button class="dark-toggle" aria-label="Switch to dark mode" title="Toggle dark mode">🌙</button>
          <a href="/Pages/dashboard.aspx" class="btn btn-secondary btn-sm hide-mobile" aria-label="My Dashboard">My Trips</a>
          <a href="/Pages/login.aspx" class="btn btn-secondary btn-sm" aria-label="Log in to your account">Log In</a>
          <a href="/Pages/register.aspx" class="btn btn-primary btn-sm" aria-label="Register a new account">Register</a>
        </div>
      </div>
    </header>

    <!-- Toast Container -->
    <div class="toast-container" role="status" aria-live="polite" aria-atomic="true"></div>

    <!-- Back to Top -->
    <button class="back-to-top" aria-label="Scroll back to top" title="Back to top">
      <i class="fa-solid fa-arrow-up" aria-hidden="true"></i>
    </button>

    <!-- Floating Book Button -->
    <a href="/Pages/packages.aspx" class="floating-book-btn" aria-label="Book a tour now">
      <span aria-hidden="true">🏔️</span> Book a Tour
    </a>

    <!-- Live Chat Bubble -->
    <div style="position:fixed; bottom:90px; left:24px; z-index:var(--z-fixed);">
      <button class="chat-bubble" aria-label="Open live chat" aria-expanded="false" aria-controls="chat-window" style="
        width:52px; height:52px; border-radius:50%;
        background:var(--gradient-primary); color:white;
        border:none; font-size:22px; cursor:pointer;
        box-shadow:var(--shadow-lg); transition:var(--transition-bounce);
        animation: pulseShadow 2s ease-in-out infinite;
      ">💬</button>
      <div class="chat-window" id="chat-window" role="dialog" aria-label="Live support chat" aria-hidden="true" style="
        position:absolute; bottom:64px; left:0;
        width:300px; background:var(--bg-primary);
        border-radius:var(--radius-xl); box-shadow:var(--shadow-xl);
        border:1px solid var(--gray-200); overflow:hidden;
        display:none; flex-direction:column;
      ">
        <div style="padding:16px; background:var(--gradient-primary); color:white;">
          <div style="font-weight:700; font-size:15px;">💬 Live Support</div>
          <div style="font-size:12px; opacity:0.85;">We typically reply in minutes</div>
        </div>
        <div class="chat-messages" style="height:200px; overflow-y:auto; padding:12px; display:flex; flex-direction:column; gap:8px;" aria-live="polite">
          <div class="chat-msg bot" style="background:var(--gray-100); padding:10px 12px; border-radius:var(--radius-md) var(--radius-md) var(--radius-md) 0; font-size:13px; max-width:85%; color:var(--text-primary);">
            🤖 Hi! Welcome to Epic-Travellers! How can I help you plan your trip to India? 🇮🇳
          </div>
        </div>
        <div style="padding:12px; border-top:1px solid var(--gray-200); display:flex; gap:8px;">
          <input class="chat-input form-control" placeholder="Type a message..." style="flex:1; padding:8px 12px; font-size:13px;" aria-label="Chat message">
          <button class="chat-send btn btn-primary btn-sm" style="padding:8px 14px;" aria-label="Send message">➤</button>
        </div>
      </div>
    </div>

    <style>
      @keyframes pulseShadow {
        0%, 100% { box-shadow: var(--shadow-lg), 0 0 0 0 rgba(14,165,233,0.4); }
        50% { box-shadow: var(--shadow-lg), 0 0 0 10px rgba(14,165,233,0); }
      }
    </style>
  `;
}

// ============================================================
// FOOTER COMPONENT
// ============================================================
function renderFooter() {
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
                <div style="font-size:11px; letter-spacing:2px; color:rgba(255,255,255,0.4); text-transform:uppercase;">Discover Incredible India</div>
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
              <a href="https://wa.me/919876543210" class="social-link" aria-label="Chat with us on WhatsApp" target="_blank" rel="noopener noreferrer">💬</a>
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
              <li><a href="/Pages/login.aspx"    class="footer-link">→ Log In / Sign In</a></li>
              <li><a href="/Pages/register.aspx" class="footer-link">→ Create Account / Register</a></li>
              <li><a href="/Pages/dashboard.aspx"class="footer-link">→ My Dashboard</a></li>
              <li><a href="/Pages/contact.aspx"  class="footer-link">→ Help Center</a></li>
              <li><a href="/Pages/contact.aspx"  class="footer-link">→ Terms & Privacy</a></li>
              <li><a href="/Pages/contact.aspx"  class="footer-link">→ Refund Policy</a></li>
            </ul>
          </div>

          <!-- Newsletter -->
          <div>
            <h3 class="footer-heading">Newsletter</h3>
            <p style="font-size:14px; color:rgba(255,255,255,0.6); margin-bottom:16px; line-height:1.7;">
              Get exclusive deals, travel tips, and destination guides delivered to your inbox.
            </p>
            <form class="footer-newsletter newsletter-form" novalidate aria-label="Newsletter sign-up">
              <input type="email" name="email" placeholder="Enter your email" required aria-label="Email address for newsletter" autocomplete="email">
              <button type="submit" class="btn btn-primary" style="width:100%;" aria-label="Subscribe to newsletter">Subscribe ✈</button>
            </form>
            <div style="margin-top:16px;">
              <div style="font-size:12px; color:rgba(255,255,255,0.4); margin-bottom:8px; text-transform:uppercase; letter-spacing:1px;">We accept</div>
              <div style="display:flex; gap:8px; flex-wrap:wrap;">
                <span style="padding:4px 10px; background:rgba(255,255,255,0.08); border-radius:4px; font-size:12px; color:rgba(255,255,255,0.7);">💳 Stripe</span>
                <span style="padding:4px 10px; background:rgba(255,255,255,0.08); border-radius:4px; font-size:12px; color:rgba(255,255,255,0.7);">🅿️ PayPal</span>
                <span style="padding:4px 10px; background:rgba(255,255,255,0.08); border-radius:4px; font-size:12px; color:rgba(255,255,255,0.7);">💸 Razorpay</span>
                <span style="padding:4px 10px; background:rgba(255,255,255,0.08); border-radius:4px; font-size:12px; color:rgba(255,255,255,0.7);">📱 UPI</span>
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
  // Inject Header
  const headerTarget = document.getElementById('header-placeholder');
  if (headerTarget) {
    let activePage = document.body.dataset.page || '';
    if (!activePage) {
      const path = window.location.pathname.toLowerCase();
      if (path.includes('destinations.aspx')) activePage = 'destinations';
      else if (path.includes('packages.aspx')) activePage = 'packages';
      else if (path.includes('gallery.aspx')) activePage = 'gallery';
      else if (path.includes('blog.aspx')) activePage = 'blog';
      else if (path.includes('about.aspx')) activePage = 'about';
      else if (path.includes('contact.aspx')) activePage = 'contact';
      else if (path.includes('dashboard.aspx')) activePage = 'dashboard';
      else if (path.includes('login.aspx')) activePage = 'login';
      else if (path.includes('register.aspx')) activePage = 'register';
      else if (path.includes('index.aspx') || path === '/' || path.endsWith('/pages/')) activePage = 'home';
    }
    headerTarget.innerHTML = renderHeader(activePage);
  }

  // Inject Footer
  const footerTarget = document.getElementById('footer-placeholder');
  if (footerTarget) {
    footerTarget.innerHTML = renderFooter();
  }

  // Wire up chat bubble toggle (after injection)
  document.addEventListener('click', (e) => {
    const chatBtn = e.target.closest('.chat-bubble');
    if (chatBtn) {
      const win = document.getElementById('chat-window');
      if (!win) return;
      const isOpen = win.style.display === 'flex';
      win.style.display = isOpen ? 'none' : 'flex';
      chatBtn.setAttribute('aria-expanded', String(!isOpen));
      win.setAttribute('aria-hidden', String(isOpen));
    }
  });
});
