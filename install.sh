#!/data/data/com.termux/files/usr/bin/bash
#=====================================================================
#  NullShell installer
#  Owner: Hari Jadhav Ji  |  GitHub: nullkrishn3  |  TG: nullkrishn
#
#  Is file ko chalao taaki NullShell kisi bhi folder se chal jaye:
#      bash install.sh
#  (Yeh NullShell ko Termux ke bin me install kar deta hai.)
#=====================================================================
set -uo pipefail

HERE="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"
SCRIPT="$HERE/nullshell"
[ -f "$SCRIPT" ] || SCRIPT="$HERE/NullShell"
[ -f "$SCRIPT" ] || { echo "[X] nullshell script is folder me nahi mili: $HERE"; exit 1; }

echo "[>] NullShell install kar raha hoon..."
bash "$SCRIPT" --install
