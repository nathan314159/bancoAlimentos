const CACHE_NAME = 'bancoAlimentos-v1';
const OFFLINE_URL = 'offline.html';

const FILES_TO_CACHE = [
    // "/", // raíz del scope
    // "offline.html",
    "assets/js/sb-admin-2.js",
    "assets/js/sb-admin-2.min.js",
    // "dashboard/"
];

// Instalar Service Worker
self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME).then(cache => {
            console.log('📦 Cacheando archivos...');
            return cache.addAll(FILES_TO_CACHE);
        })
    );
    self.skipWaiting();
});

// Activar y limpiar caches viejos
self.addEventListener('activate', (event) => {
    event.waitUntil(
        caches.keys().then(keys =>
            Promise.all(
                keys.map(key => key !== CACHE_NAME && caches.delete(key))
            )
        )
    );

    console.log('✨ SW Activado');
    self.clients.claim();
});

// Interceptar peticiones (offline support)
self.addEventListener('fetch', (event) => {
    event.respondWith(
        fetch(event.request)
            .then(response => response)
            .catch(() => {
                return caches.match(event.request).then(res => {
                    return res || caches.match(OFFLINE_URL);
                });
            })
    );
});

// Sincronización de fondo
self.addEventListener('sync', async (event) => {
    if (event.tag === 'sync-form') {
        console.log('⏳ Sincronizando datos offline...');
        event.waitUntil(sendPendingData());
    }
});

async function sendPendingData() {
    const db = await openDB();
    const tx = db.transaction('generalInfo', 'readwrite');
    const store = tx.objectStore('generalInfo');
    const allData = await store.getAll();

    for (let row of allData) {
        try {
            let res = await fetch('insertGeneralInformation', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(row.data),
            });

            if (res.ok) store.delete(row.id);
        } catch (err) {
            console.error('❌ Error enviando datos offline:', err);
        }
    }
}

function openDB() {
    return new Promise((resolve, reject) => {
        const request = indexedDB.open('BancoAlimentosDB', 1);
        request.onerror = () => reject(request.error);
        request.onsuccess = () => resolve(request.result);
    });
}
