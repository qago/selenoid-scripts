param (
    [string]$pkg = $null
)

if (-Not $pkg) {
    write "usage: openDriver.ps1 <pkg>"
    exit 1
}

if (-not (Test-Path env:SELENOID_PROCESS_PORT)) { $env:SELENOID_PROCESS_PORT = '4444' }

hab pkg install $pkg

mkdir $env:TEMP/selenoid-$env:SELENOID_PROCESS_PORT
hab pkg exec $pkg IEDriverServer.exe --extract-path=$env:TEMP/selenoid-$env:SELENOID_PROCESS_PORT --port=$env:SELENOID_PROCESS_PORT
