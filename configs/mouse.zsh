function mouse_battery() {
devices=$(ioreg -r -l -k "BatteryPercent")

for x in $devices; do
  device=("${(@f)$(echo $x | grep '"Product" =' | awk '{print $4}')}")
  charge=("${(@f)$(echo $x | grep '"BatteryPercent" =' | awk '{print $3}')}")
done

for ((i = 1; i <= $#device; i++)); do
  echo -ne $FG[cyan]$FX[bold]"${device[i]}: "$FG[yellow]$FX[bold]${charge[i]}
  echo $FG[cyan]$FX[bold]"%"
done
echo ""
}
