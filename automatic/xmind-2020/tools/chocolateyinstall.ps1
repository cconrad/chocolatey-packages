$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://dl3.xmind.net/XMind-2020-for-Windows-32bit-10.3.1-202101070059.exe'
  url64bit      = 'https://dl3.xmind.net/XMind-2020-for-Windows-64bit-10.3.1-202101070032.exe'

  softwareName  = 'XMind 10*'

  checksum      = '2a0893610ce3bf5c15af81b832c3d5ec403059f35c523a3a19fcb67bd8878817'
  checksumType  = 'sha256'
  checksum64    = '6fd240b6127999f40cdb4c988131dc3318dbfcce5d2f2ceeef19a5005d247bf8'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
