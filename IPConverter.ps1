# IP CONVERTER!
# Will automatically generate error log file 
# MADE BY MICHAEL LOVE III

$syspath = Read-Host -Prompt "`nEnter PATH of file systems are in"
$Error.clear()
$computerPath = $syspath.Trim('"')
$computers = Get-Content $computerPath

foreach($computer in $computers){
    $ip = Resolve-DnsName -Name $computer | Select-Object ipaddress
    write-host $ip.ipaddress
}


