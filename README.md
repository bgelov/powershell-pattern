# powershell-pattern
Some usefull powershell patterns

# Notes
## Start-Process with ArgumentList
```
Start-Process -FilePath test.exe -ArgumentList -c 192.168.1.1
```

## Label expression
```
... | Select @{Label=Server; Expression={$ServerName}}
```

## Datetime
```
#Now
Get-Date

#Now
[datetime]::Now

#Now
Get-Date -Format "yyyy-MM-dd HH:mm:ss"

#Date 6 moth ago
(Get-Date).AddMonths(-6)

#Date 6 moth ago
$curDate = (Get-Date).AddMonths(-6)
$Date6Month = Get-Date $curDate -f "yyyy-MM-dd HH:mm:ss"
$Date6Month

# Current date
$curDate = Get-Date -format "MM-dd-yyyy HH:MM:ss"
$curDate 
pause

$curDate = Get-Date -format "MM-dd-yyyy"
$curDate 

$curLogDate = Get-Date -format "yyMMdd"
$curLogDate

$StartDate = (Get-Date "01.10.2020").AddDays(0) #start date

$curDate = Get-Date -format "dd-MM-yyyy"
$curDate 
```
