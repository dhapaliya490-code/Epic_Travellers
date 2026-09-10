/* ============================================================
   EPIC-TRAVELLERS - Main JavaScript
   Core Functionality: Dark Mode, Navigation, Scroll Animations,
   Hero Slider, Counters, Wishlist, Notifications, etc.
   ============================================================ */

'use strict';

// ============================================================
// DARK MODE
// ============================================================
const DarkMode = {
  key: 'epic-theme',

  init() {
    const saved = localStorage.getItem(this.key) || 'light';
    this.apply(saved);
    document.querySelectorAll('.dark-toggle').forEach(btn => {
      btn.addEventListener('click', () => this.toggle());
    });
  },

  apply(theme) {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem(this.key, theme);
    document.querySelectorAll('.dark-toggle').forEach(btn => {
      btn.innerHTML = theme === 'dark' ? '☀️' : '🌙';
      btn.setAttribute('aria-label', theme === 'dark' ? 'Switch to light mode' : 'Switch to dark mode');
    });
  },

  toggle() {
    const current = document.documentElement.getAttribute('data-theme');
    this.apply(current === 'dark' ? 'light' : 'dark');
  }
};

// ============================================================
// NAVIGATION
// ============================================================
const Navigation = {
  header: null,
  menuToggle: null,
  mobileNav: null,

  init() {
    this.header = document.querySelector('.header');
    this.menuToggle = document.querySelector('.menu-toggle');
    this.mobileNav = document.querySelector('.mobile-nav');

    this.handleScroll();
    window.addEventListener('scroll', () => this.handleScroll(), { passive: true });

    if (this.menuToggle) {
      this.menuToggle.addEventListener('click', () => this.toggleMobile());
    }

    // Close mobile nav on outside click
    document.addEventListener('click', (e) => {
      if (this.mobileNav && !this.mobileNav.contains(e.target) && !this.menuToggle?.contains(e.target)) {
        this.closeMobile();
      }
    });

    // Close mobile nav when a mobile nav item is clicked
    document.querySelectorAll('.mobile-nav-item').forEach(link => {
      link.addEventListener('click', () => this.closeMobile());
    });

    this.setActiveLink();
  },

  handleScroll() {
    if (!this.header) return;
    if (window.scrollY > 20) {
      this.header.classList.add('scrolled');
    } else {
      this.header.classList.remove('scrolled');
    }
  },

  toggleMobile() {
    const isOpen = this.mobileNav?.classList.contains('open');
    if (isOpen) {
      this.closeMobile();
    } else {
      this.openMobile();
    }
  },

  openMobile() {
    this.mobileNav?.classList.add('open');
    this.menuToggle?.classList.add('open');
    this.menuToggle?.setAttribute('aria-expanded', 'true');
    document.body.style.overflow = 'hidden';
  },

  closeMobile() {
    this.mobileNav?.classList.remove('open');
    this.menuToggle?.classList.remove('open');
    this.menuToggle?.setAttribute('aria-expanded', 'false');
    document.body.style.overflow = '';
  },

  setActiveLink() {
    const hash = window.location.hash || '#page-home';
    document.querySelectorAll('.nav-link, .mobile-nav-item, .footer-link').forEach(link => {
      const href = (link.getAttribute('href') || '').split('?')[0];
      if (href === hash) {
        link.classList.add('active');
      } else {
        link.classList.remove('active');
      }
    });
  }
};

// ============================================================
// HERO SLIDER
// ============================================================
const HeroSlider = {
  slides: [],
  dots: [],
  current: 0,
  interval: null,
  duration: 5000,

  init() {
    this.slides = document.querySelectorAll('.hero-slide');
    this.dots   = document.querySelectorAll('.slider-dot');
    if (this.slides.length < 2) return;

    this.show(0);
    this.startAuto();

    this.dots.forEach((dot, i) => {
      dot.addEventListener('click', () => {
        this.show(i);
        this.resetAuto();
      });
    });

    // Swipe support
    let startX = 0;
    const heroEl = document.querySelector('.hero');
    if (heroEl) {
      heroEl.addEventListener('touchstart', e => { startX = e.touches[0].clientX; }, { passive: true });
      heroEl.addEventListener('touchend', e => {
        const diff = startX - e.changedTouches[0].clientX;
        if (Math.abs(diff) > 50) {
          diff > 0 ? this.next() : this.prev();
          this.resetAuto();
        }
      }, { passive: true });
    }
  },

  show(index) {
    this.slides.forEach((s, i) => s.classList.toggle('active', i === index));
    this.dots.forEach((d, i) => d.classList.toggle('active', i === index));
    this.current = index;
  },

  next() { this.show((this.current + 1) % this.slides.length); },
  prev() { this.show((this.current - 1 + this.slides.length) % this.slides.length); },

  startAuto() { this.interval = setInterval(() => this.next(), this.duration); },
  resetAuto() { clearInterval(this.interval); this.startAuto(); }
};

// ============================================================
// SCROLL ANIMATIONS (IntersectionObserver)
// ============================================================
const ScrollAnimations = {
  observer: null,

  init() {
    const selector = '.anim-fade-up, .anim-fade-down, .anim-fade-left, .anim-fade-right, .anim-scale, .anim-fade';
    const elements = document.querySelectorAll(selector);
    if (!elements.length) return;

    this.observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');
          this.observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.10, rootMargin: '0px 0px -40px 0px' });

    elements.forEach(el => this.observer.observe(el));
  },

  // Re-observe newly visible elements (called after SPA page switch)
  refresh() {
    const selector = '.anim-fade-up:not(.visible), .anim-fade-down:not(.visible), .anim-fade-left:not(.visible), .anim-fade-right:not(.visible), .anim-scale:not(.visible), .anim-fade:not(.visible)';
    const elements = document.querySelectorAll(selector);
    if (!elements.length || !this.observer) return;
    elements.forEach(el => this.observer.observe(el));
  }
};

// ============================================================
// COUNTER ANIMATION
// ============================================================
const CounterAnimation = {
  observer: null,

  init() {
    const counters = document.querySelectorAll('[data-counter]');
    if (!counters.length) return;

    this.observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          this.animateCounter(entry.target);
          this.observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.5 });

    counters.forEach(el => this.observer.observe(el));
  },

  animateCounter(el) {
    const target   = parseFloat(el.getAttribute('data-counter'));
    const suffix   = el.getAttribute('data-suffix') || '';
    const prefix   = el.getAttribute('data-prefix') || '';
    const duration = 2000;
    const start    = performance.now();

    const update = (timestamp) => {
      const elapsed  = timestamp - start;
      const progress = Math.min(elapsed / duration, 1);
      const eased    = 1 - Math.pow(1 - progress, 3);
      const current  = eased * target;

      if (Number.isInteger(target)) {
        el.textContent = prefix + Math.round(current).toLocaleString() + suffix;
      } else {
        el.textContent = prefix + current.toFixed(1) + suffix;
      }

      if (progress < 1) requestAnimationFrame(update);
    };

    requestAnimationFrame(update);
  }
};

// ============================================================
// WISHLIST
// ============================================================
const Wishlist = {
  key: 'epic-wishlist',

  init() {
    document.querySelectorAll('.wishlist-btn, .destination-card-wishlist').forEach(btn => {
      const id = btn.dataset.id;
      if (this.isWishlisted(id)) btn.classList.add('active');
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        this.toggle(btn, id);
      });
    });
  },

  getAll() {
    try { return JSON.parse(localStorage.getItem(this.key) || '[]'); }
    catch { return []; }
  },

  isWishlisted(id) { return this.getAll().includes(id); },

  toggle(btn, id) {
    const list = this.getAll();
    const idx  = list.indexOf(id);
    if (idx > -1) {
      list.splice(idx, 1);
      btn.classList.remove('active');
      btn.innerHTML = '<i class="fa-regular fa-heart"></i>';
      Toast.show('Removed from wishlist', 'info');
    } else {
      list.push(id);
      btn.classList.add('active');
      btn.innerHTML = '<i class="fa-solid fa-heart"></i>';
      Toast.show('Added to wishlist! ❤️', 'success');
    }
    localStorage.setItem(this.key, JSON.stringify(list));
  }
};

// ============================================================
// TOAST NOTIFICATIONS
// ============================================================
const Toast = {
  container: null,

  init() {
    this.container = document.querySelector('.toast-container');
    if (!this.container) {
      this.container = document.createElement('div');
      this.container.className = 'toast-container';
      this.container.setAttribute('role', 'status');
      this.container.setAttribute('aria-live', 'polite');
      document.body.appendChild(this.container);
    }
  },

  show(message, type = 'info', duration = 3500) {
    if (!this.container) this.init();
    const icons = { success: '✅', error: '❌', warning: '⚠️', info: 'ℹ️' };
    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.innerHTML = `<span aria-hidden="true">${icons[type] || 'ℹ️'}</span><span>${message}</span>`;
    this.container.appendChild(toast);

    setTimeout(() => {
      toast.style.opacity = '0';
      toast.style.transform = 'translateX(100%)';
      toast.style.transition = 'all 0.4s ease';
      setTimeout(() => toast.remove(), 400);
    }, duration);
  }
};

// ============================================================
// BACK TO TOP
// ============================================================
const BackToTop = {
  btn: null,

  init() {
    this.btn = document.querySelector('.back-to-top');
    if (!this.btn) return;

    window.addEventListener('scroll', () => {
      this.btn.classList.toggle('visible', window.scrollY > 400);
    }, { passive: true });

    this.btn.addEventListener('click', () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }
};

// ============================================================
// PAGE LOADER
// ============================================================
const PageLoader = {
  init() {
    const loader = document.querySelector('.page-loader');
    if (!loader) return;

    window.addEventListener('load', () => {
      setTimeout(() => {
        loader.classList.add('hidden');
        setTimeout(() => loader.remove(), 500);
      }, 800);
    });
  }
};

// ============================================================
// SEARCH FUNCTIONALITY
// ============================================================
const Search = {
  init() {
    const searchInputs = document.querySelectorAll('.hero-search-input, .search-input[data-live-search]');
    searchInputs.forEach(input => {
      input.addEventListener('input', (e) => this.handleInput(e.target));
      input.addEventListener('keydown', (e) => {
        if (e.key === 'Enter') this.handleSubmit(input.value);
      });
    });

    // Close suggestions on outside click
    document.addEventListener('click', (e) => {
      if (!e.target.closest('.search-field')) {
        document.querySelectorAll('.search-suggestions').forEach(s => s.remove());
      }
    });
  },

  popularDestinations: [
    'Goa', 'Kerala', 'Rajasthan', 'Manali', 'Ladakh', 'Rishikesh',
    'Jaipur', 'Udaipur', 'Shimla', 'Ooty', 'Coorg', 'Andaman',
    'Varanasi', 'Agra', 'Darjeeling', 'Munnar', 'Kodaikanal',
    'Jaisalmer', 'Hampi', 'Mysore', 'Spiti Valley', 'Nainital'
  ],

  handleInput(input) {
    const query = input.value.toLowerCase().trim();
    let suggestions = input.parentElement.querySelector('.search-suggestions');

    if (!query) {
      suggestions?.remove();
      return;
    }

    const matches = this.popularDestinations.filter(d => d.toLowerCase().includes(query));
    if (!matches.length) { suggestions?.remove(); return; }

    if (!suggestions) {
      suggestions = document.createElement('div');
      suggestions.className = 'search-suggestions';
      suggestions.setAttribute('role', 'listbox');
      suggestions.style.cssText = `
        position: absolute; top: 100%; left: 0; right: 0;
        background: var(--bg-primary); border-radius: var(--radius-lg);
        box-shadow: var(--shadow-xl); padding: 8px; margin-top: 4px;
        z-index: 1000; max-height: 280px; overflow-y: auto;
        border: 1px solid var(--gray-200);
      `;
      input.parentElement.style.position = 'relative';
      input.parentElement.appendChild(suggestions);
    }

    suggestions.innerHTML = matches.slice(0, 6).map((m, i) => `
      <div class="suggestion-item" role="option" tabindex="0" data-index="${i}" style="
        padding: 10px 14px; border-radius: var(--radius-md);
        cursor: pointer; font-size: 14px; color: var(--text-primary);
        display: flex; align-items: center; gap: 10px;
        transition: background 0.2s;
      ">
        <i class="fa-solid fa-location-dot" style="color: var(--primary); font-size: 12px;" aria-hidden="true"></i>
        ${m}
      </div>
    `).join('');

    suggestions.querySelectorAll('.suggestion-item').forEach((item, i) => {
      item.addEventListener('mouseover', () => { item.style.background = 'rgba(14,165,233,0.08)'; });
      item.addEventListener('mouseout',  () => { item.style.background = ''; });
      item.addEventListener('click', () => {
        input.value = matches[i];
        suggestions.remove();
        this.handleSubmit(matches[i]);
      });
    });
  },

  handleSubmit(query) {
    if (query.trim()) {
      // Navigate to destinations SPA page and let the filter handle it
      const searchInput = document.getElementById('filter-search');
      if (searchInput) {
        searchInput.value = query;
        if (typeof applyDestFilters === 'function') applyDestFilters();
      }
      window.location.hash = '#page-destinations';
    }
  }
};

// ============================================================
// TABS
// ============================================================
const Tabs = {
  init() {
    document.querySelectorAll('.tabs').forEach(tabGroup => {
      const tabs = tabGroup.querySelectorAll('.tab');
      tabs.forEach(tab => {
        tab.addEventListener('click', () => {
          tabs.forEach(t => {
            t.classList.remove('active');
            t.setAttribute('aria-selected', 'false');
          });
          tab.classList.add('active');
          tab.setAttribute('aria-selected', 'true');

          const target = tab.dataset.tab;
          if (target) {
            document.querySelectorAll('.tab-content').forEach(content => {
              const isTarget = content.id === target;
              content.classList.toggle('active', isTarget);
              content.style.display = isTarget ? 'block' : 'none';
            });
          }
        });
      });
    });
  }
};

// ============================================================
// ACCORDION (FAQ)
// ============================================================
const Accordion = {
  init() {
    document.querySelectorAll('.accordion-header').forEach(header => {
      header.addEventListener('click', () => {
        const item = header.closest('.accordion-item');
        const body = item.querySelector('.accordion-body');
        const isOpen = item.classList.contains('open');

        // Close all
        document.querySelectorAll('.accordion-item.open').forEach(openItem => {
          openItem.classList.remove('open');
          const b = openItem.querySelector('.accordion-body');
          if (b) b.style.maxHeight = '0';
        });

        // Open clicked (if was closed)
        if (!isOpen) {
          item.classList.add('open');
          if (body) body.style.maxHeight = body.scrollHeight + 'px';
        }
      });
    });
  }
};

// ============================================================
// FILTERS
// ============================================================
const Filters = {
  init() {
    const filterBtns    = document.querySelectorAll('[data-filter]');
    const filterTargets = document.querySelectorAll('[data-category]');

    filterBtns.forEach(btn => {
      btn.addEventListener('click', () => {
        filterBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');

        const filter = btn.dataset.filter;

        filterTargets.forEach(target => {
          const cats  = (target.dataset.category || '').split(' ');
          const match = filter === 'all' || cats.includes(filter);
          target.style.opacity   = '0';
          target.style.transform = 'scale(0.95)';

          setTimeout(() => {
            target.style.display = match ? '' : 'none';
            if (match) {
              setTimeout(() => {
                target.style.opacity   = '1';
                target.style.transform = 'scale(1)';
              }, 50);
            }
          }, 150);
        });
      });
    });
  }
};

// ============================================================
// CURRENCY CONVERTER
// ============================================================
const Currency = {
  key: 'epic-currency',
  rates: {
    INR: 1,
    USD: 0.012,
    EUR: 0.011,
    GBP: 0.0095,
    AED: 0.044
  },
  symbols: { INR: '₹', USD: '$', EUR: '€', GBP: '£', AED: 'AED' },
  current: 'INR',

  init() {
    this.current = localStorage.getItem(this.key) || 'INR';
    document.querySelectorAll('.currency-select').forEach(sel => {
      sel.value = this.current;
      sel.addEventListener('change', (e) => this.set(e.target.value));
    });
    this.updatePrices();
  },

  set(currency) {
    this.current = currency;
    localStorage.setItem(this.key, currency);
    document.querySelectorAll('.currency-select').forEach(sel => sel.value = currency);
    this.updatePrices();
  },

  convert(amountINR) {
    return (amountINR * (this.rates[this.current] || 1)).toFixed(0);
  },

  format(amountINR) {
    const converted = this.convert(amountINR);
    const num = parseInt(converted).toLocaleString();
    return `${this.symbols[this.current] || ''}${num}`;
  },

  updatePrices() {
    document.querySelectorAll('[data-price-inr]').forEach(el => {
      const inr = parseFloat(el.dataset.priceInr);
      el.textContent = this.format(inr);
    });
  }
};

// ============================================================
// BOOKING FORM
// ============================================================
const BookingForm = {
  init() {
    const forms = document.querySelectorAll('.booking-form');
    forms.forEach(form => {
      form.addEventListener('submit', (e) => {
        e.preventDefault();
        if (this.validate(form)) {
          this.handleSubmit(form);
        }
      });
    });

    // Date pickers min date
    document.querySelectorAll('input[type="date"]').forEach(input => {
      input.min = new Date().toISOString().split('T')[0];
    });
  },

  validate(form) {
    let valid = true;
    form.querySelectorAll('[required]').forEach(field => {
      if (!field.value.trim()) {
        field.style.borderColor = '#EF4444';
        field.setAttribute('aria-invalid', 'true');
        valid = false;
        field.addEventListener('input', () => {
          field.style.borderColor = '';
          field.removeAttribute('aria-invalid');
        }, { once: true });
      }
    });
    if (!valid) Toast.show('Please fill in all required fields.', 'warning');
    return valid;
  },

  handleSubmit(form) {
    const btn = form.querySelector('[type="submit"]');

    if (btn) {
      btn.disabled = true;
      btn.innerHTML = '<i class="fa-solid fa-spinner" style="animation:spin 1s linear infinite"></i> Processing...';
    }

    // Simulate API call
    setTimeout(() => {
      if (btn) {
        btn.disabled = false;
        btn.innerHTML = form.dataset.submitLabel || 'Submit';
      }
      Toast.show('Request sent! We\'ll confirm within 2 hours. 🎉', 'success', 5000);
      form.reset();
      const modal = document.querySelector('#booking-modal');
      if (modal) modal.classList.remove('open');
    }, 2000);
  }
};

// ============================================================
// CONTACT FORM
// ============================================================
const ContactForm = {
  init() {
    const form = document.querySelector('#contact-form');
    if (!form) return;

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      if (!BookingForm.validate(form)) return;

      const btn = form.querySelector('[type="submit"]');
      if (btn) {
        btn.disabled = true;
        btn.innerHTML = '<i class="fa-solid fa-spinner" style="animation:spin 1s linear infinite"></i> Sending...';
      }

      setTimeout(() => {
        if (btn) {
          btn.disabled = false;
          btn.innerHTML = 'Send Message';
        }
        Toast.show('Message sent! We\'ll get back to you within 24 hours. 📩', 'success', 5000);
        form.reset();
      }, 1500);
    });
  }
};

// ============================================================
// NEWSLETTER FORM
// ============================================================
const Newsletter = {
  init() {
    document.querySelectorAll('.newsletter-form').forEach(form => {
      form.addEventListener('submit', (e) => {
        e.preventDefault();
        const emailEl = form.querySelector('input[type="email"]');
        const email   = emailEl?.value.trim();

        if (!email) {
          Toast.show('Please enter a valid email address.', 'warning');
          emailEl?.focus();
          return;
        }

        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
          Toast.show('Please enter a valid email address.', 'warning');
          emailEl?.focus();
          return;
        }

        Toast.show('Welcome aboard! 🌏 You\'re now subscribed to Epic-Travellers.', 'success', 4000);
        form.reset();
      });
    });
  }
};

// ============================================================
// LAZY LOADING IMAGES
// ============================================================
const LazyLoad = {
  init() {
    const images = document.querySelectorAll('img[data-src]');
    if (!images.length) return;

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const img = entry.target;
          img.src = img.dataset.src;
          img.removeAttribute('data-src');
          observer.unobserve(img);
        }
      });
    }, { rootMargin: '200px' });

    images.forEach(img => observer.observe(img));
  }
};

// ============================================================
// READING PROGRESS BAR
// ============================================================
const ReadingProgress = {
  init() {
    if (document.querySelector('.reading-progress-bar')) return;

    const bar = document.createElement('div');
    bar.className = 'reading-progress-bar';
    bar.setAttribute('role', 'progressbar');
    bar.setAttribute('aria-label', 'Page reading progress');
    bar.style.cssText = `
      position: fixed; top: var(--header-height); left: 0; height: 3px;
      background: var(--gradient-primary); z-index: var(--z-sticky);
      width: 0%; transition: width 0.1s linear; pointer-events: none;
    `;
    document.body.appendChild(bar);

    window.addEventListener('scroll', () => {
      const total    = document.documentElement.scrollHeight - window.innerHeight;
      const progress = total > 0 ? (window.scrollY / total) * 100 : 0;
      bar.style.width = `${Math.min(progress, 100)}%`;
      bar.setAttribute('aria-valuenow', Math.round(progress));
    }, { passive: true });
  }
};

// ============================================================
// MODAL
// ============================================================
const Modal = {
  init() {
    // Open modals
    document.querySelectorAll('[data-modal]').forEach(trigger => {
      trigger.addEventListener('click', (e) => {
        e.preventDefault();
        const id = trigger.dataset.modal;
        this.open(id);
      });
    });

    // Close buttons
    document.querySelectorAll('[data-modal-close], .modal-close').forEach(btn => {
      btn.addEventListener('click', () => this.closeAll());
    });

    // Backdrop click
    document.querySelectorAll('.modal-backdrop').forEach(backdrop => {
      backdrop.addEventListener('click', () => this.closeAll());
    });

    // ESC key
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') this.closeAll();
    });
  },

  open(id) {
    const modal = document.getElementById(id);
    if (modal) {
      modal.classList.add('open');
      document.body.style.overflow = 'hidden';
    }
  },

  closeAll() {
    document.querySelectorAll('.modal.open').forEach(m => m.classList.remove('open'));
    document.body.style.overflow = '';
  }
};

// ============================================================
// SMOOTH SCROLL (for in-page anchors only)
// ============================================================
const SmoothScroll = {
  init() {
    document.querySelectorAll('a[href^="#"]').forEach(link => {
      link.addEventListener('click', (e) => {
        const href = link.getAttribute('href');
        // SPA page links are handled by the SPA router — skip them
        if (href.startsWith('#page-') || href === '#') return;
        const target = document.querySelector(href);
        if (target) {
          e.preventDefault();
          const offset = 90;
          const top = target.getBoundingClientRect().top + window.scrollY - offset;
          window.scrollTo({ top, behavior: 'smooth' });
        }
      });
    });
  }
};

// ============================================================
// AI TRIP PLANNER (Simulated)
// ============================================================
const AITripPlanner = {
  destinations: {
    beach:    ['Goa', 'Andaman & Nicobar', 'Kovalam (Kerala)', 'Puri (Odisha)'],
    mountains:['Manali', 'Ladakh', 'Shimla', 'Darjeeling', 'Ooty'],
    heritage: ['Jaipur', 'Agra', 'Varanasi', 'Hampi', 'Mysore'],
    adventure:['Rishikesh', 'Auli', 'Spiti Valley', 'Meghalaya'],
    nature:   ['Munnar', 'Coorg', 'Wayanad', 'Jim Corbett', 'Kaziranga'],
    spiritual:['Varanasi', 'Rishikesh', 'Tirupati', 'Vrindavan', 'Amritsar']
  },

  init() {
    const form = document.querySelector('#ai-planner-form');
    if (!form) return;

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      this.generate(form);
    });
  },

  generate(form) {
    const budget    = parseFloat(form.querySelector('[name="budget"]')?.value || 0);
    const duration  = parseInt(form.querySelector('[name="duration"]')?.value || 0);
    const type      = form.querySelector('[name="type"]')?.value || 'beach';
    const travelers = parseInt(form.querySelector('[name="travelers"]')?.value || 1);

    if (!budget || !duration) {
      Toast.show('Please fill in all fields.', 'warning');
      return;
    }

    const dests    = this.destinations[type] || this.destinations.beach;
    const count    = duration > 7 ? 3 : 2;
    const selected = dests.slice(0, Math.min(count, dests.length));

    const result = document.querySelector('#ai-planner-result');
    if (result) {
      result.innerHTML = `
        <div class="ai-result glass-card" style="padding: 24px; margin-top: 20px; background: var(--bg-secondary); border-radius: var(--radius-xl); border: 1px solid var(--gray-200);">
          <div style="display:flex; align-items:center; gap:10px; margin-bottom:16px;">
            <span style="font-size:24px;" aria-hidden="true">🤖</span>
            <h4 style="color:var(--text-primary); font-size:17px;">Your Personalized Trip Plan</h4>
          </div>
          <p style="color:var(--text-secondary); font-size:14px; margin-bottom:16px;">
            Based on your preferences: <strong>${duration} days</strong>, <strong>${travelers} traveler(s)</strong>,
            Budget: <strong>₹${budget.toLocaleString()}</strong>
          </p>
          <div style="display:flex; flex-direction:column; gap:12px;">
            ${selected.map((dest, i) => `
              <div style="display:flex; align-items:center; gap:12px; padding:12px; background:var(--bg-primary); border-radius:var(--radius-md); border:1px solid var(--gray-200);">
                <span style="width:28px; height:28px; background:var(--gradient-primary); border-radius:50%; display:flex; align-items:center; justify-content:center; color:white; font-size:12px; font-weight:700; flex-shrink:0;" aria-hidden="true">${i+1}</span>
                <div>
                  <strong style="color:var(--text-primary); font-size:15px;">${dest}</strong>
                  <div style="font-size:12px; color:var(--text-muted);">Recommended: ${Math.ceil(duration / selected.length)} days</div>
                </div>
              </div>
            `).join('')}
          </div>
          <div style="margin-top:16px; padding:12px; background:rgba(14,165,233,0.08); border-radius:var(--radius-md); font-size:13px; color:var(--primary);">
            💡 Estimated cost per person: ₹${Math.round(budget / travelers).toLocaleString()} | Best time: October - March
          </div>
          <a href="#page-packages" class="btn btn-primary mt-16" style="width:100%; margin-top:16px; display:flex; justify-content:center;">
            View Matching Packages <i class="fa-solid fa-arrow-right" aria-hidden="true"></i>
          </a>
        </div>
      `;
    }

    Toast.show('AI Trip Plan generated! ✨', 'success');
  }
};

// ============================================================
// CURRENCY CONVERTER WIDGET
// ============================================================
const CurrencyWidget = {
  init() {
    const widget = document.querySelector('#currency-converter');
    if (!widget) return;

    const rates = { INR: 1, USD: 0.012, EUR: 0.011, GBP: 0.0095, AED: 0.044, SGD: 0.016 };

    const amountInput = widget.querySelector('#conv-amount');
    const fromSel     = widget.querySelector('#conv-from');
    const toSel       = widget.querySelector('#conv-to');
    const resultEl    = widget.querySelector('#conv-result');

    const convert = () => {
      const amount = parseFloat(amountInput?.value || 0);
      const from   = fromSel?.value || 'INR';
      const to     = toSel?.value   || 'USD';
      const result = amount > 0 ? (amount / rates[from]) * rates[to] : 0;

      if (resultEl) {
        resultEl.textContent = result.toFixed(2);
      }
    };

    [amountInput, fromSel, toSel].forEach(el => el?.addEventListener('input', convert));
    convert();
  }
};

// ============================================================
// LIVE CHAT BUBBLE (Simulated)
// ============================================================
const LiveChat = {
  init() {
    const chatBtn      = document.querySelector('.chat-bubble');
    const chatWindow   = document.querySelector('.chat-window');
    const sendBtn      = chatWindow?.querySelector('.chat-send');
    const chatInput    = chatWindow?.querySelector('.chat-input');
    const chatMessages = chatWindow?.querySelector('.chat-messages');

    if (!chatBtn || !chatWindow) return;

    sendBtn?.addEventListener('click', () => this.sendMessage(chatInput, chatMessages));
    chatInput?.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') this.sendMessage(chatInput, chatMessages);
    });
  },

  sendMessage(input, messages) {
    if (!input?.value.trim()) return;

    const userMsg = `<div class="chat-msg user" style="background:var(--gradient-primary); color:white; padding:10px 12px; border-radius:var(--radius-md) var(--radius-md) 0 var(--radius-md); font-size:13px; max-width:85%; align-self:flex-end;">${input.value}</div>`;
    messages.insertAdjacentHTML('beforeend', userMsg);
    const userText = input.value;
    input.value = '';

    setTimeout(() => {
      const replies = [
        "Hello! I'm here to help you plan your dream trip to India! 🇮🇳",
        "We have amazing packages for Rajasthan, Kerala, Goa and more!",
        "Our team will get back to you within minutes. Please share your travel dates.",
        "Would you like to explore our featured packages? I can suggest the best options!"
      ];
      const reply  = replies[Math.floor(Math.random() * replies.length)];
      const botMsg = `<div class="chat-msg bot" style="background:var(--gray-100); padding:10px 12px; border-radius:var(--radius-md) var(--radius-md) var(--radius-md) 0; font-size:13px; max-width:85%; color:var(--text-primary);">🤖 ${reply}</div>`;
      messages.insertAdjacentHTML('beforeend', botMsg);
      messages.scrollTop = messages.scrollHeight;
    }, 1000);

    messages.scrollTop = messages.scrollHeight;
  }
};

// ============================================================
// TILT EFFECT (3D Card Hover)
// ============================================================
const Tilt = {
  init() {
    document.querySelectorAll('.card-tilt').forEach(card => {
      card.addEventListener('mousemove', (e) => {
        const rect = card.getBoundingClientRect();
        const x = (e.clientX - rect.left) / rect.width - 0.5;
        const y = (e.clientY - rect.top)  / rect.height - 0.5;
        card.style.transform = `perspective(1000px) rotateX(${-y * 8}deg) rotateY(${x * 8}deg) scale(1.02)`;
      });

      card.addEventListener('mouseleave', () => {
        card.style.transform = '';
      });
    });
  }
};

// ============================================================
// SPA ROUTER
// ============================================================
const SPARouter = {
  currentPage: '',

  init() {
    window.addEventListener('hashchange', () => this.navigate());
    this.navigate(); // Run on initial load
  },

  navigate() {
    const rawHash  = window.location.hash || '#page-home';
    const cleanHash = rawHash.split('?')[0];
    const pageId   = cleanHash.replace('#', '');

    if (this.currentPage === pageId) return; // No re-render if same page
    this.currentPage = pageId;

    let found = false;

    document.querySelectorAll('.spa-page').forEach(page => {
      if ('#' + page.id === cleanHash) {
        page.style.display = 'block';
        // Trigger reflow then fade in
        void page.offsetHeight;
        page.classList.add('active');
        page.style.opacity = '1';
        found = true;
      } else {
        page.style.display = 'none';
        page.classList.remove('active');
        page.style.opacity = '0';
      }
    });

    // Fallback to home if no page found
    if (!found) {
      const homePage = document.getElementById('page-home');
      if (homePage) {
        homePage.style.display = 'block';
        void homePage.offsetHeight;
        homePage.classList.add('active');
        homePage.style.opacity = '1';
      }
    }

    // Update active nav links
    document.querySelectorAll('.nav-link, .mobile-nav-item, .footer-link').forEach(link => {
      const linkHref = (link.getAttribute('href') || '').split('?')[0];
      if (linkHref === cleanHash) {
        link.classList.add('active');
      } else {
        link.classList.remove('active');
      }
    });

    // Scroll to top instantly on page change
    window.scrollTo({ top: 0 });

    // Re-initialize interactive components for new page content
    setTimeout(() => {
      Wishlist.init();
      Filters.init();
      Tabs.init();
      Accordion.init();
      ScrollAnimations.refresh();
      CounterAnimation.init();
      Newsletter.init();
      ContactForm.init();
    }, 100);
  }
};

// ============================================================
// MAIN INIT
// ============================================================
document.addEventListener('DOMContentLoaded', () => {
  // Core
  DarkMode.init();
  Toast.init();

  // Defer until header/footer are injected by components.js
  // components.js runs first so DOM should have header by now
  Navigation.init();
  BackToTop.init();
  PageLoader.init();

  // Hero
  HeroSlider.init();

  // Animations
  ScrollAnimations.init();
  CounterAnimation.init();
  Tilt.init();
  ReadingProgress.init();

  // Interactive
  Wishlist.init();
  Tabs.init();
  Accordion.init();
  Filters.init();
  Modal.init();
  SmoothScroll.init();

  // Forms
  BookingForm.init();
  Newsletter.init();
  ContactForm.init();
  Search.init();

  // Features
  Currency.init();
  CurrencyWidget.init();
  AITripPlanner.init();
  LiveChat.init();
  LazyLoad.init();

  // SPA Router (replaces old inline hashchange code)
  SPARouter.init();

  // Register PWA Service Worker if supported
  if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
      navigator.serviceWorker.register('../sw.js').catch(() => {
        // Service Worker unavailable in file:// context — silent fail
      });
    });
  }
});

// Export for use in other files / inline scripts
window.EpicTravellers = {
  Toast, DarkMode, Currency, Wishlist, Modal, SPARouter, BookingForm
};

/* Spin animation for loading buttons */
const spinStyle = document.createElement('style');
spinStyle.textContent = '@keyframes spin { to { transform: rotate(360deg); } }';
document.head.appendChild(spinStyle);
