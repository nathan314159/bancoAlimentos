let db;

// Abrir o crear DB
const request = indexedDB.open("BancoAlimentosDB", 1);

request.onupgradeneeded = function (event) {
    db = event.target.result;

    if (!db.objectStoreNames.contains("generalInfo")) {
        db.createObjectStore("generalInfo", {
            keyPath: "id",
            autoIncrement: true
        });
    }
};

request.onsuccess = function (event) {
    db = event.target.result;
};

request.onerror = function (event) {
    console.error("IndexedDB error:", event.target.errorCode);
};

// Guardar datos cuando no hay Internet
function saveOffline(data) {
    let tx = db.transaction("generalInfo", "readwrite");
    let store = tx.objectStore("generalInfo");
    store.add({ data });

    alertify.warning("📡 Sin conexión. Datos guardados localmente.");
}

// Detectar pérdida de Internet en el formulario
window.addEventListener("offline", () => {
    alertify.error("❌ Sin conexión. Guardando localmente...");
});
