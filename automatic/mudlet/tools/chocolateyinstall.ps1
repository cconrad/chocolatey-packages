$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.mudlet.org/wp-content/files/Mudlet-4.18.5-windows-32-installer.exe'

  checksum      = '71a892e025a06be890100f3db7835dc5190a6da9f87179e48f352ad5c050484c'
  checksumType  = 'sha256'

  silentArgs    = '/silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
