$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://dl3.xmind.net/XMind-2021-for-Windows-32bit-11.0.0-202105270133.exe'
  url64bit      = 'https://dl3.xmind.net/XMind-2021-for-Windows-64bit-11.0.0-202105270001.exe'

  softwareName  = 'XMind 10*'

  checksum      = 'f6f7915ba6a7306d47c471c0190a4c0e8ef044e543ac1f5a216abef2c17e7a20'
  checksumType  = 'sha256'
  checksum64    = 'd2b3ab584c2fe676e7b32246d0e52fdb964c74745f36fffe5ff4a2590f854180'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
