function mouse_battery() {
  mouse_battery=$(ioreg -r -l -k "BatteryPercent" | grep '"BatteryPercent" =' | awk '{print $3}')
  echo -ne $FG[cyan]$FX[bold]"Mouse: "
  echo -ne $FG[yellow]$FX[bold]$mouse_battery
  echo $FG[cyan]$FX[bold]"%"
  echo ""
}
