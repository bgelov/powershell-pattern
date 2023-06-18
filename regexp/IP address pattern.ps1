#IP address pattern

$ipAddressPattern = '^((?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'

"192.168.1.1" -match $ipAddressPattern #True

"333.168.1.1" -match $ipAddressPattern #False




$regexp = [regex]"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"

$regexp.Matches("192.168.1.1") | %{ $_.Value }




#System.Net.IPAddress class

$ipAddress = "192.168.1.1"
if ($([ipaddress]$ipAddress)) { "ok" } else { "not ip" }


$ipAddress = "333.168.1.1"
if ($([ipaddress]$ipAddress)) { "ok" } else { "not ip" }