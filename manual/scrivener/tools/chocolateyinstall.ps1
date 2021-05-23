$ErrorActionPreference = "Stop"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = "EXE"
  url            = "https://scrivener.s3.amazonaws.com/Scrivener-installer-x86.exe"
  url64bit       = "https://scrivener.s3.amazonaws.com/Scrivener-installer.exe"
  checksum       = "3EFD34F5683A515243498F20E48F0766632B2D9732793B67B5C7BEDA3FBA86A5"
  checksum64     = "A66D135031250A9AFD7B747AC69F1036E478A343829C64D9981F980052F1A13C"
  checksumType   = "sha256"
  checksumType64 = "sha256"
  silentArgs     = "--mode unattended"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs