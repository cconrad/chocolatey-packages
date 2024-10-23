﻿$ErrorActionPreference = 'Stop';

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

# Move application directory
Copy-Item "$env:APPDATA\..\Local\Programs\Xmind" 'C:\Program Files\' -Recurse
Remove-Item "$env:APPDATA\..\Local\Programs\Xmind" -Recurse

# Define paths
$startMenuShortcutPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Xmind.lnk"
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$desktopShortcutPath = "$desktopPath\Xmind.lnk"
$publicDesktopPath = [System.Environment]::GetFolderPath('CommonDesktopDirectory')

# Modify shortcuts
$shell = New-Object -ComObject WScript.Shell
foreach ($shortcutPath in @($startMenuShortcutPath, $desktopShortcutPath)) {
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = 'C:\Program Files\Xmind\Xmind.exe'
    $shortcut.WorkingDirectory = 'C:\Program Files\Xmind'
    $shortcut.Save()
}

# Move start menu shortcut
Copy-Item $startMenuShortcutPath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\'
Remove-Item $startMenuShortcutPath

# Move desktop shortcut
Copy-Item $desktopShortcutPath $publicDesktopPath
Remove-Item "$desktopPath\Xmind.lnk"
