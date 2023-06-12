# Parsing time ans service name from string

"At 17:04 Firewall service was stopped." -match "(?<Time>\d\d:\d\d) (?<Service>\S+)"

# Time
$Matches.Time
# Service name
$Matches.Service
