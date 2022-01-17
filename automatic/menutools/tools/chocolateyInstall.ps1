$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  url           = 'https://github.com/navossoc/MenuTools/releases/download/1.0.2/menutools-setup-1.0.2.exe'
  validExitCodes= @(0)
  checksum      = '3FC6C21AD78D1BDBEF8464B02FAC7735AC2BC8B131063021AFA037DF617A258C'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
