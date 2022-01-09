$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.mudlet.org/download/Mudlet-4.14.1-windows-installer.exe'

  checksum      = '1f95e596edafb30fc03432edaa810295aca08b2cf47f66c0730b782f2f881807'
  checksumType  = 'sha256'

  silentArgs    = '/silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
