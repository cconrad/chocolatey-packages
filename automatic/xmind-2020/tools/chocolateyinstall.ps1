$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://dl3.xmind.net/XMind-for-Windows-32bit-11.1.2-202111072106.exe'
  url64bit      = 'https://dl3.xmind.net/XMind-for-Windows-64bit-12.0.3-202206241736.exe'

  softwareName  = 'XMind 12*'

  checksum      = '7099f476850e2a3a3d1a71dac1635af914412556dc3b1b3048fc68cec239d2cd'
  checksumType  = 'sha256'
  checksum64    = '3C2A264125E31A22A5B1D1B92E8D93671498B5F3D093BEBDAD2566362695C183'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
