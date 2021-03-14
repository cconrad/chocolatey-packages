$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.mudlet.org/download/Mudlet-4.11.1-windows-installer.exe'

  checksum      = '9a5b0b83a71f2f7180afb87263bab388a5bceaccb7f3e8380d3c20bf8c3802d0'
  checksumType  = 'sha256'

  silentArgs    = '/silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
