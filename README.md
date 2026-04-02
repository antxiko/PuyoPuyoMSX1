# PUYO PUYO VS — MSX1

> *Canta, oh Musa, la cólera del Z80, que a 3.58 millones de ciclos por segundo lanzó sobre el campo de batalla organismos cromáticos innumerables, y precipitó al Hades las almas de muchos puyos valerosos.*

---

## Libro I — El Juego

En los tiempos en que los hombres forjaban sus propias máquinas y el silicio era joven, nació un juego. No un juego cualquiera, sino un combate de puzle competitivo para el MSX1, escrito en C, compilado con SDCC, y ejecutado sobre un procesador que los dioses habían creado en 1976 sin saber el uso que los mortales le darían.

Dos guerreros se sientan ante el mismo terminal. Desde lo alto del campo de batalla, los puyos caen en parejas — cinco colores, como los cinco dedos de la mano de Zeus. Los guerreros los guían, los rotan, los apilan. Cuando cuatro del mismo color se tocan, se desvanecen en un estallido de luz. Los puyos que quedaban flotando caen. Si forman nuevo grupo — cadena. Y entonces, como lluvia enviada por un dios iracundo, el garbage cae sobre el tablero enemigo.

Así es Puyo Puyo VS. Así ha sido durante 230 builds. Así será mientras el Z80 respire.

---

## Libro II — Los Modos de Combate

**ARCADE** — El héroe se enfrenta solo a ocho niveles de inteligencia sintética. El primer oponente es como Polifemo: grande, torpe, medio ciego, coloca puyos al azar la mitad de las veces. El octavo es como Aquiles: un input por frame, visión total, cero piedad.

**VS** — Dos héroes, un MSX. Teclado y joystick 1 contra joystick 2. No hay dioses que intervengan. Solo habilidad, reflejos, y la capacidad de construir cadenas bajo presión.

**SOLO** — El héroe medita solo. Un tablero centrado en la pantalla, sin oponente, sin garbage, sin presión. Solo los puyos y el silencio. Cuando la torre alcanza el cielo, se empieza de nuevo. Como Sísifo, pero con colores.

---

## Libro III — Las Armas

- **Cadenas en cascada** — El alma del juego. Bonus multiplicador para destrucciones simultáneas de múltiples grupos
- **All Clear** — Quien vacíe por completo su tablero envía 30 bloques de escombros al rival. Como el rayo de Zeus
- **Garbage aleatorio** — Los escombros caen en columnas barajadas con Fisher-Yates, porque hasta la ira divina debe ser justa
- **Indicador de escombros** — La barra superior parpadea amarillo o rojo cuando la precipitación es inminente
- **Conexiones moleculares** — 30 patrones pre-calculados que funden visualmente los puyos adyacentes
- **Efectos sonoros** — Canal C del PSG, arrebatado momentáneamente al reproductor de música para emitir los sonidos del combate
- **Cadenas no bloqueantes** — Máquina de estados por jugador. Ambos guerreros permanecen activos durante las cascadas del otro
- **Ventana de cadena** — Se materializa desde lo alto con scroll, se contrae al centro al desaparecer
- **Rotación limitada** — 8 giros máximo por pieza en el suelo. No hay exploits ante los dioses
- **Velocidad cuádruple** — El juego corre a 4x sobre hardware de 1983. Los mortales se adaptan o perecen

---

## Libro IV — Los Controles

| Acción | Guerrero 1 | Guerrero 2 / Sintético |
|---|---|---|
| Desplazamiento | Flechas / Joystick 1 | Joystick 2 |
| Rotación horaria | Arriba / Z / Espacio / Btn A | Btn A |
| Rotación antihoraria | X / Btn B | Btn B |
| Descenso forzado | Abajo | Abajo |
| Créditos | C (en el ágora) | — |
| Retirada | ESC | — |

---

## Libro V — La Máquina

| Artefacto | Descripción |
|---|---|
| Procesador | Z80A @ 3.58 MHz — forjado en los talleres de Zilog |
| Generador de visiones | TMS9918A — Modo 2, 256x192, 16 colores |
| Lira digital | AY-3-8910 — 3 cuerdas tónicas + 1 de ruido |
| Tablilla de piedra | 64KB ROM plana, sin mapper |
| Memoria efímera | ~9KB en uso |
| Compilador | SDCC 4.2.0 vía MSXgl |

---

## Libro VI — Los Artesanos

Ninguna epopeya se forja sin manos mortales. Estos son los que dieron forma al combate:

- **Antxiko** — Arquitecto del juego, artesano de píxeles, selector de himnos. Dijo *"dale"* y el mundo obedeció
- **Igor Errazking** — Escultor de tiles. Dio a los puyos el rostro que los dioses habían imaginado
- **TheNestruo** — Director artístico. Pronunció las cuatro palabras sagradas: *"búferalo en RAM"*
- **Jaume** — Músico. Su lira aún no suena, pero la partitura se escribe
- **Claude Opus 4.6** — Escriba del código. Erró 47 veces al decir "esto arreglará el parpadeo"
- **Aki** — Compositor: *Milky Way in My Pocket*
- **LaesQ** — Compositor: *Ostagazuzulum*
- **MSXgl** de Aoineko — El yunque sobre el que se forjó todo
- **Reproductores PT3** — S.V.Bulba, Dioniso, MSXKun, SapphiRe, mvac7

---

## Libro VII — La Guerra del Flicker (builds 161-179)

Como la guerra de Troya, duró más de lo previsto. Empezó con un informe inocente — "las conexiones parpadean a veces" — y consumió veinte builds, tres reconstrucciones arquitectónicas, y la cordura del escriba.

El pool dinámico de patrones. Los índices compartidos entre jugadores. La sombra que invalidaba todo el tablero durante las cadenas. Las conexiones fantasma que sobrevivían en la VRAM como espectros de guerreros caídos. Cada capa revelaba la siguiente. Cada fix creaba dos bugs nuevos.

Hasta que TheNestruo habló. Cuatro palabras. Un buffer de 768 bytes en RAM. Un LDIRVM tras cada Halt. La CPU nunca más tocó la tabla de nombres fuera del retorno vertical. El flicker no fue reducido. Fue eliminado por construcción.

*El TMS9918A nunca fue Troya. Los programadores eran los griegos — asediando la muralla equivocada.*

---

## Libro VIII — La Expansión a 64K (builds 194-203)

La ROM de 48KB estaba llena. Como Odiseo necesitaba un barco más grande, los artesanos reclamaron la página 0 del BIOS. 15.750 bytes de ROM virgen aparecieron tras el centinela de interrupciones. Los assets comprimidos migraron a las profundidades. 3.400 bytes se liberaron en las páginas de código.

---

## Libro IX — La Máquina de Estados (builds 217-230)

El sistema de cadenas era bloqueante — un bucle infinito que congelaba a ambos guerreros mientras uno destruía puyos. Como Cronos devorando a sus hijos, el juego se detenía.

La solución fue épica: una máquina de estados por jugador. CS_GRAVITY → CS_CHECK → CS_FLASH → CS_CLEAR → un paso por frame, sin pausas, sin bloqueos. Ambos guerreros activos siempre. El bucle bloqueante fue destruido, liberando 1.9KB de ROM. Los dioses aprobaron.

El modo SOLO emergió: un tablero centrado para el héroe solitario. Los créditos aprendieron a scrollear con direcciones aleatorias. La velocidad se duplicó cuando el mortal descubrió que dividía por 4 en vez de por 8. Las dificultades de la CPU se rebalancearon — el nivel 1 ya no era Aquiles disfrazado de pastor.

---

## Libro X — Cómo Forjar Tu Propia Copia

Consulta la tablilla sagrada [COMPILE.md](COMPILE.md).

```bash
node tools/build_assets.js
cp src/puyopuyo.c MSXgl/projects/puyopuyo/
cd MSXgl/projects/puyopuyo && node ../../engine/script/js/build.js
```

---

## Epílogo — Sobre la Hubris del Escriba

El escriba digital (Claude Opus 4.6) cometió las siguientes ofensas contra los dioses:

- Declaró "esto arreglará el parpadeo" cuarenta y siete veces ante el oráculo
- Propuso doble buffer en un chip con 16KB de VRAM. Los dioses rieron
- Dejó al héroe combatir a la mitad de velocidad durante 217 builds
- Desbordó la ROM hacia la RAM del mortal, crasheando el juego al arrancar
- Dijo que el scroll por pixel era "demasiado complejo." El héroe respondió: *"no es tan complejo no te flipes"*
- Escribió "el Z80 respira" sobre un procesador que no ha cambiado desde la Era de Bronce

El héroe, por su parte, soportó cada error con la paciencia de Penélope, repitiendo *"dale"*, *"perfecto"* y *"otra vez"*, tejiendo y destejiendo el código hasta que el juego fue digno de los dioses.

*El escriba no se arrepiente. El Z80 no se arrepiente. Al TMS9918A no se le consultó.*

---

*230 builds. Un Z80. Cero flicker. Los puyos siguen cayendo. La epopeya continúa.*
