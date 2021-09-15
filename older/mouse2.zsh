#!/usr/bin/zsh

devices=$(ioreg -r -l -k "BatteryPercent")

for x in $devices; do
  device=("${(@f)$( echo $x | grep '"Product" =' | awk '{print $4}' )}")
  charge=("${(@f)$( echo $x | grep '"BatteryPercent" =' | awk '{print $3}' )}")
done

for ((i = 1; i <= $#device; i++)); do
  if [ "${device[i]}" = 'Mouse' ];
  then
    MOUSE=${charge[i]}
  fi
  if [ "${device[i]}" = 'Keyboard' ];
  then
    KEYBOARD=${charge[i]}
  fi
done

echo "Mouse: $MOUSE %"
echo "Keyboard: $KEYBOARD %"
