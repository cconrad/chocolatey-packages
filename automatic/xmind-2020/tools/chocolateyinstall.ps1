$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = 'https://dl3.xmind.net/Xmind-for-Windows-x64bit-23.09.11172-202310122259.exe'

  softwareName  = 'XMind 23*'

  checksum64    = '0402CC0E0A8DB101D91792A639059F3234F441570FBE15B052A3B139CB8DDF4B'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
