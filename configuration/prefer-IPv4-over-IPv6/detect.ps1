#=============================================================================================================================
#
# Script Name:         Detect.ps1
# Description:         Detect if IPv4 is preferred over IPv6

#=============================================================================================================================

# define Variables
try {

    ##Variable declaration
    $path = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
    $key = "DisabledComponents"
    $value = "32"
    
    ##Get current value    
    $actualValue = (Get-Item -Path "$path").GetValue("$key")
    if ($actualValue -ne $value) {
        Write-Output "Not-Compliant"
        exit 1
    }
    else {
        Write-Output "Compliant"
        exit 0 
    }

}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}