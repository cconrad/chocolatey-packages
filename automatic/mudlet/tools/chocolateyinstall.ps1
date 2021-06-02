$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.mudlet.org/download/Mudlet-4.12.0-windows-installer.exe'

  checksum      = '421ee22e5e96a4828ba0f257a34516006c8e22fa3de8b3464e60f1c6f5a6d4a8'
  checksumType  = 'sha256'

  silentArgs    = '/silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
