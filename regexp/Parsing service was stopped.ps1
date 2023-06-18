#Pars ing "service was stopped"
"At 17:04 Firewall service was stopped." -match "(?<Time>\d\d:\d\d) (?<Service>\S+)"
$Matches.Time
$Matches.Service