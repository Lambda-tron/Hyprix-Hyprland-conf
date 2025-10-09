#!/bin/bash

# Battery info via ACPI
if command -v acpi >/dev/null 2>&1; then
  # Example acpi -b: "Battery 0: Discharging, 58%, 02:15:00 remaining"
  acpi_line=$(acpi -b 2>/dev/null | head -n1)
  if [[ -n "$acpi_line" ]]; then
    batt_percent=$(echo "$acpi_line" | awk -F', ' '{print $2}')
    batt_status=$(echo "$acpi_line" | awk -F': ' '{print $2}' | awk -F', ' '{print $1}')
    battery_display="$batt_percent ($batt_status)"
  else
    battery_display="No Battery"
  fi
else
  battery_display="ACPI not found"
fi

# Date & time
datetime=$(date +"%Y-%m-%d %H:%M:%S")

# Audio volume (default sink)
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n1 | awk '{print $5}')
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
[ "$mute" = "yes" ] && vol="Muted"

# Mic info (default source)
micvol=$(pactl get-source-volume @DEFAULT_SOURCE@ | head -n1 | awk '{print $5}')
micmute=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
[ "$micmute" = "yes" ] && micstatus="Muted" || micstatus="$micvol"

# Output nicely
echo "  Battery: $battery_display"
echo "  Date/Time: $datetime"
echo "  Speaker: $vol |   Mic: $micstatus"

#  IP address (wlan0)
ip_addr=$(ip -4 addr show wlan0 | awk '/inet / {print $2}' | cut -d/ -f1)
[ -z "$ip_addr" ] && ip_addr="No network"
echo "  wlan0: $ip_addr"

#  Block devices (name + size)
lsblk -dn -o NAME,SIZE | while read name size; do
  echo " -$name: $size"
done

