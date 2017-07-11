mkdir $env:TMP/selenoid-$env:SELENOID_PROCESS_PORT
$env:TMP="$env:TMP/selenoid-$env:SELENOID_PROCESS_PORT"
$chrome_bin_path = Resolve-path "$(Get-Command chrome.exe | Select-Object -ExpandProperty Definition)/.."
$chromedriver_exe_path = Resolve-path "$(Get-Command chromedriver.exe | Select-Object -ExpandProperty Definition)"
& $env:ComSpec /c mklink $chrome_bin_path\chromedriver.exe $chromedriver_exe_path
& "$chrome_bin_path/chromedriver.exe" --port=$env:SELENOID_PROCESS_PORT
