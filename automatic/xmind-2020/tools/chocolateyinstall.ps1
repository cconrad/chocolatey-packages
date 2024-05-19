$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = 'https://dl3.xmind.app/Xmind-for-Windows-x64bit-24.04.10291-202404282358.exe'

  softwareName  = 'XMind 24*'

  checksum64    = '596567CECE0962C395CA666B174F6F36189A98670040456D409083CE7CC2E65D'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
