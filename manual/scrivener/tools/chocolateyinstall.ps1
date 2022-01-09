$ErrorActionPreference = "Stop"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = "EXE"
  url            = "https://scrivener.s3.amazonaws.com/Scrivener-installer-x86.exe"
  url64bit       = "https://scrivener.s3.amazonaws.com/Scrivener-installer.exe"
  checksum       = "F5FEABCCC56EC9C263A59F785A56999EFDB6754C1EBF3990B95A07F313E3EC70"
  checksum64     = "C5FDC21C3761C1B7A4736D2509CDBA053881B25F091C6630261E9EB258A3B197"
  checksumType   = "sha256"
  checksumType64 = "sha256"
  silentArgs     = "--mode unattended"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs