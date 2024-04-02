# Made by MICHAEL LOVE III




[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $System,
    [Parameter(Mandatory)]
    [string]
    $Message)


# Was testing out parameters. Will default to my system for now unless provided a new system.


# Prompt the user for the recipient System
# $System = Read-Host -Prompt "Enter Recipient System"

# Prompt the user for the message
# $Message = Read-Host -Prompt "Enter Message"
msg.exe console /server:$System /time 0 "$Message"
