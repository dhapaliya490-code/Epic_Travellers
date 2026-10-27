/* ============================================================
   EPIC-TRAVELLERS - Service Worker
   Offline caching & PWA support
   ============================================================ */

const CACHE_NAME = 'epic-travellers-v2';
const ASSETS_TO_CACHE = [
  '/Pages/index.aspx',
  '/Pages/destinations.aspx',
  '/Pages/packages.aspx',
  '/Pages/about.aspx',
  '/Pages/blog.aspx',
  '/Pages/gallery.aspx',
  '/Pages/contact.aspx',
  '/Content/css/style.css',
  '/Content/css/components.css',
  '/Content/css/animations.css',
  '/Content/css/dark-mode.css',
  '/Content/fontawesome/css/all.min.css',
  '/Scripts/js/main.js',
  '/Scripts/js/components.js'
];

// Install Event
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(ASSETS_TO_CACHE).catch((err) => {
        console.warn('PWA caching partial:', err);
      });
    })
  );
  self.skipWaiting();
});

// Activate Event
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.map((key) => {
          if (key !== CACHE_NAME) {
            return caches.delete(key);
          }
        })
      );
    })
  );
  self.clients.claim();
});

// Fetch Event (Network First, Cache Fallback)
self.addEventListener('fetch', (event) => {
  if (event.request.method !== 'GET') return;
  event.respondWith(
    fetch(event.request)
      .then((networkResponse) => {
        return networkResponse;
      })
      .catch(() => {
        return caches.match(event.request);
      })
  );
});
