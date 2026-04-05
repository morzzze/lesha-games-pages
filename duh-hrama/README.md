# Дух Храма — clean scene pass

Версия current-проекта `duh-hrama` с точечным упрощением визуальной сцены без изменения механики.

## Что убрано
- колонны из окружения
- факелы по периметру
- дымные / veil-слои у духа
- хвост-дым у духа

## Что сохранено
- original Three.js base
- `bossHP = 10000`
- `dmg = 100 + combo * 5`
- `rage` при `bossHP < 4000`
- `comboTimer = 120`
- `restartGame()` через `location.reload()`
- mobile input fixes и camera fixes
