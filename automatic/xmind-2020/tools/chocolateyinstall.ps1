$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://dl3.xmind.net/XMind-for-Windows-32bit-11.0.2-202107132359.exe'
  url64bit      = 'https://dl3.xmind.net/XMind-for-Windows-64bit-11.0.2-202107130605.exe'

  softwareName  = 'XMind 10*'

  checksum      = 'b413e376231f95ba20586185eedf7cb2cf7810246bae800b7f9c522363042a9d'
  checksumType  = 'sha256'
  checksum64    = 'bf12e68c04b7cc013e4a94dd60d383fe4b746d300be7bbc04e0921d394b2a32c'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
