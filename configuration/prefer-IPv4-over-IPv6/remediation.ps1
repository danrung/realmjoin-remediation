#=============================================================================================================================
#
# Script Name:         Remediate.ps1
# Description:         Configure IPv4 is preferred over IPv6
#
#=============================================================================================================================

try {

    ##Variable declaration
    $path = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
    $key = "DisabledComponents"
    $value = "32"
    $type = "DWord"
    
    ##Check reg path and create path if missing
    if (!(Test-Path $path)) {
        New-Item -Path "$path" -Force
    }
    $actualValue = (Get-Item -Path "$path").GetValue("$key")
    if ($actualValue -ne $value) {
        ##Create key and set value
        Set-ItemProperty -Path "$path" -Name "$key" -Value "$value" -Type "$type" -Force
    } 

    #Succes if no errors occured.
    exit 0

}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}