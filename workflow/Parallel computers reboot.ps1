# Parallel reboot comps

$computer =  get-content "C:\temp\reboot.txt" 

workflow comprestart {
    param ([string[]]$computer)
    foreach -parallel ($comp in $computer) {
        Restart-Computer -PSComputerName $comp -Force
    }
}

comprestart -Computer $computer