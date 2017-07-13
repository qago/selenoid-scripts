param (
    [string]$pkg = $null
)

if (-Not $pkg) {
    write "usage: openDriver.ps1 <pkg>"
    exit 1
}

if (-not (Test-Path env:SELENOID_PROCESS_PORT)) { $env:SELENOID_PROCESS_PORT = '4444' }

mkdir $env:TMP/selenoid-$env:SELENOID_PROCESS_PORT
hab install $pkg
$env:TMP="$env:TMP/selenoid-$env:SELENOID_PROCESS_PORT"
$chrome_bin_path = Resolve-Path "$(hab pkg exec $pkg powershell -c 'Get-Command chrome.exe | Select-Object -ExpandProperty Definition')/.."
$chromedriver_exe_path = Resolve-path "$(hab pkg exec $pkg powershell -c 'Get-Command chromedriver.exe | Select-Object -ExpandProperty Definition')"
& $env:ComSpec /c mklink $chrome_bin_path\chromedriver.exe $chromedriver_exe_path
& "$chrome_bin_path/chromedriver.exe" --port=$env:SELENOID_PROCESS_PORT
