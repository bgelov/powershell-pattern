# Compare date
$dateOld = '10.09.2018'
$dateOld = Get-Date $date2

$curDate = Get-Date
$curDate 

$dateOld -gt $curDate # False

$dateOld -lt $curDate # True
