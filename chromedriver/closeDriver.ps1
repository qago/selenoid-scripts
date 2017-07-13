& $env:ComSpec /c taskkill /F /T /PID $env:SELENOID_PROCESS_PID
Remove-Item "$env:TMP/selenoid-$env:SELENOID_PROCESS_PORT" -Recurse -Force
