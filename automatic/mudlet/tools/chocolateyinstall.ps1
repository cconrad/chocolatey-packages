$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.mudlet.org/download/Mudlet-4.15.1-windows-installer.exe'

  checksum      = 'd7bc18845f08e1c362eb12f3fb0fe5cd9c8c2f4712dcd0ca262098976de585ec'
  checksumType  = 'sha256'

  silentArgs    = '/silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
