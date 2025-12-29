#!/bin/bash
# Script pertama as devops: System Info

echo "========== Selamat Datang $(whoami) =========="
echo "Tanggal : $(date)"
echo "User : $(whoami)"
echo "Path Now : $(pwd)"
echo "Isi Folder : "
ls -la
echo "Disk Usage: $(df -h / | tail -1)"
echo
echo "Berhasil"
