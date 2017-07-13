param (
    [string]$pkg = $null
)

if (-Not $pkg) {
    write "usage: openDriver.ps1 <pkg>"
    exit 1
}

if (-not (Test-Path env:SELENOID_PROCESS_PORT)) { $env:SELENOID_PROCESS_PORT = '4444' }

hab pkg install $pkg

mkdir $env:TMP/selenoid-$env:SELENOID_PROCESS_PORT
$env:TMP="$env:TMP/selenoid-$env:SELENOID_PROCESS_PORT"
hab pkg exec $pkg geckodriver.exe --port=$env:SELENOID_PROCESS_PORT
