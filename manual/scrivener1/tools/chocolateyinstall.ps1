$ErrorActionPreference = "Stop"

$url = "https://scrivener.s3.amazonaws.com/legacy/Scrivener-legacy-installer.exe"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = "EXE"
  url            = $url
  checksum       = "2683FB9EB1E3EF488475C996382434E81598F77088E672E43B3B4D677767EB8E"
  checksumType   = "sha256"
  silentArgs     = "--mode unattended"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs