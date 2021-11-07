$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.mudlet.org/download/Mudlet-4.13.1-windows-installer.exe'

  checksum      = '1b01e1f364c61e80f4e83a8ec69787e9bbb654dd95a1025e6d68d1e48a19f2f5'
  checksumType  = 'sha256'

  silentArgs    = '/silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
