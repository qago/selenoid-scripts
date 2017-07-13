& $env:ComSpec /c taskkill /F /T /PID $env:SELENOID_PROCESS_PID
& $env:ComSpec /c taskkill /F /IM iexplore.exe
Remove-Item "$env:TEMP/selenoid-$env:SELENOID_PROCESS_PORT" -Recurse -Force
