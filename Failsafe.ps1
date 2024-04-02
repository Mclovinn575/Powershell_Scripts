# Made by Michael Love III

param(
    [Parameter(Mandatory)]
    [string]
    $Computer,
    [Parameter(Mandatory)]
    [int]
    $Time)
   

# Clear-Host
# $computer = Read-Host -Prompt "Hostname"
# [int]$time = Read-Host -Prompt "Shutdown Timer (MIN)"
$converted = $time * 60
$date = Get-Date
$restartTime = $date.AddMinutes($time)
shutdown.exe /m \\$computer /r /t $converted
Write-Host "`n=== RESTART TIMER INITIATED ($time mins) ===" -BackgroundColor Yellow -ForegroundColor Black
Write-Host "`nSystem will be restarted at $restartTime "
Read-Host "`nPress < ENTER > to abort shutdown on remote system"
shutdown.exe /m \\$computer /a
Write-Host "=== SHUTDOWN CANCELLED ===" -ForegroundColor Black -BackgroundColor Green


