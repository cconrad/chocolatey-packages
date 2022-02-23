$ErrorActionPreference = "Stop"

$packageArgs = @{
  PackageName   = $env:ChocolateyPackageName
  FileType      = "msi"
  SilentArgs    = "/quiet"
  Url           = "https://github.com/kovidgoyal/calibre/releases/download/v5.37.0/calibre-5.37.0.msi"
  Url64bit      = "https://github.com/kovidgoyal/calibre/releases/download/v5.37.0/calibre-64bit-5.37.0.msi"
  ValidExitCodes= @(0)
  Checksum      = "0154B758D0A4C2426BA7ECA09FD646C66F3118FA936F3C16935A0CFBEAAD057A"
  Checksum64    = "E84F13B9130A6B379A5D26D4EAC116C392B61D37AF38592A0B48EEA38CD59EAD"
  ChecksumType  = "sha256"
}

Install-ChocolateyPackage @packageArgs
