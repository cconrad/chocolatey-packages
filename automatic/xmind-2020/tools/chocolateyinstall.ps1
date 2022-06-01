$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://dl3.xmind.net/XMind-for-Windows-32bit-11.1.2-202111072106.exe'
  url64bit      = 'https://dl3.xmind.net/XMind-for-Windows-64bit-12.0.2-202204260729.exe'

  softwareName  = 'XMind 10*'

  checksum      = '7099f476850e2a3a3d1a71dac1635af914412556dc3b1b3048fc68cec239d2cd'
  checksumType  = 'sha256'
  checksum64    = '55AB592E08A83C716D706C978B73CF2F85E360FA189CB379F379BDA9853A72F9'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
