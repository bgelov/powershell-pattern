# Powershell regexp position pattern


# Right (?= expression)
"My name is Powershell" -match "(\b\w+)\s(?=is)\b"
$Matches[1] #name

"My name is Powershell" -match "(?=\b\w+\sis)(\w+\b)"
$Matches[1] #name


# Left (?<= expression)
"My name is Powershell" -match "(?<=\bis\s)(\w+\b)"
$Matches[1] #Powershell


# Not Right (?! expression)
"My name is Powershell" -match "(\b\w+)\s(?!is)\b"
$Matches[1] #My


# Not Left (?<! expression)
"My name is Powershell" -match "(?<!\bis)\s(\w+\b)"
$Matches[1] #name

 


"My name is Powershell" -replace "(?<=\bname\s)(\w+\b)(?=\s\bpowershell)","-" #My name - Powershell


"Powershell", "PowerBI", "CMD", "PowerAutomate" -match "\b(?!power)\w+\b" #CMD

