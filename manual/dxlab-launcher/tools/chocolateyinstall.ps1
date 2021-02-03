$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$rootUrl = 'https://www.dxlabsuite.com/'
$linkPage = 'https://www.dxlabsuite.com/download.htm'

# Discover current URL to self-extracting EXE
$mainInstallerUrl = $rootUrl + ((Invoke-WebRequest $linkPage).Links | Where-Object href -match 'DXLabLauncher.*Archive\.exe' | Select-Object -First 1 -expand href)
$mainInstallerFilename = Split-Path $mainInstallerUrl -Leaf
$checksum = 'aba2f109297281b66a3a6285719030271a56858ca9b0dfc41c99983da23ba51e'
$downloadPath = Join-Path -Path $toolsDir -ChildPath $mainInstallerFilename

# Do not generate a shim for the downloaded EXEs
New-Item "$downloadPath.ignore" -Type file -Force | Out-Null
New-Item "$(Join-Path -Path $toolsDir -ChildPath '\DXLabLauncherSetup.exe').ignore" -Type file -Force | Out-Null

# Download and unzip
Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName -FileFullPath $downloadPath -Url $mainInstallerUrl -Checksum $checksum -ChecksumType 'sha256'
Get-ChocolateyUnzip -FileFullPath $downloadPath -Destination $toolsDir

# Run child installer, which supports silent installation
Install-ChocolateyInstallPackage -PackageName $env:ChocolateyPackageName -FileType 'EXE' -SilentArgs "/s C:\DXLab\instlog.txt" -File $(Join-Path -Path $toolsDir -ChildPath 'DXLabLauncherSetup.exe') -ValidExitCodes @(0) -UseOnlyPackageSilentArguments $true

# TODO Download and run updater

# Remove temporary files
Remove-Item $toolsDir -Recurse -Force
