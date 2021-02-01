$ErrorActionPreference = 'Stop';

$env:ChocolateyPackageName = 'dxlab-launcher' # <- DEBUG
$env:ChocolateyPackageFolder = $packagelibPath = $toolsDir   = 'C:\test' # <- DEBUG, WAS # "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum   = 'aba2f109297281b66a3a6285719030271a56858ca9b0dfc41c99983da23ba51e'

# Discover current URL to self-extracting EXE
$mainInstallerUrl = 'https://www.dxlabsuite.com/' + ((Invoke-WebRequest 'https://www.dxlabsuite.com/download.htm#Installing%20or%20Upgrading%20the%20DXLab%20Launcher').Links | Where-Object href -match 'DXLabLauncher.*Archive\.exe' | Select-Object -First 1 -expand href)

# Download and unzip
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url $mainInstallerUrl -UnzipLocation $toolsDir -Checksum $checksum -ChecksumType 'sha256'

# Location of log file
$logFile = $toolsDir + '\log.txt'

# Run real installer - which supports silent installation
Install-ChocolateyInstallPackage -PackageName $env:ChocolateyPackageName -FileType 'EXE' -SilentArgs "/s $logFile" -File ($toolsDir + '\DXLabLauncherSetup.exe') -ValidExitCodes @(0) -UseOnlyPackageSilentArguments $true

$softwareName  = 'DXLabLauncher' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

# TODO Remove temporary files
