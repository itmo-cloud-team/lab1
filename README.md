# Лабораторная работа 1 - nginx

## Конфиг nginx
[/etc/nginx/nginx.conf](https://github.com/itmo-cloud-team/lab1/blob/main/nginx.conf)

## Процесс настройки
0. Сервис из Л.Р. 0 развернут и создана копия по пути /var/teamairlines-backup

1. nginx установлен
<img width="911" height="428" alt="image" src="https://github.com/user-attachments/assets/c74fe25c-3d46-4332-85be-0116e60fb08b" />
<img width="611" height="237" alt="image" src="https://github.com/user-attachments/assets/97baf493-5908-433c-84f7-7548e79bf1b5" />

2. Генерация SSL сертификата [/tmp/openssl.conf](https://github.com/itmo-cloud-team/lab1/blob/main/openssl.conf)
<img width="906" height="218" alt="image" src="https://github.com/user-attachments/assets/c9a03260-ea03-49e5-960a-23b77e313c0c" />

3. Написание конфига nginx
<img width="929" height="1079" alt="image" src="https://github.com/user-attachments/assets/eb55f45c-ec40-4d0d-b401-e29e5962f92e" />

## Результат работы скрипта проверки
<img width="727" height="1011" alt="image" src="https://github.com/user-attachments/assets/3807706e-046c-45f0-9741-6dc7b99f785d" />
<img width="935" height="889" alt="image" src="https://github.com/user-attachments/assets/be62ea90-72f7-4702-8bf3-1618bbf16e41" />

## Скриншоты из браузера
<img width="698" height="463" alt="image" src="https://github.com/user-attachments/assets/f2475144-8131-4e44-8aef-dc16fa999ba9" />
<img width="744" height="476" alt="image" src="https://github.com/user-attachments/assets/5df518de-e012-4db7-b103-d6b8f668f5d6" />
