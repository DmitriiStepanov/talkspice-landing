#!/bin/bash

# Скрипт автоматической загрузки TalkSpice на REG.RU
# Замените данные на ваши от REG.RU

FTP_HOST="your-ftp-host.reg.ru"
FTP_USER="your-username"
FTP_PASS="your-password"
FTP_PATH="/public_html/"

echo "🚀 Загружаем TalkSpice на REG.RU..."

# Проверяем наличие lftp
if ! command -v lftp &> /dev/null; then
    echo "❌ lftp не установлен. Установите: brew install lftp"
    exit 1
fi

# Загружаем файлы
lftp -c "
open -u $FTP_USER,$FTP_PASS $FTP_HOST
mirror --reverse --only-newer --exclude .git --exclude .DS_Store --exclude *.md . $FTP_PATH
"

if [ $? -eq 0 ]; then
    echo "✅ Загрузка завершена успешно!"
    echo "🌐 Сайт доступен по адресу: https://your-domain.ru"
else
    echo "❌ Ошибка при загрузке"
    exit 1
fi
