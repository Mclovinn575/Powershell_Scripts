# Made by Michael Love III


$computer = Read-Host -Prompt "Enter Hostname"

$bitlocker_pass = (manage-bde -computername $Computer -protectors -get c:).trim()
$bitlocker_ID = $bitlocker_pass[$bitlocker_pass.IndexOf("Numerical Password:") + 1].trim("ID: ")  
manage-bde.exe -computername $computer -protectors -adbackup c: -id "$bitlocker_ID"
