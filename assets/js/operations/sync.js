// Detectar cuando vuelve Internet
window.addEventListener("online", () => {
    console.log("🔗 Conexión restaurada. Enviando datos...");
    syncNow();
});

// Función principal de sincronización
async function syncNow() {
    const db = await openDB();
    const tx = db.transaction("generalInfo", "readwrite");
    const store = tx.objectStore("generalInfo");

    // ✔ FIX: getAll() correcto usando Promise
    const allData = await getAllFromStore(store);

    if (!allData || allData.length === 0) {
        console.log("✔ No hay datos pendientes.");
        return;
    }

    console.log(`📦 Datos pendientes por sincronizar: ${allData.length}`);

    for (let row of allData) {
        try {
            let res = await fetch('/bancoAlimentos/insertGeneralInformation', {
                method: 'POST',
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(row.data)
            });

            if (res.ok) {
                store.delete(row.id);
                alertify.success("📤 Datos sincronizados con el servidor.");
            }
        } catch (err) {
            console.error("⚠ Error enviando datos pendientes:", err);
            alertify.error("⚠ Error enviando datos pendientes.");
        }
    }
}

/* ============================================================
   Abrir la base de datos IndexedDB
============================================================ */
function openDB() {
    return new Promise((resolve, reject) => {
        const request = indexedDB.open("BancoAlimentosDB", 1);

        request.onerror = () => reject(request.error);

        request.onupgradeneeded = (event) => {
            const db = event.target.result;

            // Crear object store si no existe
            if (!db.objectStoreNames.contains("generalInfo")) {
                db.createObjectStore("generalInfo", {
                    keyPath: "id",
                    autoIncrement: true
                });
            }
        };

        request.onsuccess = () => resolve(request.result);
    });
}

/* ============================================================
   Helper para obtener todos los registros del store
   (✔ Soluciona el error "allData is not iterable")
============================================================ */
function getAllFromStore(store) {
    return new Promise((resolve, reject) => {
        const req = store.getAll();

        req.onsuccess = () => resolve(req.result || []);
        req.onerror = () => reject(req.error);
    });
}
