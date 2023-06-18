#Parse server CN from DistinguishedName

"CN=MyServer,OU=Server,DC=bgelov,DC=ru" -match "^CN=([a-z_0-9_-]+)\,"
$Matches[1] #MyServer