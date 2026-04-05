# Дух Храма — Three.js source preserved

Версия, собранная именно от исходного Three.js-источника.

## Что важно
- сохранён исходный механический цикл: храм → алтарь → shake → босс
- сохранены базовые формулы и пороги:
  - `bossHP = 10000`
  - `dmg = 100 + combo * 5`
  - `rage` при `bossHP < 4000`
  - `boss.scale.set(1.3, 1.3, 1.3)`
  - `comboTimer = 120`
  - `restartGame()` через `location.reload()`
- сохранён Three.js-рендер и общий feel исходника

## Что улучшено
- сцена храма стала богаче визуально
- улучшены колонны, арка, алтарь, факелы, босс и игрок
- добавлен HUD без изменения core-механики
- улучшена читаемость на телефоне
- добавлен mobile framing fix для iPhone/portrait, чтобы бой был читаемым и босс не залезал в камеру
- дополнительно исправлен fight-camera composition fix: камера теперь реально собирает арену и босса, а не ближний алтарь/сферу в portrait
- добавлен mobile input robustness fix: unlock audio, touchstart/pointerdown для атаки, более устойчивый джойстик и tap-to-attack на canvas
- добавлен portrait playability fix: boss silhouette/readability усилены, а mobile-камера переведена в более игровой oblique-angle ракурс
