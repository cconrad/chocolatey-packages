$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.mudlet.org/wp-content/files/Mudlet-4.17.2-windows-installer.exe'

  checksum      = '67cfbfb33c11a0c6b2295083c4c9b157dd68d4fb82e500709625e04722fe124f'
  checksumType  = 'sha256'

  silentArgs    = '/silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
