mkdir $env:TMP/selenoid-$env:SELENOID_PROCESS_PORT
$env:TMP="$env:TMP/selenoid-$env:SELENOID_PROCESS_PORT"
geckodriver.exe --port=$env:SELENOID_PROCESS_PORT
