$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl3.xmind.net/XMind-2020-for-Windows-32bit-10.3.0-202012160334.exe'
$url64      = 'https://dl3.xmind.net/XMind-2020-for-Windows-64bit-10.3.0-202012160243.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'XMind 10*'

  checksum      = 'D819CF3B0D2A715CEA219EA7DDF428325944DD696D8F3CEA9A92EDA48A47A056'
  checksumType  = 'sha256'
  checksum64    = '93F9F977C2D946F6907354E537AF4FBBA2CF6FDC2138E7A8A28FA4CFC058CEC9'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
