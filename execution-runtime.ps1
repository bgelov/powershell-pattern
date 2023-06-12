# Powershell script timer

$watch = [System.Diagnostics.Stopwatch]::StartNew()
$watch.Start() # Start timer

# Your script

$watch.Stop() # Stop timer
Write-Host $watch.Elapsed # Result
