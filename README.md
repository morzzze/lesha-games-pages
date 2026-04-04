# Lesha Games Pages

Публичная витрина HTML-игр на GitHub Pages.

## Правило
Текущая опубликованная версия игры лежит по чистому имени проекта:
- `/<game>/`

Без статусных префиксов в путях.

## Архив публикаций
Старые web-версии складываются в:
- `/archive/<game>/<timestamp>/`

## Скрипты
- `./scripts/archive_page.sh <game> [label]`
- `./scripts/publish_page.sh <game> <source-path> [label]`

`publish_page.sh` делает так:
1. текущую опубликованную версию игры переносит в archive
2. кладёт новую версию на её место
