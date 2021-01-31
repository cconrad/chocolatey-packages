$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://www.mudlet.org/download/Mudlet-4.10.1-windows-installer.exe'

  softwareName  = 'Mudlet*'

  checksum      = '660558f9661e3aeb68b474787f2331a8940271df982f48794e60f659bf6ef5dd'
  checksumType  = 'sha256'

  silentArgs    = '/silent'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
