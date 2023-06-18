# Examples of regular expressions in Powershell

# Match

"PowerShell" -match "power" #True
"Shell" -match "power" #False


"PowerShell", "Power", "Shell" -match "power" #PowerShell, Power


Get-Service | where {$_.Name -match "msi"}


"PowerShell" -cmatch "power" #False. cmatch = case sensitive


<#

\w — word. = [a-zа-я0-9_]
\d — digit. [0-9]
\s — space. " ", <TAB>, \n, ...
. - one symbol.

[^pdf] - ^ - without symbols
\W — [^\w] - everything but word
\D — [^\d] - everything but digit
\S — [^\s] -  everything but space
or use -notmatch


^ - \A - from start string
$ - \Z - \z (if without \n before) - end string


#>

Get-Service | where {$_.name -match "server$"} 


#\b - Boundaries
Get-Service | where {$_.name -match "\bLanmanServer\b"} 

#\B - non boundaries
Get-Service | where {$_.name -match "\Bserver"} 
Get-Service | where {$_.name -match "\Bserver\b"} 



#Quantifiers

Get-Service | where {$_.name -match "^[a-z]{3}$"} #3 symbols a-z

Get-Service | where {$_.name -match "^[a-z]{3,5}$"} #3-5 symbols a-z

Get-Service | where {$_.name -match "^[a-z]{5,}$"} #5 symbols a-z and more

<#
+ - {1,} - one or more symbols
* — {0,} - any symbols or without symbols
? — {0,1} - one symbol or 0 symbols

#>



#Match OR


Get-Service | where {$_.Name -match "v(d|s)s"}


Get-Service | where {$_.Name -match "svc|srv"}


Get-Service | where {$_.Name -match "s(vc|rv)"}


#only one symbol d or s
Get-Service | where {$_.Name -match "v[ds]s"}

Get-Service | where {$_.Name -match "s[vcr]+$"}





#Replace / creplace

"Hello, Powershell" -replace "PowerShell", "CMD" #Hello, CMD

"Hello, Powershell" -replace "Hello, " #Powershell


#Split / csplit

"Hello, Powershell" -split "\s"
<#
Hello,
Powershell
#>


"Hello, my name is Powershell" -split "\s",3
<#
Hello,
my
name is Powershell
#>


"Hello, my name is Powershell" -replace "P.*" #Hello, my name is 


"Hello, my name is Powershell" -replace "P.*?" #Hello, my name is owershell


"Hello, my name is Powershell" -replace "is.*?\s" #Hello, my name Powershell



#Regexp grouping

"My name is Powershell." -match "(\w+\s){3}(\w+)\.$"
<#
Name                           Value                                                                                                                           
----                           -----                                                                                                                           
2                              Powershell                                                                                                                      
1                              is                                                                                                                              
0                              My name is Powershell.  
#>


"My name is Powershell." -match "(\w+\s)(\w+)"
$Matches
<#
Name                           Value                                                                                                                           
----                           -----                                                                                                                           
2                              name                                                                                                                            
1                              My                                                                                                                              
0                              My name     
#>


"My name is Powershell." -match "(\w+)\s(\w+)\.$"
$Matches
<#
Result with 2 groups
Name                           Value                                                                                                                           
----                           -----                                                                                                                           
2                              Powershell                                                                                                                      
1                              is                                                                                                                              
0                              is Powershell. 
#>




"My name is Powershell." -match "((\w+)\s(\w+))\.$"
$Matches
<#
Result with 3 groups
Name                           Value                                                                                                                           
----                           -----                                                                                                                           
3                              Powershell                                                                                                                      
2                              is                                                                                                                              
1                              is Powershell                                                                                                                   
0                              is Powershell.  
#>



#(?<name> subexpression) or (?'name' subexpression)
"My name is Powershell." -match "(?<firstgroup>\w+)\s(?<secondgroup>\w+)\.$" #or "My name is Powershell." -match "(?'firstgroup'\w+)\s(?'secondgroup'\w+)\.$"
$Matches
<#
Name                           Value                                                                                                                           
----                           -----                                                                                                                           
firstgroup                     is                                                                                                                              
secondgroup                    Powershell                                                                                                                      
0                              is Powershell. 
#>
$Matches.firstgroup #is
$matches.secondgroup #Powershell



#Backreference

"My name is is Powershell." -match "(\w+)\s(\1)"
$Matches
<#
Name                           Value                                                                                                                           
----                           -----                                                                                                                           
2                              is                                                                                                                              
1                              is                                                                                                                              
0                              is is
#>



"My name is is Powershell." -match "(?<firstgroup>\w+)\s(\k<firstgroup>)"
$Matches
<#
Name                           Value                                                                                                                           
----                           -----                                                                                                                           
2                              is                                                                                                                              
1                              is                                                                                                                              
0                              is is
#>





"My name is is Powershell." -match "(?:\w+\s)(\w+)\.$"
$Matches
<#
Result only second group. ?: - exclude group in result
Name                           Value                                                                                                                           
----                           -----                                                                                                                           
1                              Powershell                                                                                                                      
0                              is Powershell.    
#>



