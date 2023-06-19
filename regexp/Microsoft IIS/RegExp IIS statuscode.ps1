
$errorLog = gc "./err.log"

<#
#Fields: date time s-ip cs-method cs-uri-stem cs-uri-query s-port cs-username c-ip cs(User-Agent) cs(Referer) sc-status sc-substatus sc-win32-status time-taken
2019-09-13 21:45:10 ::1 GET /webapp2 - 80 - ::1 Mozilla/5.0 - 500 0 0 5502
2019-09-13 21:45:10 ::1 GET /favicon.ico - 80 - ::1 Mozilla/5.0 http://localhost/webapp2 404 0 2 4
2019-09-13 21:45:11 ::1 GET /favicon.ico - 80 - ::1 Mozilla/5.0 http://localhost/webapp2 404 0 2 4
2019-09-13 21:45:12 ::1 GET /favicon.ico - 80 - ::1 Mozilla/5.0 http://localhost/webapp2 404 0 2 4
#>


$errorLog | where {$_ -match "(http\:\/\/localhost\/webapp2)\s([\d]{3})"} | foreach { $Matches[0] }

<#
http://localhost/webapp2 404
http://localhost/webapp2 404
http://localhost/webapp2 404
#>