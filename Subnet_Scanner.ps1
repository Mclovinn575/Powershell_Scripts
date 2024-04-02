# Made by Michael Love III
# Made with the purpose to put in either the branch server or the subnet in order to get all computers on that subnet.

$subnet_1 = 0..31
$subnet_2 = 32..63
$subnet_3 = 64..95
$subnet_4 = 96..127
$subnet_5 = 128..159
$subnet_6 = 160..191
$subnet_7 = 192..223
$subnet_8 = 224..255



# Clear Screen
Clear-Host



$scan_choice = Read-Host -prompt "1. IP (Manual) `n2. Hostname (Automatic Detection)`n`n>>"
if ($scan_choice -eq 1) {
    # User put's in a subnet to scan theirselves.
    $subnet_ip = (Read-Host -Prompt "`nIP Address").Split('.')
    $third_octet = $subnet_ip[-2]
    $fourth_octet = $subnet_ip[-1]
    Write-Host "`n=== Scanning Subnet ===" -BackgroundColor Yellow -ForegroundColor Black
    if($subnet_1 -contains $fourth_octet){
            $subnet_floor = 0
            $subnet_ceiling = 31
            $num = $subnet_floor
            while($num -le $subnet_ceiling){
                Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
                $num++
            }
        }
        elseif($subnet_2 -contains $fourth_octet){
            $subnet_floor = 32
            $subnet_ceiling = 63
            $num = $subnet_floor
            while($num -le $subnet_ceiling){
                Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
                $num++
            }
        }
        elseif($subnet_3 -contains $fourth_octet){
            $subnet_floor = 64
            $subnet_ceiling = 95
            $num = $subnet_floor
            while($num -le $subnet_ceiling){
                Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
                $num++
            }
        }
        elseif($subnet_4 -contains $fourth_octet){
            $subnet_floor = 96
            $subnet_ceiling = 127
            $num = $subnet_floor
            while($num -le $subnet_ceiling){
                Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
                $num++
            }
        }
        elseif($subnet_5 -contains $fourth_octet){
            $subnet_floor = 128
            $subnet_ceiling = 159
            $num = $subnet_floor
            while($num -le $subnet_ceiling){
                Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
                $num++
            }
        }
        elseif($subnet_6 -contains $fourth_octet){
            $subnet_floor = 160
            $subnet_ceiling = 191
            $num = $subnet_floor
            while($num -le $subnet_ceiling){
                Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
                $num++
            }
        }
        elseif($subnet_7 -contains $fourth_octet){
            $subnet_floor = 192
            $subnet_ceiling = 223
            $num = $subnet_floor
            while($num -le $subnet_ceiling){
                Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
                $num++
            }
        }
        elseif($subnet_8 -contains $fourth_octet){
            $subnet_floor = 224
            $subnet_ceiling = 255
            $num = $subnet_floor
            while($num -le $subnet_ceiling){
                Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
                $num++
            }
        }
    Write-Host "`n=== All systems on subnet scanned ===`n" -BackgroundColor Green -ForegroundColor Black
}elseif ($scan_choice -eq 2) {
    # pings the system and then will grab the first three octets from it and proceed to scan 1-255 on that subnet.
    $system = read-host "`nHostname"
    Write-Host "`n=== Detecting Subnet... ===`n" -BackgroundColor Yellow -ForegroundColor Black
    $system_IP = ((Test-Connection $system -Count 1).Address.IPAddressToString).split('.')
    $third_octet = $system_IP[-2]
    $fourth_octet = $system_IP[-1]
    if($subnet_1 -contains $fourth_octet){
        $subnet_floor = 0
        $subnet_ceiling = 31
        $num = $subnet_floor
        while($num -le $subnet_ceiling){
            Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
            $num++
        }
    }
    elseif($subnet_2 -contains $fourth_octet){
        $subnet_floor = 32
        $subnet_ceiling = 63
        $num = $subnet_floor
        while($num -le $subnet_ceiling){
            Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
            $num++
        }
    }
    elseif($subnet_3 -contains $fourth_octet){
        $subnet_floor = 64
        $subnet_ceiling = 95
        $num = $subnet_floor
        while($num -le $subnet_ceiling){
            Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
            $num++
        }
    }
    elseif($subnet_4 -contains $fourth_octet){
        $subnet_floor = 96
        $subnet_ceiling = 127
        $num = $subnet_floor
        while($num -le $subnet_ceiling){
            Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
            $num++
        }
    }
    elseif($subnet_5 -contains $fourth_octet){
        $subnet_floor = 128
        $subnet_ceiling = 159
        $num = $subnet_floor
        while($num -le $subnet_ceiling){
            Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
            $num++
        }
    }
    elseif($subnet_6 -contains $fourth_octet){
        $subnet_floor = 160
        $subnet_ceiling = 191
        $num = $subnet_floor
        while($num -le $subnet_ceiling){
            Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
            $num++
        }
    }
    elseif($subnet_7 -contains $fourth_octet){
        $subnet_floor = 192
        $subnet_ceiling = 223
        $num = $subnet_floor
        while($num -le $subnet_ceiling){
            Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
            $num++
        }
    }
    elseif($subnet_8 -contains $fourth_octet){
        $subnet_floor = 224
        $subnet_ceiling = 255
        $num = $subnet_floor
        while($num -le $subnet_ceiling){
            Resolve-DnsName 172.24.$third_octet.$num -ErrorAction SilentlyContinue
            $num++
        }
    }

    Write-Host "`n=== All systems on subnet scanned ===`n" -BackgroundColor Green -ForegroundColor Black

}else{
    Write-Host "`n=== Incorrect Selection... Please relaunch and try again. ===" -BackgroundColor Red -ForegroundColor white
}
