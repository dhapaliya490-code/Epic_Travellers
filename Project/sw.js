/* ============================================================
   EPIC-TRAVELLERS - Service Worker
   Offline caching & PWA support
   ============================================================ */

const CACHE_NAME = 'epic-travellers-v1';
const ASSETS_TO_CACHE = [
  '/',
  '/index.html',
  '/destinations.html',
  '/packages.html',
  '/package-details.html',
  '/about.html',
  '/blog.html',
  '/gallery.html',
  '/contact.html',
  '/dashboard.html',
  '/auth.html',
  '/admin.html',
  '/404.html',
  '/css/style.css',
  '/css/components.css',
  '/css/animations.css',
  '/css/dark-mode.css',
  '/js/main.js',
  '/js/components.js'
];

// Install Event
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(ASSETS_TO_CACHE);
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

// Fetch Event (Offline Fallback)
self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then((cachedResponse) => {
      if (cachedResponse) {
        return cachedResponse;
      }
      return fetch(event.request).catch(() => {
        if (event.request.headers.get('accept').includes('text/html')) {
          return caches.match('/404.html');
        }
      });
    })
  );
});
