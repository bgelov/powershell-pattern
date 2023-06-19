$computer =  get-content "C:\temp\servers.txt" 

workflow compping {
    param (
            [string[]]$computer,
            [int]$ThrottleLimit = 5,
            [string]$filePath = "D:\ping\"
          )

    foreach -parallel -throttlelimit $ThrottleLimit ($comp in $computer) {
        if (Test-Connection $comp -Count 1 -ErrorAction SilentlyContinue) { $workflow:pingTrue += "$comp`n" } else { $workflow:pingFalse += "$comp`n" }
    }

    $workflow:pingTrue | Out-File "$filePath\pingTrue1.txt"

    $workflow:pingFalse | Out-File "$filePath\pingFalse1.txt"
}

compping -Computer $computer 100

Remove-Item "$filePath\pingTrue.txt" -Force
Rename-Item "$filePath\pingTrue1.txt" "pingTrue.txt"

Remove-Item "$filePath\pingFalse.txt" -Force
Rename-Item "$filePath\pingFalse1.txt" "pingFalse.txt"


#Limit and time result
#32 - 00:01:41.4336474
#50 - 00:01:28.8505007
#100 - 00:01:09.1287879
#150 - 00:01:10.6387753
