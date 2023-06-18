#Get email address from text

$Emails = Read-Host 'Enter string with emails'

$pattern = "([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})"
#or
#$pattern = "([a-zA-Z0-9_\-\.])+@bgelov.ru"

$results = ($Emails  | Select-String $pattern -AllMatches).Matches

$results | % { $_.Value }


