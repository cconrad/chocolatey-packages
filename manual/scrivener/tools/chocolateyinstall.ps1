$ErrorActionPreference = "Stop"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = "EXE"
  url64bit       = "https://scrivener.s3.amazonaws.com/Scrivener-installer.exe"
  checksum64     = "A9F6A14C20CF178D0EB36C8D7087E2EFEF2F03CE74BE79D54DE577EC6FDFA373"
  checksumType64 = "sha256"
  silentArgs     = "--mode unattended"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs