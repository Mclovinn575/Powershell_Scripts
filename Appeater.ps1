# Made by Michael Love III
# Made for Powershell 7+
# Clear-Host
$remoteHost = Read-Host -Prompt "Enter Hostname"
# if ($remoteHost -eq "") {
#     $remotehost = HOSTNAME.EXE
# }
# Get user input to show product ID's
$query = Read-Host -Prompt "SEARCH"
$result = Get-CimInstance -ClassName CIM_Product -ComputerName $remoteHost | Where-Object {$_.Name -match $query}
Write-Host "=== RESULTS FOUND ===`n" -BackgroundColor Yellow -ForegroundColor Black
if($result.count -gt 1){
    $appslist = @{}
#  For search results yielding many results
    foreach($r in $result){
        $rnum = $result.IndexOf($r)
        $appslist.add($rnum,$r)
        write-host "$rnum :  " $r.Name $r.IdentifyingNumber
    }
    # Allows user to select application from list based on index
    $choice = Read-Host -Prompt "`nIndex to Uninstall < 'N' to exit >" 
    if ($choice.ToLower() -eq 'n') {
        exit
    }
    $key = $appslist[[int]$choice]
    Write-Host "`nSelected: " $key.Name
    $confirmation = Read-Host -Prompt "`nAre you sure you want to uninstall? <Y/N>"
    if ($confirmation.ToLower() -eq 'y') {
        Invoke-CimMethod -InputObject $key -MethodName "Uninstall" -ComputerName $remoteHost
        Write-Host "=== Software Uninstalled ===" -BackgroundColor Blue -ForegroundColor Black
    }
    
    
}
elseif ($result){
    # For search results yielding a single result
    write-host $result.Name $result.IdentifyingNumber

    $confirmation = Read-Host -Prompt "`nAre you sure you want to uninstall? <Y/N>"
    if ($confirmation.ToLower() -eq 'y') {
        Invoke-CimMethod -InputObject $result -MethodName "Uninstall" -ComputerName $remoteHost
        Write-Host "=== Software Uninstalled ===" -BackgroundColor Blue -ForegroundColor Black
    } 

# Will now properly look for ESD and EPA however having trouble getting them uninstalled remotely.

    if ($query -match 'Epson') {
    # Check for extra Epson Applications (Port assignment tool / S9000/2000 drivers)
        $epa = "\\$remoteHost\c$\Program Files (x86)\InstallShield Installation Information\{3D7277B3-B0BE-497C-A626-55F063254B5B}\setup.exe"
        $epa_installed = Test-Path  $epa

        $esd ="\\$remoteHost\c$\Program Files\EPSON\TMSDriver\SetupInfo\Setup.exe"
        $esd_installed = Test-Path $esd

        if ($esd_installed -eq $true) {
            Write-Host "`nS9000/2000 Drivers Detected" -BackgroundColor DarkYellow -ForegroundColor Black
            $confirmation = Read-Host -Prompt "`nAre you sure you want to uninstall? <Y/N>"
            if ($confirmation.ToLower() -eq 'y') {
                & $esd /u /s
            } 
        }
        if ($epa_installed -eq $true) {
            write-host "`nEpson Port Assingment Tool Detected" -BackgroundColor DarkYellow -ForegroundColor Black
            write-host "`n=== WARNING: This will cause a prompt on user end and require restart. ===" -ForegroundColor Black -BackgroundColor Red
            $confirmation = Read-Host -Prompt "`nAre you sure you want to uninstall? <Y/N>"
            if ($confirmation.ToLower() -eq 'y') {
                & $epa /u /s
            } 

        }
        
        
    }  

}
else {
   
    Write-Host "`n*** NONE ***`n" -ForegroundColor Red -BackgroundColor Black

}



