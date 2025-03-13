#!/bin/bash
options="Shutdown\nRestart\nSuspend\nHibernate\nLock\nLogout"

if command -v rofi &>/dev/null; then
  menu_cmd="rofi -dmenu -i -p Options"
elif command -v wofi &>/dev/null; then
  menu_cmd="wofi --dmenu --prompt=Options"
else
  echo "ERROR" >&2
  exit 1
fi

chosen=$(echo -e "$options" | $menu_cmd)

case "$chosen" in
  "Shutdown") systemctl poweroff ;;
  "Restart") systemctl reboot ;;
  "Suspend") systemctl suspend ;;
  "Hibernate") systemctl hibernate ;;
  "Lock") dm-tool lock ;;
  "Logout") pkill -KILL -u $USER ;;
  *) exit 1 ;;
esac
