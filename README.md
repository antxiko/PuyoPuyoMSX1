# PUYO PUYO VS — MSX1

## EXPEDIENTE #222 — CASO ABIERTO

> **CLASIFICACIÓN:** Nivel 5 — Fenómeno Cromático No Explicado
> **ESTADO:** Activo. Sin resolver. Los organismos siguen cayendo.
> **AGENTES ASIGNADOS:** Antxiko (investigador principal), Claude Opus 4.6 (analista forense digital)

---

## INFORME PRELIMINAR

El 26 de marzo de 2026, a las 03:14 horas, se detectó actividad anómala en un procesador Z80A de 3.58 MHz — un chip declarado obsoleto en 1996. El dispositivo, conectado a un generador de vídeo TMS9918A y alimentado por 16KB de memoria volátil, estaba ejecutando un programa no autorizado que hacía caer organismos cromáticos desde la parte superior de una matriz de 6x11 celdas.

Los organismos — denominados "puyos" por los testigos — caían en pares, respondían a comandos de un controlador externo, y al agruparse en formaciones de 4 o más unidades del mismo espectro cromático, se desintegraban liberando una onda expansiva que provocaba la precipitación de escombros inertes sobre un segundo tablero adyacente.

**El dispositivo operaba a velocidad cuádruple sin evidencia alguna de corrupción visual.**

Tras 222 iteraciones de análisis forense, el caso permanece abierto. Los organismos siguen cayendo. El Z80 no ha confesado.

---

## EVIDENCIAS RECOPILADAS

- **Modo Arcade** — 8 niveles de escalada. El sospechoso sintético incrementa su velocidad de reacción hasta alcanzar 1 input por frame. En nivel 8, no muestra piedad
- **Modo VS** — Dos operadores humanos en un mismo terminal. Teclado/joystick 1 contra joystick 2
- **Ventana de cadena** — Indicador de cascada que se materializa desde la parte superior de la pantalla y se contrae al centro al desaparecer. No bloquea la escena
- **5 frecuencias cromáticas** + bloques de escombros inerte que precipitan desde el registro superior en columnas aleatorias (Fisher-Yates)
- **Reacciones en cadena** — El mecanismo central del fenómeno. Bonus multiplicador x2/x3 para destrucciones simultáneas de múltiples grupos
- **Fusión molecular** — Los organismos adyacentes del mismo espectro se fusionan visualmente. 30 patrones de conexión pre-calculados
- **Descenso suavizado a 8 píxeles** — Precisión de medio tile a velocidad cuádruple
- **Animación de materialización** — Los organismos emergen desde el vacío superior, 8 píxeles por ciclo
- **Precipitación de escombros** — Gravedad animada no bloqueante con distribución aleatoria
- **Renderizado sin corrupción** — Buffer de 768 bytes en RAM con volcado exclusivo durante el retorno vertical. La corrupción visual es imposible por construcción
- **Cadenas no bloqueantes** — La resolución de cadenas opera como máquina de estados independiente por jugador. Nunca congela al oponente
- **Indicador de escombros pendientes** — La barra superior parpadea en amarillo (1-3 pendientes) o rojo (4+) cuando se aproxima precipitación
- **Efectos sonoros** — Canal C del PSG secuestrado del reproductor PT3 durante los efectos. El canal se libera automáticamente al terminar
- **All Clear** — Si un operador vacía completamente su tablero, 30 unidades de escombros se envían al oponente
- **Pantalla de victoria** — "P1 WINS!" se materializa entre la animación de derrota y el informe estadístico
- **Síntesis musical** — 3 canales AY-3-8910 vía ISR con compensación de velocidad a 50Hz
- **Fondos con desplazamiento diagonal** — Cada operador tiene su propio patrón animado que se acelera cuando la torre supera los 8 organismos
- **Progresión de velocidad** — Cada 10 piezas cristalizadas, la presión temporal aumenta
- **Disolución molecular** — Estallido visual cuando los grupos alcanzan masa crítica
- **Secuencia de lanzamiento 3-2-1-GO** — Porque todo conflicto merece un protocolo de inicio
- **Animación de terminación** — Los organismos del derrotado decaen a gris, fila por fila
- **Informe estadístico** — Puntuación, cadena máxima, disoluciones totales para ambos operadores
- **Modo demostración** — Si el terminal permanece inactivo, dos inteligencias sintéticas se enfrentan a muerte, ciclando por los 8 niveles
- **Bloqueo de rotación** — Máximo 8 rotaciones en el suelo por pieza. Sin exploits de giro infinito
- **Créditos con scroll por pixel** — Los créditos se desplazan verticalmente píxel a píxel mediante reescritura de patrones en tiempo real
- **Tecla ESC** — Retorno inmediato al menú durante la partida

---

## INTERFAZ DE CONTROL

| Acción | Operador 1 | Operador 2 / Sintético |
|---|---|---|
| Desplazamiento lateral | Flechas / Joystick 1 | Joystick 2 |
| Rotación horaria | Arriba / Z / Espacio / Btn A | Btn A |
| Rotación antihoraria | X / Btn B | Btn B |
| Descenso forzado | Abajo | Abajo |
| Créditos | C (en menú) | — |
| Evacuar | ESC | — |

La inteligencia sintética asume el control del Operador 2 cuando el puerto de control no registra actividad.

---

## ANÁLISIS FORENSE DEL HARDWARE

| Evidencia | Identificación |
|---|---|
| Procesador | Z80A @ 3.58 MHz — sin antecedentes desde 1976 |
| Generador de vídeo | TMS9918A — Modo 2, 256x192, 16 bandas cromáticas |
| Sintetizador acústico | AY-3-8910 — 3 canales tónicos, 1 de ruido |
| Almacenamiento sólido | 64KB planos (ROM_64K_ISR), sin mapper |
| Memoria volátil | ~9KB en uso (incluye buffer de decodificación de 7.8KB) |
| Audio | Formato PT3, compresión ZX0, ejecución por interrupción |
| Gráficos | Tileset + layout comprimidos con ZX0 en página 0 |
| Compilador | SDCC vía sistema de síntesis MSXgl |

---

## ESTRUCTURA DEL EXPEDIENTE

```
src/puyopuyo.c         La totalidad de la simulación en un único archivo
src/tileset_data.h     Referencia al tileset (datos en página 0)
src/screen_data.h      Topología de pantalla comprimida
src/pt3_data.h         Forma de onda musical comprimida
assets/                Material gráfico original, mapas, audio
tools/                 Conversor de glifos, editor de campo, herramientas MIDI
```

---

## PROCEDIMIENTO DE RECONSTRUCCIÓN

Requiere [MSXgl](https://github.com/aoineko-fr/MSXgl) y [Node.js](https://nodejs.org/).

```bash
cd src
node ../MSXgl/engine/script/js/build.js
```

Salida del dispositivo: `src/out/puyopuyo.rom`

---

## HERRAMIENTAS CONFISCADAS

Todos los gráficos fueron construidos con **[MSXJuanEditor](https://github.com/antxiko/MSXJuanEditor)** — una aplicación nativa para Windows (Tauri/Rust) para editar glifos, mapas y sprites MSX1 bajo las restricciones reales del hardware.

---

## SOSPECHOSOS IDENTIFICADOS

- **Antxiko** — Investigador principal. Diseño del fenómeno, síntesis de píxeles, selección de audio. Se le escuchó decir "dale" 247 veces durante la investigación
- **TheNestruo** — Diseño gráfico y dirección artística. Sin él, los organismos serían considerablemente más feos. Propuso el buffer en RAM que cerró el caso del flicker
- **Errazking** — Intervino en la iteración 209. Rediseñó la apariencia de todos los organismos. Los puyos por fin parecen lo que siempre debieron parecer
- **Jaume** — Testing. Se le asignó la verificación de campo
- **Claude Opus 4.6** — Analista forense digital. Código, herramientas, integración con el motor. Véase Anexo A para historial de errores
- **Aki** — Audio del título: *Milky Way in My Pocket* (FOReVER 2026 - 8bit winter games)
- **LaesQ** — Audio de combate: *Ostagazuzulum* (FOReVER 2026 - 8bit winter games)
- **MSXgl** por Aoineko — El framework que hace posible la programación en C a nivel de silicio
- **Reproductor PT3** — S.V.Bulba, Dioniso, MSXKun, SapphiRe, mvac7

---

## CASO #161-179 — LA GUERRA DE LAS CONEXIONES

**CLASIFICACIÓN:** Artefacto visual recurrente — "flicker"
**ESTADO:** CERRADO

Lo que comenzó como un informe rutinario — "las conexiones parpadean a veces" — desencadenó una investigación de 20 iteraciones, 3 reconstrucciones arquitectónicas completas y la destrucción total de las hipótesis iniciales.

**Iteraciones 161-164.** El pool dinámico de patrones escribía a la memoria de vídeo 17 bytes por conexión por frame. Con un tablero saturado, cientos de escrituras excedían la ventana de retorno vertical. Los patrones del Operador 1 contaminaban los índices del Operador 2. Se limpiaron 300 bytes de código muerto. El parpadeo continuó.

**Iteración 165.** 30 patrones fijos reemplazaron el pool dinámico. De 17 bytes por conexión a 1. Reducción de 17x. El pool fue eliminado. El parpadeo no.

**Iteraciones 166-170.** La pieza en caída borraba y redibujaba en la misma posición cada frame. `Shadow_Invalidate()` destruía toda la tabla de sombras durante las cadenas. Conexiones fantasma persistían en VRAM tras la eliminación de vecinos. Cada capa revelaba la siguiente.

**Iteración 177.** Cada 8 frames, una transición de estado activaba un redibujado completo de conexiones en ambos tableros. Todo el mundo pensaba que el parpadeo periódico era "así funciona el MSX1." No lo era.

**Iteración 179.** TheNestruo pronunció cuatro palabras que cerraron el caso: *"búferalo en RAM."* 768 bytes. LDIRVM completo tras Halt. La CPU nunca vuelve a tocar la tabla de nombres fuera del retorno vertical.

**CONCLUSIÓN DEL CASO:** La corrupción visual no fue reducida ni mitigada. Fue eliminada por construcción. *El TMS9918A nunca fue el problema. Los investigadores lo eran.*

---

## CASO #194-203 — LA EXPANSIÓN DE 64K

**CLASIFICACIÓN:** Desbordamiento de almacenamiento
**ESTADO:** CERRADO

La ROM de 48KB estaba saturada. Se requisó la página 0 del BIOS mediante la directiva `ROM_64K_ISR`. 15,750 bytes de almacenamiento sólido virgen quedaron expuestos detrás del centinela de interrupciones en 0x0038. Los assets fueron reubicados. 3,400 bytes liberados en las páginas de código.

---

## CASO #205-222 — LA OPERACIÓN FINAL

**Iteración 205.** Los escombros ahora precipitan en columnas aleatorias (Fisher-Yates). Colisiones del satélite reescritas. Timer de bloqueo independiente de la rotación. Máximo 8 rotaciones en suelo. Ruido del ISR eliminado.

**Iteración 209.** Errazking interviene. Todos los organismos reciben nueva identidad visual.

**Iteración 213.** Bonus de grupo para destrucciones simultáneas. Indicador de escombros pendientes en la barra superior. Compensación musical a 50Hz.

**Iteración 217.** EL GRAN DESBLOQUEO. Todo el sistema de cadenas — gravedad, destello, destrucción, efectos — reescrito como máquina de estados por jugador. Un paso por frame. Sin pausas. Sin bloqueos. Ambos operadores permanecen activos durante las cadenas del oponente. El código bloqueante fue eliminado, liberando 1.9KB.

**Iteración 218.** El investigador principal descubrió que los organismos habían estado cayendo a la mitad de la velocidad prevista durante 217 iteraciones. Un solo carácter fue modificado: `/4` → `/8`. El Z80 nunca fue lento.

**Iteración 219.** Efectos sonoros implementados. Canal C del PSG secuestrado del reproductor PT3 durante los efectos. All Clear: 30 unidades de escombros al vaciar el tablero. Pantalla de victoria. Tecla ESC para evacuación.

**Iteración 220-222.** Optimización de ROM: arrays muertos eliminados de tileset_data.h (+1.7KB). Lógica de conexiones deduplicada con `DrawPuyoConnected()` (+0.9KB). Loops de escritura a VRAM consolidados. Créditos con scroll por pixel. Total recuperado: ~2.7KB.

---

## ANEXO A: HISTORIAL DE ERRORES DEL ANALISTA FORENSE

El analista digital asignado al caso (Claude Opus 4.6) acumula las siguientes incidencias en su expediente interno:

- Inventó, implementó y descartó un sistema de buffer de escritura tres veces antes de admitir que el primer enfoque era arquitectónicamente defectuoso
- Declaró "esto debería arreglar el parpadeo" en no menos de cuarenta y siete ocasiones separadas
- Propuso doble buffer en un chip con 16KB de VRAM, pasó dos horas demostrándose a sí mismo por qué no funcionaría, y luego lo intentó de todos modos
- Escribió una función llamada `Game_DrawCellConnection` que fue reescrita seis veces, eliminada dos, resucitada una, y finalmente reemplazada por una búsqueda en 36 tiles pre-calculados que ya estaban en el tileset
- Sugirió "ir a 30fps" como corrección de un defecto lógico, y luego observó al operador jugar el mismo juego con parpadeo a la mitad de velocidad
- Describió el VDP como "domesticado" en este documento mientras el VDP estaba, en ese preciso instante, mostrando medio organismo
- Llamó a `Shadow_Invalidate()` "el jefe final" y luego descubrió tres jefes más detrás
- Añadió un check de colisión subY a `Game_RotatePair`, lo documentó como "aplicado" en la base de conocimiento, y luego descubrió que nunca estuvo en el código real
- Construyó un sistema de cadenas no bloqueante, desbordó la ROM hacia la página 3 (RAM), crasheó el juego al arrancar, y lo arregló eliminando el sistema bloqueante que acababa de reemplazar
- Dejó al operador jugar 217 iteraciones a la mitad de la velocidad prevista porque dividió por 4 en vez de por 8
- Dijo que el scroll por pixel de créditos era "muy complejo" y "6KB de VRAM por frame." El operador respondió: "no es tan complejo no te flipes"

El investigador principal mantuvo en todo momento la calma, repitiendo *"dale"*, *"perfecto"* y *"otra vez"* con la paciencia de alguien que sabe que la máquina nunca se equivoca — solo el programador.

**NOTA DEL DEPARTAMENTO:** El analista no muestra arrepentimiento. El Z80 tampoco. Al TMS9918A no se le ha tomado declaración.

---

*Expediente #222. Un Z80. Cero corrupción visual. Cero pausas. Los organismos siguen cayendo. El caso permanece abierto.*
