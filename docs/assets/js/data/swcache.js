const resource = [
  /* --- CSS --- */
  '/Yoyomanzoor/assets/css/jekyll-theme-chirpy.css',

  /* --- PWA --- */
  '/Yoyomanzoor/app.js',
  '/Yoyomanzoor/sw.js',

  /* --- HTML --- */
  '/Yoyomanzoor/index.html',
  '/Yoyomanzoor/404.html',

  
    '/Yoyomanzoor/categories/',
  
    '/Yoyomanzoor/tags/',
  
    '/Yoyomanzoor/archives/',
  
    '/Yoyomanzoor/about/',
  

  /* --- Favicons & compressed JS --- */
  
  
    '/Yoyomanzoor/assets/img/favicons/android-chrome-192x192.png',
    '/Yoyomanzoor/assets/img/favicons/android-chrome-512x512.png',
    '/Yoyomanzoor/assets/img/favicons/apple-touch-icon.png',
    '/Yoyomanzoor/assets/img/favicons/favicon-16x16.png',
    '/Yoyomanzoor/assets/img/favicons/favicon-32x32.png',
    '/Yoyomanzoor/assets/img/favicons/favicon.ico',
    '/Yoyomanzoor/assets/img/favicons/mstile-150x150.png',
    '/Yoyomanzoor/assets/js/dist/categories.min.js',
    '/Yoyomanzoor/assets/js/dist/commons.min.js',
    '/Yoyomanzoor/assets/js/dist/home.min.js',
    '/Yoyomanzoor/assets/js/dist/misc.min.js',
    '/Yoyomanzoor/assets/js/dist/page.min.js',
    '/Yoyomanzoor/assets/js/dist/post.min.js'
];

/* The request url with below domain will be cached */
const allowedDomains = [
  

  'yoyomanzoor.github.io',

  

  'fonts.gstatic.com',
  'fonts.googleapis.com',
  'cdn.jsdelivr.net',
  'polyfill.io'
];

/* Requests that include the following path will be banned */
const denyUrls = [];

