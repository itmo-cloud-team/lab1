# Лабораторная работа 1 - nginx

UPD: 08.11.2026

## Условие Л.Р.
По условию требуется поднять сервис, созданный в рамках Л.Р. 0, а также:
- настроить SSL (с самоподписанным сертификатом) + HSTS (принудительное перенаправление HTTP -> HTTPS)
- поднять frontend и backend на одном хосте. С помощью конфига nginx сделать так, чтобы статику отдавал сам веб-сервер, а API вызовы перенаправлялись на наш Python backend
- настроить балансировку (между двумя экземплярами backend'а)
- использовать `alias` для псевдонима пути к директории
- настроить виртуальные хосты (несколько доменов должны обслуживаться одним веб сервером)
- rate limit
- кастомная страница 404
- HTTP basic auth на /admin
- Написать скрипт для проверки всего выше указанного

## Процесс настройки
0. Сервис из Л.Р. 0 развернут и создана копия по пути /var/teamairlines-backup

1. nginx установлен
<img width="455" height="214" alt="image" src="https://github.com/user-attachments/assets/c74fe25c-3d46-4332-85be-0116e60fb08b" />
<br>
<img width="305" height="118" alt="image" src="https://github.com/user-attachments/assets/97baf493-5908-433c-84f7-7548e79bf1b5" />

2. Генерация SSL сертификата [/tmp/openssl.conf](https://github.com/itmo-cloud-team/lab1/blob/main/openssl.conf)
<img width="454" height="110" alt="image" src="https://github.com/user-attachments/assets/70452fba-9b41-4c3e-8918-a1e5f2c53b72" />

3. Написание [конфига nginx](https://github.com/itmo-cloud-team/lab1/blob/main/nginx.conf)
<img width="464" height="539" alt="image" src="https://github.com/user-attachments/assets/eb55f45c-ec40-4d0d-b401-e29e5962f92e" />

Пояснение конфига (на скрине выше только его кусок. целиком - см. [nginx.conf](https://github.com/itmo-cloud-team/lab1/blob/main/nginx.conf))
- Указаны 2 upstream'а - `localhost:5000`, `localhost:5001`. 2 экземпляра backend'а
- Ограничение частоты запросов. 2 запроса в секунду. далее - HTTP 429
- Перенаправление 80 -> https://
- Виртуальные хосты реализованы с помощью нескольких блоков `server { ... }`. Используется опция `server_name` для указания разных доменных имен
- Указан SSL сертификат
- Прописаны location'ы - /api, /, /docs, /admin, и отдельно кастомная 404
- Второй виртуальный хост - second.local. Там возвращает тестовую страницу Second application

## [Скрипт проверки](https://github.com/itmo-cloud-team/lab1/blob/main/check.sh)
- Проверка HTTP 301 (редирект с HTTP на HTTPS)
- Проверка балансировщика
- Проверка автоматического переключения на backup сервер (скрипт ожидает подтверждения пользователя, что основной backend был выключен)
- Проверка авторизации (без кредов, HTTP 401)
- Проверка другого виртуального хоста (второй домен)
- Проверка кастомной 404
- Проверка ограничения кол-ва запросов. Флуд запросами

## Результат работы скрипта проверки
<img width="727" height="1011" alt="image" src="https://github.com/user-attachments/assets/3807706e-046c-45f0-9741-6dc7b99f785d" />
<img width="935" height="889" alt="image" src="https://github.com/user-attachments/assets/be62ea90-72f7-4702-8bf3-1618bbf16e41" />

## Скриншоты из браузера
<img width="698" height="463" alt="image" src="https://github.com/user-attachments/assets/f2475144-8131-4e44-8aef-dc16fa999ba9" />
<img width="744" height="476" alt="image" src="https://github.com/user-attachments/assets/5df518de-e012-4db7-b103-d6b8f668f5d6" />
