$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = 'https://dl3.xmind.app/Xmind-for-Windows-x64bit-24.04.10311-202405232355.exe'

  softwareName  = 'XMind 24*'

  checksum64    = '8d5efad51a0f466c63ba6901062cbe7958726b33c9c99a41e76f0c0d185b1162'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
