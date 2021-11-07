$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://dl3.xmind.net/XMind-for-Windows-32bit-11.1.0-202109232316.exe'
  url64bit      = 'https://dl3.xmind.net/XMind-for-Windows-64bit-11.1.1-202110191919.exe'

  softwareName  = 'XMind 10*'

  checksum      = '4d4f978fa13265accfedd0f34271c2e3188a6c8653c7be42184c615879849b3d'
  checksumType  = 'sha256'
  checksum64    = '33eac4059b3c174d77b6abfd7a1ac457c425ad688e46bac48d6eed7901be5759'
  checksumType64= 'sha256'

  silentArgs   = '/allUsers /S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
