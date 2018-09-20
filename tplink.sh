#!/bin/bash

# <bitbar.title>TP-Link smartplug bitbar plugin</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Niklas Tegnander</bitbar.author>
# <bitbar.author.github>nikteg</bitbar.author.github>
# <bitbar.desc>Control your TP-Link smartplug with bitbar!</bitbar.desc>
# <bitbar.dependencies>python</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/nikteg/tplink-bitbar-plugin/</bitbar.abouturl>

export PATH="/usr/local/bin:$PATH"

# Populate plug IP address
export PLUG_IP=""

STATE_FILE="$HOME/.tplink_state"

function power() {
  tplink -t 192.168.1.52 -c $1
  echo "$1" > "$STATE_FILE"
}

if grep -Fxq "off" "$STATE_FILE"; then
  echo "🔇 | bash=$0 param1=on terminal=false refresh=true"
else
  echo "🔊 | bash=$0 param1=off terminal=false refresh=true"
fi

case "$1" in
  on)
  power on
  ;;
  off)
  power off
  ;;
  *)
  exit
esac