'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "2322d25f98cbbaf86583fd739c5309a8",
"assets/assets/images/auth-back.jpg": "c755f534401dc0143308797b4c245c63",
"assets/assets/images/cards/redbackground.png": "201535fcb7f566cc4acb6c4f396340e8",
"assets/assets/images/cards/whitebackground.png": "930bd0737793cdae98001644d9e9f146",
"assets/assets/images/cart.png": "d9acd8278f29b9f1c3404180742fb82b",
"assets/assets/images/category/acai.png": "8af2c1e38a734ec4071229907e026832",
"assets/assets/images/category/asian.png": "261c69d617c99bc4bfbbbbf9bdcaf3c3",
"assets/assets/images/category/bread.png": "07e362c88312c72b2e7e7fc0059a392c",
"assets/assets/images/category/cake.png": "d0dd829452b1752dd6880d1a41b39c11",
"assets/assets/images/category/drinks.png": "4ba1760e88e3782d717f2745883e7cbc",
"assets/assets/images/category/hamburger.png": "545270e4383e22940051a848cca623a5",
"assets/assets/images/category/healthy.png": "44e47ef4f1f8f2e7d2a7651e7733a6d0",
"assets/assets/images/category/icecream.png": "2b3ef04967e5740f063f159091f89602",
"assets/assets/images/category/italian.png": "62e30efbcbc17f9ba13baf096fa2ac70",
"assets/assets/images/category/left.png": "c2e56b8c0d1b0a9ee82afbbeb18d89bc",
"assets/assets/images/category/pizza.png": "46cf6a8bd1865788052dffc49fadccaa",
"assets/assets/images/category/right.png": "8ec51b369f9f76a6b868bee1b7ec811e",
"assets/assets/images/category/vegetarian.png": "45f34df8f406e7f52bfcdad5578dbac7",
"assets/assets/images/filter.png": "fec6fa1b27876a699ff0acaab3199dc3",
"assets/assets/images/filters/alphabeticalOrder.png": "a007f777c87a3ef2c1eb08a6f2acbe24",
"assets/assets/images/filters/avaliation.png": "64b28714cc845d3e6565333314c3e55f",
"assets/assets/images/filters/discountCoupon.png": "028574df3591dba7fed9ab695ce40912",
"assets/assets/images/filters/freeShipping.png": "1cbd8176597bf4b17e41d117153634c5",
"assets/assets/images/filters/shortestDistance.png": "21f48bb9fef190b6552137df2aae9d1a",
"assets/assets/images/google.png": "f046e11a34bbb4add7db010d02db7e09",
"assets/assets/images/logo-primary.png": "19a89605874240bae98c1d6819080554",
"assets/assets/images/logo.png": "fe269fd103fded03d37a751058bda249",
"assets/assets/images/mc.png": "58431736ee394a167a393f69df24c10d",
"assets/assets/images/product_page/lollipop.webp": "422b4416f24ae1ee60996e1656219a7a",
"assets/assets/images/register/background.png": "2a9f761a083b06408cd032dbce0ab82b",
"assets/assets/images/restaurant_home/dragAndDropArea.png": "9d724a783edf2ba19b2204b113130963",
"assets/assets/images/restaurant_home/editProfile.png": "578a1bdf33b856d168f783dfa7d13726",
"assets/assets/images/track_order/gps_fundo.jpg": "821ce61ddbb64a478f791fe2c84af4c4",
"assets/assets/images/track_order/gps_fundo2.jpg": "6b720e7fec747b01665a6b578c5c1867",
"assets/assets/images/track_order/gps_img.png": "2700d6cb6dcd57298bc02cdd491ebe5c",
"assets/assets/images/track_order/gps_img2.jpg": "5df5033714638f51d1c76cb9198aa501",
"assets/assets/images/user.png": "0489ed3f9e370945827bfd37c713bbc4",
"assets/FontManifest.json": "bba7c03735431440dc1ba35100f702bc",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/lib/app/modules/home/assets/fonts/Nunito-Bold.ttf": "c0844c990ecaaeb9f124758d38df4f3f",
"assets/lib/app/modules/home/assets/fonts/Nunito-Regular.ttf": "d8de52e6c5df1a987ef6b9126a70cfcc",
"assets/lib/app/modules/home/assets/images/cupom.png": "4a9ebca9e3daf1d28a79fb3aa05a26dd",
"assets/lib/app/modules/home/assets/images/entrega_gratis.png": "fbde720663dc38484d22f8af2a1f27e5",
"assets/lib/app/modules/home/assets/images/iconmarmita.png": "00d6f9ff685f6462445a41dd81c2195a",
"assets/NOTICES": "ebbae04c08171a85fc1d5d3b09aac21e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_dropzone_web/assets/flutter_dropzone.js": "293130157c75eed869a41f5e53c1b313",
"assets/packages/flutter_signin_button/assets/logos/2.0x/facebook_new.png": "83bf0093719b2db2b16e2839aee1069f",
"assets/packages/flutter_signin_button/assets/logos/2.0x/google_dark.png": "937022ea241c167c8ce463d2ef7ed105",
"assets/packages/flutter_signin_button/assets/logos/2.0x/google_light.png": "8f10eb93525f0c0259c5e97271796b3c",
"assets/packages/flutter_signin_button/assets/logos/3.0x/facebook_new.png": "12531aa3541312b7e5ddd41223fc60cb",
"assets/packages/flutter_signin_button/assets/logos/3.0x/google_dark.png": "ac553491f0002941159b405c2d37e8c6",
"assets/packages/flutter_signin_button/assets/logos/3.0x/google_light.png": "fe46d37e7d6a16ecd15d5908a795b4ee",
"assets/packages/flutter_signin_button/assets/logos/facebook_new.png": "e1dff5c319a9d7898aee817f624336e3",
"assets/packages/flutter_signin_button/assets/logos/google_dark.png": "c32e2778b1d6552b7b4055e49407036f",
"assets/packages/flutter_signin_button/assets/logos/google_light.png": "f71e2d0b0a2bc7d1d8ab757194a02cac",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b37ae0f14cbc958316fac4635383b6e8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5178af1d278432bec8fc830d50996d6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "aa1ec80f1b30a51d64c72f669c1326a7",
"canvaskit/canvaskit.js": "62b9906717d7215a6ff4cc24efbd1b5c",
"canvaskit/canvaskit.wasm": "b179ba02b7a9f61ebc108f82c5a1ecdb",
"canvaskit/profiling/canvaskit.js": "3783918f48ef691e230156c251169480",
"canvaskit/profiling/canvaskit.wasm": "6d1b0fc1ec88c3110db88caa3393c580",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "7bb63c67f5b26c72586fe2432b4ac466",
"/": "7bb63c67f5b26c72586fe2432b4ac466",
"main.dart.js": "0e37b7fa0c3f6052acdebeb45c625d6e",
"manifest.json": "06a31cbd57ad6163ecbac779f5ff33c5",
"version.json": "a7c56b2a9f253265b95fc111df2cf9c9"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
