#!/usr/bin/env bash

echo "========================================="
echo "        KEDY USERBOT INSTALLER           "
echo "========================================="

# Termux / Linux paket güncellemesi ve Python kontrolü
if [ -d "/data/data/com.termux/files/usr" ]; then
    pkg update -y && pkg install python git libjpeg-turbo clang make -y
else
    echo "[i] Standart Linux ortamı algılandı."
fi

# Gereksiz çakışmaları önlemek için pip güncellemesi
python3 -m pip install --upgrade pip

# Kütüphaneleri yükle
echo "[*] Gereksiz hataları önlemek için cryptg kuruluyor..."
pip3 install --upgrade cryptg || true

echo "[*] requirements.txt üzerinden kütüphaneler yükleniyor..."
pip3 install -r requirements.txt

# config.env kontrolü
if [ ! -f "config.env" ]; then
    if [ -f "sample_config.env" ]; then
        cp sample_config.env config.env
        echo "[!] sample_config.env, config.env olarak kopyalandı."
        echo "[!] Lütfen 'config.env' dosyasını açıp API_KEY ve API_HASH bilgilerinizi girin!"
    fi
else
    echo "[i] config.env zaten mevcut."
fi

echo ""
echo "========================================="
echo "  [✓] Kurulum tamamlandı!                "
echo "  Başlatmak için: python3 main.py        "
echo "========================================="
