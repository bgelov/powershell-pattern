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
