# Migración ROM_48K_ISR → ROM_64K_ISR — PuyoPuyoMSX1

## Contexto del proyecto

- **Juego**: PuyoPuyoMSX1 — Puyo Puyo competitivo MSX1, C + MSXgl/SDCC
- **Target actual**: ROM_48K_ISR — el juego ya no cabe, hay que pasar a 64KB
- **Hardware destino**: MSX Simple 64K ROM Cartridge (SOP) — Flash ROM flat sin mapper
- **ISR**: VBlank con NameBuffer_Flush() diferencial + PT3 player — no tocar
- **RAM usada**: ~9KB (incluido g_PT3Buffer de 7.8KB, g_NameBuffer x2 de 768 bytes c/u)

---

## Mapa de memoria de ROM_64K_ISR

| Página | Dirección       | Slot activo        | Contenido                        |
|--------|-----------------|--------------------|----------------------------------|
| 0      | 0x0000-0x3FFF   | Cartucho (ROM)     | ISR, arranque, **assets aquí**   |
| 1      | 0x4000-0x7FFF   | Cartucho (ROM)     | Código principal                 |
| 2      | 0x8000-0xBFFF   | Cartucho (ROM)     | Código overflow                  |
| 3      | 0xC000-0xFFFF   | RAM del sistema    | Stack, variables, buffers        |

El BIOS del MSX sigue intacto en slot 0. MSXgl usa interslot calls (CALSLT)
para acceder a él cuando es necesario. Transparente para el juego.

---

## Por qué los assets van en PÁGINA 0 y no en página 3

**Problema crítico con página 3:**
Si los assets estuvieran en página 3 del cartucho (0xC000-0xFFFF), para
leerlos habría que switchear esa página al slot del cartucho — pero ahí
vive la RAM del sistema (stack, variables, g_PT3Buffer...). Switchear página
3 al cartucho destruye la RAM. Crash inmediato.

**Solución: página 0**
Página 0 en ROM_64K_ISR es SIEMPRE el slot del cartucho. Se puede leer
directamente con un puntero C normal, sin ningún switcheo. El decompressor
lee desde página 0 (ROM) y escribe a página 3 (RAM) sin conflicto.

Espacio disponible en página 0: desde 0x0100 hasta 0x3FFF = **~15.75KB**
(los primeros 256 bytes los usa MSXgl para el arranque y vectores ISR).

---

## Cambios en project_config.js

```js
// Antes
Target = "ROM_48K_ISR";

// Después
Target = "ROM_64K_ISR";

// Assets comprimidos en página 0, desde 0x0100
RawFiles = [
    { page: 0, file: "out/tileset_data.zx0" },
    { page: 0, file: "out/screen_data.zx0" },
    { page: 0, file: "out/pt3_data.zx0" },
];
```

MSXgl generará automáticamente un header con los offsets de cada asset.
El nombre del header suele ser `{ProjName}_rawdef.h`.

---

## Cambios en puyopuyo.c

### 1. Incluir el header generado

```c
#include "puyopuyo_rawdef.h"  // generado por MSXgl, contiene los offsets
```

### 2. Función de carga de assets al arrancar

```c
void LoadAssets(void) {
    // Los assets están en página 0 (ROM), acceso directo por puntero.
    // Descomprimir a RAM antes de cualquier otra inicialización.
    
    ZX0_Decompress(g_TilesetData, (void*)(0x0100 + TILESET_DATA_OFFSET));
    ZX0_Decompress(g_ScreenData,  (void*)(0x0100 + SCREEN_DATA_OFFSET));
    ZX0_Decompress(g_PT3Buffer,   (void*)(0x0100 + PT3_DATA_OFFSET));
}

void main(void) {
    LoadAssets();   // PRIMERO, antes de VDP_Init() y todo lo demás
    // ... resto del arranque sin cambios
}
```

Los nombres exactos de las constantes OFFSET dependen del header generado.
Revisar `puyopuyo_rawdef.h` después del primer build para confirmarlos.

---

## Verificaciones después del cambio

1. El .rom generado debe pesar exactamente **65536 bytes** (64KB)
2. Revisar el header rawdef.h generado para confirmar los nombres de los offsets
3. `LoadAssets()` debe ejecutarse **antes** de VDP_Init() y de cualquier
   uso de g_TilesetData, g_ScreenData o g_PT3Buffer
4. Verificar en openMSX que arranca correctamente
5. Verificar que la suma de assets comprimidos cabe en ~15.75KB de página 0:
   - `wc -c out/tileset_data.zx0 out/screen_data.zx0 out/pt3_data.zx0`

---

## Qué NO hay que cambiar

- El ISR de VBlank — sin cambios
- NameBuffer_Flush() — sin cambios
- g_NameBuffer y g_NameBufferPrev — sin cambios
- El PT3 player — sin cambios
- Toda la lógica del juego — sin cambios

---

## Hardware destino — MSX Simple 64K ROM Cartridge (SOP)

Flash ROM flat sin mapper. Mapeo directo:

| Slot MSX        | Flash ROM       |
|-----------------|-----------------|
| 0x0000-0x3FFF   | 0x0000-0x3FFF   |
| 0x4000-0x7FFF   | 0x4000-0x7FFF   |
| 0x8000-0xBFFF   | 0x8000-0xBFFF   |
| 0xC000-0xFFFF   | 0xC000-0xFFFF   |

ROM_64K_ISR genera un flat binary de 64KB que encaja perfectamente con este
hardware. No necesita mapper de ningún tipo.

Para grabar: `simplefw.com puyopuyo.rom /0`
